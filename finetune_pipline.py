import os
import json
import base64
import glob
import random
import time
from pathlib import Path

from openai import OpenAI

# ================== 공통 설정 ==================

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

PHOTOS_DIR = os.path.join(PROJECT_ROOT, "Photos")
TRAIN_FILE = os.path.join(PROJECT_ROOT, "training_data.jsonl")
VAL_FILE = os.path.join(PROJECT_ROOT, "validation_data.jsonl")

# 데이터셋 분할용 시드/비율 (이미 jsonl 만들어져 있으면 안 씀)
DATASET_SEED = 2493141
VAL_RATIO = 0.2

# 파인튜닝용 시드
FINETUNE_SEED = 252622

# 파인튜닝에 사용할 베이스 모델
BASE_MODEL = "gpt-4.1-2025-04-14"

# 상태 폴링 간격(초)
POLL_INTERVAL = 30

# 데이터 다시 만들지 여부 
REGENERATE_DATA = False

# Prompts (Unity에서 쓰는 프롬프트와 정확히 동일해야 함)
SYSTEM_PROMPT = """당신은 Unity VR 브레드보드 시뮬레이터의 “회로 연결(토폴로지)”을 엄격하게 판정하는 심사관입니다.

입력:
- 브레드보드 스크린샷 1장(쥐색 배경 데이터셋)

목표:
- 전선/소자 연결 상태가 라벨 기준의 “정상(정답) 회로 연결”에 부합하는지 판정합니다.
- 결과(0/1)와 함께, 어떤 연결 근거로 그렇게 판단했는지(관점/근거)를 출력합니다.

필수 규칙(반드시 준수):
1) LED “발광/켜짐” 시각 효과는 완전히 무시
   - LED의 glow/밝기/emission/bloom/on-off처럼 “빛나 보이는지”는 근거로 쓰지 마세요.
   - “LED가 켜져 보인다/안 켜져 보인다”는 어떠한 필드에서도 언급하지 마세요.
   - LED는 2핀 소자이며, 두 핀이 어느 홀에 꽂혔는지만 중요합니다.

2) 오직 “연결(토폴로지)”만으로 판단
   - 근거로 사용할 수 있는 것은 아래뿐입니다:
     - 전선의 양 끝(각 끝이 꽂힌 홀)
     - 소자의 각 핀(리드)이 꽂힌 홀
     - 브레드보드 연속성 규칙(같은 스트립/레일이면 같은 노드)
   - 전선의 곡선 모양/굵기, 조명/그림자, 색감, UI 이펙트는
     “끝점/홀 위치”를 명확히 보여주지 않는 한 근거로 쓰지 마세요.

3) 브레드보드 규칙 적용
   - 브레드보드의 전기적 연속성(행/열 스트립, 전원 레일 등)을 적용해 “노드”를 추론하세요.
   - 추론된 연결 구조가 의도된 “정상 회로 연결 조건”과 일치하는지 비교하세요.

4) 보수적으로 판정
   - 핵심 연결이 가려져 있거나 애매해서 확신이 없다면 result=0으로 판정하세요.

출력 형식(반드시 ‘유효한 JSON’만 출력, 다른 텍스트 금지):
{
  "결과": 0 또는 1,
  "확신도": 0.0-1.0,
  "연결요약": {
    "전원레일": ["(+/- 레일이 보이면 관찰 내용)", "..."],
    "소자": ["소자명/종류 -> 핀/리드가 꽂힌 홀(또는 노드) 요약", "..."],
    "전선": ["전선 -> 양 끝이 꽂힌 홀(또는 노드) 요약", "..."],
    "추론노드": ["노드A: (같은 스트립/레일로 묶인 홀들) -> 연결 관계", "노드B: ..."]
  },
  "판단근거": [
    "오직 연결 사실만: 어떤 연결이 정상 조건과 일치했는지",
    "오직 연결 사실만: 어떤 연결이 불일치/누락/단선인지"
  ],
  "불확실한점": [
    "가림/해상도/각도 때문에 확인이 어려웠던 연결(없으면 []로)"
  ]
}

추가 금지사항:
- LED가 켜졌는지/안 켜졌는지 언급 금지(반드시 무시).
- JSON 밖의 문장 출력 금지.

이제 입력 이미지를 분석하고 위 JSON만 출력하세요.

출력 규칙:
- 반드시 1번째 줄은 0 또는 1 한 글자만 출력한다(공백/따옴표/추가문자 금지).
- 2번째 줄부터는 한국어 JSON으로 판단 근거를 출력한다.
- LED가 켜져 보이는지(발광/이펙트)는 근거로 절대 사용하지 말고, 전선/소자 핀의 연결(홀/노드)만으로 판단한다."""

USER_INSTRUCTION = (
    "Analyze this breadboard circuit screenshot following the System Prompt. Output in the required format."
)


# ================== 1. 데이터셋 생성 부분 (기존 코드) ==================

def encode_image(image_path):
    with open(image_path, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode("utf-8")


def write_jsonl(file_list, output_filename):
    count = 0
    with open(output_filename, "w", encoding="utf-8") as outfile:
        for img_path, label in file_list:
            try:
                base64_image = encode_image(img_path)
                entry = {
                    "messages": [
                        {"role": "system", "content": SYSTEM_PROMPT},
                        {
                            "role": "user",
                            "content": [
                                {"type": "text", "text": USER_INSTRUCTION},
                                {
                                    "type": "image_url",
                                    "image_url": {
                                        "url": f"data:image/png;base64,{base64_image}"
                                    },
                                },
                            ],
                        },
                        {"role": "assistant", "content": label},
                    ]
                }
                json.dump(entry, outfile)
                outfile.write("\n")
                count += 1
            except Exception as e:
                print(f"Failed to process {img_path}: {e}")
    return count


def create_dataset():
    """
    Photos/1/*.png, Photos/0/*.png 에서
    training_data.jsonl / validation_data.jsonl 생성
    """
    print("\n--- Generating Training & Validation Data ---")
    if not os.path.exists(PHOTOS_DIR):
        print(f"Error: Photos directory not found at {PHOTOS_DIR}")
        return

    random.seed(DATASET_SEED)
    print(f"🌱 Dataset seed set to: {DATASET_SEED}")

    # Gather paths
    path_1 = os.path.join(PHOTOS_DIR, "1", "*.png")
    files_1 = glob.glob(path_1)
    print(f"Found {len(files_1)} correct (1) images.")

    path_0 = os.path.join(PHOTOS_DIR, "0", "*.png")
    files_0 = glob.glob(path_0)
    print(f"Found {len(files_0)} incorrect (0) images.")

    # Shuffle and split 1s
    random.shuffle(files_1)
    split_idx_1 = int(len(files_1) * (1 - VAL_RATIO))
    train_1 = files_1[:split_idx_1]
    val_1 = files_1[split_idx_1:]

    # Shuffle and split 0s
    random.shuffle(files_0)
    split_idx_0 = int(len(files_0) * (1 - VAL_RATIO))
    train_0 = files_0[:split_idx_0]
    val_0 = files_0[split_idx_0:]

    # Combine
    train_files = [(f, "1") for f in train_1] + [(f, "0") for f in train_0]
    val_files = [(f, "1") for f in val_1] + [(f, "0") for f in val_0]

    # Shuffle combined lists
    random.shuffle(train_files)
    random.shuffle(val_files)

    print(f"📊 Split Ratio: {100 * (1 - VAL_RATIO):.0f}% Train / {100 * VAL_RATIO:.0f}% Validation")

    # Write files
    print(f"Writing {len(train_files)} training examples to {os.path.basename(TRAIN_FILE)}...")
    write_jsonl(train_files, TRAIN_FILE)

    print(f"Writing {len(val_files)} validation examples to {os.path.basename(VAL_FILE)}...")
    write_jsonl(val_files, VAL_FILE)

    print("✅ Data generation complete.")


# ================== 2. 파일 체크 & 업로드 ==================

def check_jsonl_files():
    """training_data.jsonl / validation_data.jsonl 존재 여부 확인"""
    if not os.path.exists(TRAIN_FILE):
        raise FileNotFoundError(f"training_data.jsonl not found at {TRAIN_FILE}")
    if not os.path.exists(VAL_FILE):
        raise FileNotFoundError(f"validation_data.jsonl not found at {VAL_FILE}")

    train_size = os.path.getsize(TRAIN_FILE)
    val_size = os.path.getsize(VAL_FILE)
    print(f"[check] training_data.jsonl size: {train_size} bytes")
    print(f"[check] validation_data.jsonl size: {val_size} bytes")


def upload_file(client: OpenAI, path: str) -> str:
    """fine-tune 용도 파일 업로드 후 file id 반환"""
    filename = os.path.basename(path)
    size = os.path.getsize(path)
    print(f"[upload] 업로드 중: {filename} ({size} bytes)")
    with open(path, "rb") as f:
        file_obj = client.files.create(file=f, purpose="fine-tune")
    print(f"[upload] 완료: {filename} → id={file_obj.id}")
    return file_obj.id


# ================== 3. 파인튜닝 생성 & 상태 모니터 ==================

def create_finetune_job(client: OpenAI, train_id: str, val_id: str):
    """파인튜닝 job 생성"""
    print("[ft] fine-tuning job 생성 중...")

    job = client.fine_tuning.jobs.create(
        model=BASE_MODEL,
        training_file=train_id,
        validation_file=val_id,
        seed=FINETUNE_SEED,
    )

    print(f"[ft] job 생성 완료: id={job.id}, status={job.status}")
    return job


def follow_job(client: OpenAI, job_id: str):
    """job 상태를 주기적으로 폴링하면서 실시간 출력"""
    print(f"[follow] fine-tuning 진행 상황 모니터링 시작 (job={job_id})")
    last_status = None

    while True:
        job = client.fine_tuning.jobs.retrieve(job_id)
        status = job.status

        if status != last_status:
            print("=" * 60)
            print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] status 변경: {last_status} → {status}")
            last_status = status

        print(
            f"[{time.strftime('%H:%M:%S')}] "
            f"status={job.status}, "
            f"trained_tokens={job.trained_tokens}, "
            f"model={job.model}"
        )

        if status in ("succeeded", "failed", "cancelled"):
            print("=" * 60)
            print(f"[done] 최종 status = {status}")
            if status == "succeeded":
                print(f"[done] fine-tuned model id = {job.fine_tuned_model}")
            else:
                print(f"[done] error = {job.error}")
            break

        time.sleep(POLL_INTERVAL)


# ================== 4. 엔트리 포인트 ==================

def main():
    api_key = os.getenv("OPENAI_API_KEY")
    if not api_key:
        raise RuntimeError("OPENAI_API_KEY 환경변수가 설정되어 있지 않습니다.")

    client = OpenAI(api_key=api_key)

    # (옵션) 데이터 다시 만들기
    if REGENERATE_DATA:
        create_dataset()
    else:
        print("[info] REGENERATE_DATA=False → 기존 training_data.jsonl / validation_data.jsonl 사용")

    # JSONL 파일 존재 확인
    check_jsonl_files()

    # 업로드
    train_file_id = upload_file(client, TRAIN_FILE)
    val_file_id = upload_file(client, VAL_FILE)

    # 파인튜닝 job 생성
    job = create_finetune_job(client, train_file_id, val_file_id)

    # 상태 실시간 모니터링
    follow_job(client, job.id)


if __name__ == "__main__":
    main()
