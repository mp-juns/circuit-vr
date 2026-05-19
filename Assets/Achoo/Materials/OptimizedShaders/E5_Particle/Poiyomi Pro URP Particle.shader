Shader "Hidden/Locked/.poiyomi/Poiyomi Pro URP Particle/873de983631816f499d561d0d543ca54"
{
	Properties
	{
		[HideInInspector] shader_master_label ("Poiyomi 10.0.0", Float) = 0
		[HideInInspector] shader_is_using_thry_editor ("", Float) = 0
		[HideInInspector] shader_locale ("0db0b86376c3dca4b9a6828ef8615fe0", Float) = 0
		[HideInInspector] footer_website ("{texture:{name:icon-poilogo,height:24},action:{type:URL,data:https://www.poiyomi.com},hover:WEBSITE}", Float) = 0
		[HideInInspector] footer_discord ("{texture:{name:icon-discord,height:24},action:{type:URL,data:https://discord.gg/Ays52PY},hover:DISCORD}", Float) = 0
		[HideInInspector] footer_patreon ("{texture:{name:icon-patreon-new,height:24},action:{type:URL,data:https://www.patreon.com/poiyomi},hover:PATREON}", Float) = 0
		[HideInInspector] footer_youtube ("{texture:{name:icon-youtube,height:24},action:{type:URL,data:https://www.youtube.com/poiyomi},hover:YOUTUBE}", Float) = 0
		[HideInInspector] footer_github ("{texture:{name:icon-github,height:24},action:{type:URL,data:https://github.com/poiyomi/PoiyomiToonShader},hover:GITHUB}", Float) = 0
		[HideInInspector] footer_bluesky ("{texture:{name:icon-bluesky,height:24},action:{type:URL,data:https://bsky.app/profile/poiyomi.com},hover:BLUESKY}", Float) = 0
		[HideInInspector] footer_twitter ("{texture:{name:icon-twitter,height:24},action:{type:URL,data:https://x.com/poiyomi},hover:X}", Float) = 0
		[Header(POIYOMI SHADER UI FAILED TO LOAD)]
		[Header(.    This is caused by scripts failing to compile. It can be fixed.)]
		[Header(.          The inspector will look broken and will not work properly until fixed.)]
		[Header(.    Please check your console for script errors.)]
		[Header(.          You can filter by errors in the console window.)]
		[Header(.          Often the topmost error points to the erroring script.)]
		[Space(30)][Header(Common Error Causes)]
		[Header(.    Installing multiple Poiyomi Shader packages)]
		[Header(.          Make sure to delete the Poiyomi shader folder before you update Poiyomi.)]
		[Header(.          If a package came with Poiyomi this is bad practice and can cause issues.)]
		[Header(.          Delete the package and import it without any Poiyomi components.)]
		[Header(.    Bad VRCSDK installation (e.g. Both VCC and Standalone))]
		[Header(.          Delete the VRCSDK Folder in Assets if you are using the VCC.)]
		[Header(.          Avoid using third party SDKs. They can cause incompatibility.)]
		[Header(.    Script Errors in other scripts)]
		[Header(.          Outdated tools or prefabs can cause this.)]
		[Header(.          Update things that are throwing errors or move them outside the project.)]
		[Space(30)][Header(Visit Our Discord to Ask For Help)]
		[Space(5)]_ShaderUIWarning0 (" → discord.gg/poiyomi ←    We can help you get it fixed!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         --{condition_showS:(0==1)}", Int) = -0
		[Space(1400)][Header(POIYOMI SHADER UI FAILED TO LOAD)]
		_ShaderUIWarning1 ("Please scroll up for more information!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     --{condition_showS:(0==1)}", Int) = -0
		[HideInInspector] _ForgotToLockMaterial (";;YOU_FORGOT_TO_LOCK_THIS_MATERIAL;", Int) = 1
		[ThryShaderOptimizerLockButton] _ShaderOptimizerEnabled ("", Int) = 1
		[HideInInspector] GeometryShader_Enabled("GEOMETRY SHADER ENABLED", Float) = 1
		[HideInInspector] Tessellation_Enabled("TESSELLATION ENABLED", Float) = 1
		[ThryWideEnum(Opaque, 0, Cutout, 1, TransClipping, 9, Fade, 2, Transparent, 3, Additive, 4, Soft Additive, 5, Multiplicative, 6, 2x Multiplicative, 7)]_Mode("Rendering Preset--{on_value_actions:[
		{value:0,actions:[{type:SET_PROPERTY,data:render_queue=2000},{type:SET_PROPERTY,data:_AlphaForceOpaque=1}, {type:SET_PROPERTY,data:render_type=Opaque},            {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=1}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=1}, {type:SET_PROPERTY,data:_OutlineDstBlend=0},  {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=0}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:1,actions:[{type:SET_PROPERTY,data:render_queue=2550},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=TransparentCutout}, {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=.5}, {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=1}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=1}, {type:SET_PROPERTY,data:_OutlineDstBlend=0},  {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:9,actions:[{type:SET_PROPERTY,data:render_queue=2560},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=TransparentCutout}, {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0.01},  {type:SET_PROPERTY,data:_SrcBlend=5}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=5}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=5}, {type:SET_PROPERTY,data:_OutlineDstBlend=10}, {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:2,actions:[{type:SET_PROPERTY,data:render_queue=3000},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0.002},  {type:SET_PROPERTY,data:_SrcBlend=5}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=5}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=5}, {type:SET_PROPERTY,data:_OutlineDstBlend=10}, {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:3,actions:[{type:SET_PROPERTY,data:render_queue=3000},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=1}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=1}, {type:SET_PROPERTY,data:_OutlineSrcBlend=1}, {type:SET_PROPERTY,data:_OutlineDstBlend=10}, {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:4,actions:[{type:SET_PROPERTY,data:render_queue=3000},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=1},  {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=1}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=1}, {type:SET_PROPERTY,data:_OutlineDstBlend=1},  {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:5,actions:[{type:SET_PROPERTY,data:render_queue=3000},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=4}, {type:SET_PROPERTY,data:_DstBlend=1},  {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=4}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=4}, {type:SET_PROPERTY,data:_OutlineDstBlend=1},  {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:6,actions:[{type:SET_PROPERTY,data:render_queue=3000},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=2}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=2}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=2}, {type:SET_PROPERTY,data:_OutlineDstBlend=0},  {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]},
		{value:7,actions:[{type:SET_PROPERTY,data:render_queue=3000},{type:SET_PROPERTY,data:_AlphaForceOpaque=0}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=4}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=2}, {type:SET_PROPERTY,data:_DstBlend=3},  {type:SET_PROPERTY,data:_SrcBlendAlpha=1}, {type:SET_PROPERTY,data:_DstBlendAlpha=1},  {type:SET_PROPERTY,data:_AddSrcBlend=2}, {type:SET_PROPERTY,data:_AddDstBlend=1}, {type:SET_PROPERTY,data:_AddSrcBlendAlpha=0}, {type:SET_PROPERTY,data:_AddDstBlendAlpha=1}, {type:SET_PROPERTY,data:_AlphaToCoverage=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}, {type:SET_PROPERTY,data:_OutlineSrcBlend=2}, {type:SET_PROPERTY,data:_OutlineDstBlend=3},  {type:SET_PROPERTY,data:_OutlineSrcBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineDstBlendAlpha=1}, {type:SET_PROPERTY,data:_OutlineBlendOp=0}, {type:SET_PROPERTY,data:_OutlineBlendOpAlpha=4}]}
		]}", Int) = 0
		[HideInInspector] m_mainCategory ("Color & Normals--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/color-and-normals/main},hover:Documentation}}", Float) = 0
		_Color ("Color & Alpha--{reference_property:_ColorThemeIndex}", Color) = (1, 1, 1, 1)
		[HideInInspector][ThryWideEnum(Off, 0, Theme Color 0, 1, Theme Color 1, 2, Theme Color 2, 3, Theme Color 3, 4, ColorChord 0, 5, ColorChord 1, 6, ColorChord 2, 7, ColorChord 3, 8, AL Theme 0, 9, AL Theme 1, 10, AL Theme 2, 11, AL Theme 3, 12)] _ColorThemeIndex ("", Int) = 0
		[sRGBWarning(true)]_MainTex ("Texture--{reference_properties:[_MainTexPan, _MainTexUV, _MainPixelMode, _MainTexStochastic, _MainIgnoreTexAlpha]}", 2D) = "white" { }
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _MainTexUV ("UV", Int) = 0
		[HideInInspector][Vector2]_MainTexPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ToggleUI]_MainPixelMode ("Pixel Mode", Float) = 0
		[HideInInspector][ToggleUI]_MainTexStochastic ("Stochastic Sampling", Float) = 0
		[HideInInspector][ToggleUI]_MainIgnoreTexAlpha ("Ignore Alpha", Float) = 0
		[Normal]_BumpMap ("Normal Map--{reference_properties:[_BumpMapPan, _BumpMapUV, _BumpScale, _BumpMapStochastic]}", 2D) = "bump" { }
		[HideInInspector][Vector2]_BumpMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _BumpMapUV ("UV", Int) = 0
		[HideInInspector]_BumpScale ("Intensity", Range(0, 10)) = 1
		[HideInInspector][ToggleUI]_BumpMapStochastic ("Stochastic Sampling", Float) = 0
		[sRGBWarning]_AlphaMask ("Alpha Map--{reference_properties:[_AlphaMaskPan, _AlphaMaskUV, _AlphaMaskInvert, _MainAlphaMaskMode, _AlphaMaskBlendStrength, _AlphaMaskValue], alts:[_AlphaMap]}", 2D) = "white" { }
		[HideInInspector][Vector2]_AlphaMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _AlphaMaskUV ("UV", Int) = 0
		[HideInInspector][ThryWideEnum(Off, 0, Replace, 1, Multiply, 2, Add, 3, Subtract, 4)]_MainAlphaMaskMode ("Blend Mode", Int) = 2
		[HideInInspector]_AlphaMaskBlendStrength ("Blend Strength", Float) = 1
		[HideInInspector]_AlphaMaskValue ("Blend Offset", Float) = 0
		[HideInInspector][ToggleUI]_AlphaMaskInvert ("Invert", Float) = 0
		_Cutoff ("Alpha Cutoff", Range(0, 1.001)) = 0.5
		[HideInInspector] m_start_Alpha ("Alpha Options--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/color-and-normals/alpha-options},hover:Documentation}}", Float) = 0
		[ToggleUI]_AlphaForceOpaque ("Force Opaque", Float) = 1
		_AlphaMod ("Alpha Mod", Range(-1, 1)) = 0.0
		[ThryWideEnum(Off, 0, 1R, 1, 1G, 2, 1B, 3, 1A, 4, 2R, 5, 2G, 6, 2B, 7, 2A, 8, 3R, 9, 3G, 10, 3B, 11, 3A, 12, 4R, 13, 4G, 14, 4B, 15, 4A, 16)] _AlphaGlobalMask ("Global Mask--{reference_property:_AlphaGlobalMaskBlendType}", Int) = 0
		[HideInInspector][ThryWideEnum(Add, 7, Subtract, 1, Multiply, 2, Divide, 3, Min, 4, Max, 5, Average, 6, Replace, 0)] _AlphaGlobalMaskBlendType ("Blending", Int) = 2
		[HideInInspector] m_end_Alpha ("Alpha Options", Float) = 0
		[HideInInspector] m_geoParticle ("Geometric Particles--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/extended-features/particle},hover:Documentation}}", Float) = 0
		_ParticleRandomSeedOffset ("Random Seed Offset", Range(0, 1)) = 0.069
		[ThryWideEnum(Off, 0, 1R, 1, 1G, 2, 1B, 3, 1A, 4, 2R, 5, 2G, 6, 2B, 7, 2A, 8, 3R, 9, 3G, 10, 3B, 11, 3A, 12, 4R, 13, 4G, 14, 4B, 15, 4A, 16)] _ParticleApplyGlobalMaskIndex ("Apply To GlobalMask--{reference_property:_ParticleApplyGlobalMaskBlendType}", Int) = 0
		[HideInInspector][ThryWideEnum(Add, 7, Subtract, 1, Multiply, 2, Divide, 3, Min, 4, Max, 5, Average, 6, Replace, 0)] _ParticleApplyGlobalMaskBlendType ("Blending", Int) = 0
		[HideInInspector]_ParticleBaseColorOverride ("MainTex Override", Color) = (1, 1, 1, 1)
		[ToggleUI]_ParticleOverrideBaseColor ("MainTex Color Override--{reference_property:_ParticleBaseColorOverride}", Float) = 1
		[HideInInspector] s_start_geoParticleSpawning ("Spawning--{persistent_expand:true,default_expand:true}", Float) = 0
		[ToggleUI]_ParticleRenderBaseMesh ("Render Base Mesh", Float) = 1
		_ParticleDensity ("Particles Per cm^2", Range(0, 4)) = 0.15
		[VectorLabel(Min, Max, link)]_ParticleFloatDistance ("Spawn Distance", Vector) = (1, 1.5, 0, 500)
		[sRGBWarning]_ParticleSpawnMask ("Spawn Mask--{reference_properties:[_ParticleSpawnMaskPan, _ParticleSpawnMaskUV, _ParticleSpawnMaskChannel, _ParticleSpawnMaskInvert]}", 2D) = "white" { }
		[HideInInspector][Vector2]_ParticleSpawnMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _ParticleSpawnMaskUV ("UV", Int) = 0
		[HideInInspector][Enum(R, 0, G, 1, B, 2, A, 3)]_ParticleSpawnMaskChannel ("Channel", Float) = 0
		[HideInInspector][ToggleUI]_ParticleSpawnMaskInvert ("Invert", Float) = 0
		[Enum(Off, 0, Red, 1, Green, 2, Blue, 3, Alpha, 4)]_ParticleSpawnMaskVertexColor ("Vertex Color Mask", Int) = 0
		[HideInInspector] s_end_geoParticleSpawning ("Spawning", Float) = 0
		[HideInInspector] s_start_geoParticleAppearance ("Appearance--{persistent_expand:true,default_expand:true}", Float) = 0
		[ThryRGBAPacker(RGB Color, A Alpha, sRGB, false)]_ParticleTexture ("Texture--{reference_properties:[_ParticleTexturePan, _ParticleTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_ParticleTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _ParticleTextureUV ("UV", Int) = 0
		_ParticleColor ("Color--{reference_property:_ParticleColorThemeIndex}", Color) = (1, 1, 1, 1)
		[HideInInspector][ThryWideEnum(Off, 0, Theme Color 0, 1, Theme Color 1, 2, Theme Color 2, 3, Theme Color 3, 4, ColorChord 0, 5, ColorChord 1, 6, ColorChord 2, 7, ColorChord 3, 8, AL Theme 0, 9, AL Theme 1, 10, AL Theme 2, 11, AL Theme 3, 12)] _ParticleColorThemeIndex ("", Int) = 0
		_ParticleColorBlendAlpha ("Color Blend Alpha", Range(0, 1)) = 1
		[ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Lighten, 5, Screen, 6, Subtract, 7, Add, 8, Overlay, 9, Mixed, 20)]_ParticleColorBlendMode ("Color Blend Mode", Int) = 0
		[ThryWideEnum(Replace, 0, Add, 1)]_ParticleEmissionBlendMode ("Emission Blend Mode", Int) = 0
		[VectorLabel(Min, Max, link)]_ParticleEmissionStrength ("Emission Range", Vector) = (0, 0, 0, 0)
		[VectorLabel(Min, Max, link)]_ParticleAlpha ("Alpha Range", Vector) = (1, 1, 0, 0)
		[VectorLabel(Min, Max, link)]_ParticleSize ("Particle Size", Vector) = (1.5, 2, 0.01, 100)
		_ParticleInheritNormal ("Inherit Mesh Normal", Range(0, 1)) = 0
		[HideInInspector] s_end_geoParticleAppearance ("Appearance", Float) = 0
		[HideInInspector] s_start_geoParticleMotion ("Motion--{persistent_expand:true,default_expand:true}", Float) = 0
		[ThryWideEnum(Still, 0, Outward, 1, Ping Pong, 2)] _ParticleMotionMode ("Motion Mode", Float) = 0
		_ParticleCycleDuration ("Cycle Duration (Seconds)", Range(0.1, 10.0)) = 2.0
		[VectorLabel(Min, Max, link)]_ParticleRotationSpeed ("Rotation Speed", Vector) = (-3, 3, -20, 20)
		[VectorLabel(Min, Max, link)]_ParticleTravelDistance ("Travel Distance--{condition_showS:(_ParticleMotionMode >= 1)}", Vector) = (50, 100, 0, 1000)
		[ThrySeperator(2, 5, 5)]
		[ThryRGBAPacker(X, Y, Z, NA, Linear, false)] _ParticleNoiseTex ("Noise Texture (RGB)--{reference_properties:[_ParticleNoiseTexPan, _ParticleNoiseTexUV]}", 2D) = "gray" { }
		[HideInInspector][Vector2]_ParticleNoiseTexPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _ParticleNoiseTexUV ("UV", Int) = 0
		[VectorLabel(Min, Max, link)]_ParticleNoiseStrength ("Noise Strength", Vector) = (0, 0, 0, 50)
		[VectorLabel(Min, Max, link)]_ParticleNoiseScrollSpeed ("Noise Scroll Speed", Vector) = (1, 1, 0, 0)
		[ThrySeperator(2, 5, 5)]
		[Vector3]_ParticleWorldDirection ("World Direction (XYZ)--{condition_showS:(_ParticleMotionMode >= 1)}", Vector) = (0, 1, 0, 0)
		_ParticleDirectionStrength ("Direction Strength--{condition_showS:(_ParticleMotionMode >= 1)}", Range(0, 1)) = 0
		_ParticleFaceDirection ("Align To Travel Direction--{condition_showS:(_ParticleMotionMode >= 1)}", Range(0, 1)) = 0
		[Ramp4]_ParticleDirectionRamp ("Direction Ramp--{condition_showS:(_ParticleMotionMode >= 1)}", Vector) = (0, 1, 0, 1)
		_ParticleSpawnDirectionCull ("Directional Cull--{condition_showS:(_ParticleMotionMode >= 1)}", Range(0, 1)) = 0
		[HideInInspector] s_end_geoParticleMotion ("Motion", Float) = 0
		[HideInInspector] s_start_geoParticleOverTime ("Over Time--{persistent_expand:true,default_expand:false}", Float) = 0
		[Ramp4]_ParticleSizeRamp ("Size", Vector) = (1, 1, 0, 1)
		[Ramp4]_ParticleAlphaRamp ("Alpha", Vector) = (1, 1, 0, 1)
		[Ramp4]_ParticleEmissionRamp ("Emission", Vector) = (1, 1, 0, 1)
		[Gradient]_ParticleLifetimeGradient ("Color", 2D) = "white" { }
		[HideInInspector] s_end_geoParticleOverTime ("Over Time", Float) = 0
		[HideInInspector] s_start_geoParticleSpriteSheet ("Sprite Sheet--{persistent_expand:true,default_expand:true, reference_property:_ParticleSpriteSheetEnabled}", Float) = 0
		[HideInInspector][ToggleUI]_ParticleSpriteSheetEnabled ("Enable Sprite Sheet", Float) = 0
		_ParticleSpriteSheetColumns ("Columns", float) = 1
		_ParticleSpriteSheetRows ("Rows", float) = 1
		[ThryWideEnum(Random, 0, Progress Based, 1, Time Based, 2)]_ParticleSpriteSheetFrameSelection ("Frame Selection", Int) = 0
		_ParticleSpriteSheetFPS ("FPS--{condition_showS:(_ParticleSpriteSheetFrameSelection==2)}", Float) = 10
		[ToggleUI]_ParticleSpriteSheetRandomStart ("Random Start Frame--{condition_showS:(_ParticleSpriteSheetFrameSelection==2)}", Float) = 0
		_ParticleSpriteSheetTotalFrames ("Total Frames (0 = auto)--{tooltip:Use when atlas isn't full. 0 = rows*columns}", float) = 0
		_ParticleSpriteSheetInset ("Frame Inset (texels)", Range(0, 2)) = 0
		_ParticleSpriteSheetFrameBias ("Frame Bias", Range(0, 0.01)) = 0
		[HideInInspector] s_end_geoParticleSpriteSheet ("Sprite Sheet", Float) = 0
		[HideInInspector] s_start_geoParticleAudioLink ("Audio Link--{persistent_expand:true,default_expand:false,condition_showS:_EnableAudioLink==1}", Float) = 0
		[ThryWideEnum(Off, 2, X(Frequency), 0, Y(Height), 1)] _ParticleALGradientSource ("Gradient Source", Int) = 2
		[ThryWideEnum(Waveform, 0, DFT Spectrum, 1, Four Band Random, 2, AutoCorrelator, 4, Bass, 5, Low Mid, 6, High Mid, 7, Treble, 8)] _ParticleALType ("AudioLink Type", Int) = 2
		_ParticleALWaveformScale ("Height Scale", Range(0, 10)) = 1.0
		_ParticleALWaveformSmoothing ("Waveform Smoothing--{condition_showS:(_ParticleALType == 0)}", Range(0, 1)) = 0.2
		[ThrySeperator(2, 2, 2)]
		[ToggleUI]_ParticleALReactiveEmission ("Emission", Float) = 1
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3, Volume, 4, AudioLink Type, 5)]_ParticleALReactiveEmissionBand ("Band--{condition_showS:(_ParticleALReactiveEmission==1)}", Int) = 0
		[Ramp4(normalized)]_ParticleALReactiveEmissionRamp ("Add Ramp--{condition_showS:(_ParticleALReactiveEmission==1)}", Vector) = (0, 0, 0, 1)
		[ThrySeperator(2, 2, 2)]
		[ToggleUI]_ParticleALSizeModulation ("Size", Float) = 1
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3, Volume, 4, AudioLink Type, 5)]_ParticleALSizeBand ("Band--{condition_showS:(_ParticleALSizeModulation==1)}", Int) = 0
		[Ramp4(normalized)]_ParticleALSizeRamp ("Add Ramp--{condition_showS:(_ParticleALSizeModulation==1)}", Vector) = (0, 0, 0, 1)
		[ThrySeperator(2, 2, 2)]
		[ToggleUI]_ParticleALRotationModulation ("Rotation Speed", Float) = 0
		[ThryWideEnum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3, Volume, 4, AudioLink Type, 5)] _ParticleALRotationBand ("Chrono Rotation Band--{condition_showS:(_ParticleALRotationModulation==1)}", Int) = 0
		[ThryWideEnum(Motion increases as intensity of band increases, 0, Above but Smooth, 1, Motion moves back and forth as a function of intensity, 2, Above but Smooth, 3, Fixed speed increase when the band is dark Stationary when light, 4, Above but Smooth, 5, Fixed speed increase when the band is dark Fixed speed decrease when light, 6, Above but Smooth, 7)]_ParticleALRotationType ("Chrono Motion Type--{condition_showS:(_ParticleALRotationModulation==1)}", Int) = 0
		_ParticleALRotationSpeed ("Chrono Rotation Speed--{condition_showS:(_ParticleALRotationModulation==1)}", Float) = 2.0
		[ThrySeperator(2, 2, 2)]
		[ToggleUI]_ParticleALNoiseModulation ("Noise Strength", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3, Volume, 4, AudioLink Type, 5)]_ParticleALNoiseBand ("Band--{condition_showS:(_ParticleALNoiseModulation==1)}", Int) = 1
		[Ramp4(normalized)]_ParticleALNoiseRamp ("Multiplier Ramp--{condition_showS:(_ParticleALNoiseModulation==1)}", Vector) = (1, 1, 0, 1)
		[ThrySeperator(2, 2, 2)]
		[ToggleUI]_ParticleALAlphaModulation ("Alpha", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3, Volume, 4, AudioLink Type, 5)]_ParticleALAlphaBand ("Band--{condition_showS:(_ParticleALAlphaModulation==1)}", Int) = 0
		[Ramp4(normalized)]_ParticleALAlphaRamp ("Add Ramp--{condition_showS:(_ParticleALAlphaModulation==1)}", Vector) = (0, 0, 0, 1)
		[ThrySeperator(2, 2, 2)]
		[ToggleUI]_ParticleALSpriteSheetFrameControl ("Sprite Sheet Frame Control--{condition_showS:(_ParticleSpriteSheetEnabled==1)}", Float) = 0
		[ThryWideEnum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)]_ParticleALSpriteSheetBand ("Frame Band--{condition_showS:(_ParticleALSpriteSheetFrameControl==1 && _ParticleSpriteSheetEnabled==1)}", Int) = 0
		[HideInInspector] s_end_geoParticleAudioLink ("Audio Link", Float) = 0
		[HideInInspector] s_start_geoParticleUVMod ("UV Mod--{persistent_expand:true,default_expand:false}", Float) = 0
		[ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _ParticlePosUVSource ("Particle Pos UV Source", Int) = 0
		[ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Off, 4)] _ParticlePosUVDestination ("Apply to UV Destination", Int) = 4
		[HideInInspector] s_end_geoParticleUVMod ("UV Mod", Float) = 0
		[HideInInspector] s_start_geoParticlePerformance ("Spawn Reduction--{persistent_expand:true,default_expand:false, reference_property:_ParticleSpawnReductionEnabled}", Float) = 0
		[HideInInspector][ToggleUI]_ParticleSpawnReductionEnabled ("Enable Spawn Reduction", Float) = 1
		[VectorLabel(Near, Far, link)]_ParticleSpawnDistances ("Spawn Distances", Vector) = (3, 8, 0, 0)
		[VectorLabel(Near, Far, link)]_ParticleSpawnReduction ("Spawn Multiplier", Vector) = (1.0, 0, 0, 0)
		[HideInInspector] s_end_geoParticlePerformance ("Spawn Reduction", Float) = 0
		[HideInInspector] m_lightingCategory ("Shading", Float) = 0
		[HideInInspector] m_start_PoiLightData ("Light Data--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/shading/light-data},hover:Documentation}}", Float) = 0
		[TextureKeyword][sRGBWarning][ThryRGBAPacker(R, G, B, A, Linear, false)]_LightingAOMaps ("AO Maps (expand)--{reference_properties:[_LightingAOMapsPan, _LightingAOMapsUV,_LightDataAOStrengthR,_LightDataAOStrengthG,_LightDataAOStrengthB,_LightDataAOStrengthA, _LightDataAOGlobalMaskR]}", 2D) = "white" { }
		[HideInInspector][Vector2]_LightingAOMapsPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _LightingAOMapsUV ("UV", Int) = 0
		[HideInInspector]_LightDataAOStrengthR ("R Strength", Range(0, 1)) = 1
		[HideInInspector]_LightDataAOStrengthG ("G Strength", Range(0, 1)) = 0
		[HideInInspector]_LightDataAOStrengthB ("B Strength", Range(0, 1)) = 0
		[HideInInspector]_LightDataAOStrengthA ("A Strength", Range(0, 1)) = 0
		[HideInInspector][ThryWideEnum(Off, 0, 1R, 1, 1G, 2, 1B, 3, 1A, 4, 2R, 5, 2G, 6, 2B, 7, 2A, 8, 3R, 9, 3G, 10, 3B, 11, 3A, 12, 4R, 13, 4G, 14, 4B, 15, 4A, 16)] _LightDataAOGlobalMaskR ("Global Mask--{reference_property:_LightDataAOGlobalMaskBlendTypeR}", Int) = 0
		[HideInInspector][ThryWideEnum(Add, 7, Subtract, 1, Multiply, 2, Divide, 3, Min, 4, Max, 5, Average, 6, Replace, 0)] _LightDataAOGlobalMaskBlendTypeR ("Blending", Range(0, 1)) = 2
		[TextureKeyword][sRGBWarning][ThryRGBAPacker(R, G, B, A, Linear, false)]_LightingDetailShadowMaps ("Shadow Map (expand)--{reference_properties:[_LightingDetailShadowMapsPan, _LightingDetailShadowMapsUV,_LightingDetailShadowStrengthR,_LightingDetailShadowStrengthG,_LightingDetailShadowStrengthB,_LightingDetailShadowStrengthA,_LightingAddDetailShadowStrengthR,_LightingAddDetailShadowStrengthG,_LightingAddDetailShadowStrengthB,_LightingAddDetailShadowStrengthA, _LightDataDetailShadowGlobalMaskR]}", 2D) = "white" { }
		[HideInInspector][Vector2]_LightingDetailShadowMapsPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _LightingDetailShadowMapsUV ("UV", Int) = 0
		[HideInInspector]_LightingDetailShadowStrengthR ("R Strength", Range(0, 1)) = 1
		[HideInInspector]_LightingDetailShadowStrengthG ("G Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingDetailShadowStrengthB ("B Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingDetailShadowStrengthA ("A Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingAddDetailShadowStrengthR ("Additive R Strength", Range(0, 1)) = 1
		[HideInInspector]_LightingAddDetailShadowStrengthG ("Additive G Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingAddDetailShadowStrengthB ("Additive B Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingAddDetailShadowStrengthA ("Additive A Strength", Range(0, 1)) = 0
		[HideInInspector][ThryWideEnum(Off, 0, 1R, 1, 1G, 2, 1B, 3, 1A, 4, 2R, 5, 2G, 6, 2B, 7, 2A, 8, 3R, 9, 3G, 10, 3B, 11, 3A, 12, 4R, 13, 4G, 14, 4B, 15, 4A, 16)] _LightDataDetailShadowGlobalMaskR ("Global Mask--{reference_property:_LightDataDetailShadowGlobalMaskBlendTypeR}", Int) = 0
		[HideInInspector][ThryWideEnum(Add, 7, Subtract, 1, Multiply, 2, Divide, 3, Min, 4, Max, 5, Average, 6, Replace, 0)] _LightDataDetailShadowGlobalMaskBlendTypeR ("Blending", Range(0, 1)) = 2
		[TextureKeyword][sRGBWarning][ThryRGBAPacker(R, G, B, A, Linear, false)]_LightingShadowMasks ("Shadow Masks (expand)--{reference_properties:[_LightingShadowMasksPan, _LightingShadowMasksUV,_LightingShadowMaskStrengthR,_LightingShadowMaskStrengthG,_LightingShadowMaskStrengthB,_LightingShadowMaskStrengthA, _LightDataShadowMaskGlobalMaskR]}", 2D) = "white" { }
		[HideInInspector][Vector2]_LightingShadowMasksPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _LightingShadowMasksUV ("UV", Int) = 0
		[HideInInspector]_LightingShadowMaskStrengthR ("R Strength", Range(0, 1)) = 1
		[HideInInspector]_LightingShadowMaskStrengthG ("G Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingShadowMaskStrengthB ("B Strength", Range(0, 1)) = 0
		[HideInInspector]_LightingShadowMaskStrengthA ("A Strength", Range(0, 1)) = 0
		[HideInInspector][ThryWideEnum(Off, 0, 1R, 1, 1G, 2, 1B, 3, 1A, 4, 2R, 5, 2G, 6, 2B, 7, 2A, 8, 3R, 9, 3G, 10, 3B, 11, 3A, 12, 4R, 13, 4G, 14, 4B, 15, 4A, 16)] _LightDataShadowMaskGlobalMaskR ("Global Mask--{reference_property:_LightDataShadowMaskGlobalMaskBlendTypeR}", Int) = 0
		[HideInInspector][ThryWideEnum(Add, 7, Subtract, 1, Multiply, 2, Divide, 3, Min, 4, Max, 5, Average, 6, Replace, 0)] _LightDataShadowMaskGlobalMaskBlendTypeR ("Blending", Range(0, 1)) = 2
		[HideInInspector] s_start_LightDataBasePass ("Base Pass (Directional & Baked Lights)--{persistent_expand:true,default_expand:true}", Float) = 1
		[Enum(Poi Custom, 0, Standard, 1, UTS2, 2, OpenLit(lil toon), 3)] _LightingColorMode ("Light Color Mode", Int) = 0
		[Enum(Poi Custom, 0, Normalized NDotL, 1, Saturated NDotL, 2, Casted Shadows Only, 3, SDF, 4)] _LightingMapMode ("Light Map Mode", Int) = 0
		[HideInInspector] s_start_LightDataSDF ("Signed Distance fields--{persistent_expand:true,default_expand:true, condition_showS:(_LightingMapMode==4)}", Float) = 1
		[TextureKeyword][sRGBWarning][ThryRGBAPacker(R, G, Nothing, Nothing, Linear, false)]_LightDataSDFMap ("SDF Map (expand)--{reference_properties:[_LightDataSDFMapPan, _LightDataSDFMapUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_LightDataSDFMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8, Polar UV, 6, Distorted UV, 7, Matcap, 9)] _LightDataSDFMapUV ("UV", Int) = 0
		_LightDataSDFMapLOD ("LOD", Range(0, 1)) = 0
		_LightDataSDFBlendY ("Blend Y Direction", Range(0.001, 2)) = 1
		[HideInInspector] s_end_LightDataSDF ("Signed Distance fields", Float) = 1
		[Enum(Poi Custom, 0, Forced Local Direction, 1, Forced World Direction, 2, UTS2, 3, OpenLit(lil toon), 4, View Direction, 5)] _LightingDirectionMode ("Light Direction Mode", Int) = 0
		[Vector3]_LightngForcedDirection ("Forced Direction--{condition_showS:(_LightingDirectionMode==1 || _LightingDirectionMode==2)}", Vector) = (0, 0, 0)
		_LightingViewDirOffsetPitch ("View Dir Offset Pitch--{condition_showS:_LightingDirectionMode==5}", Range(-90, 90)) = 0
		_LightingViewDirOffsetYaw ("View Dir Offset Yaw--{condition_showS:_LightingDirectionMode==5}", Range(-90, 90)) = 0
		[ToggleUI]_LightingForceColorEnabled ("Force Light Color", Float) = 0
		_LightingForcedColor ("Forced Color--{condition_showS:(_LightingForceColorEnabled==1), reference_property:_LightingForcedColorThemeIndex}", Color) = (1, 1, 1)
		[HideInInspector][ThryWideEnum(Off, 0, Theme Color 0, 1, Theme Color 1, 2, Theme Color 2, 3, Theme Color 3, 4, ColorChord 0, 5, ColorChord 1, 6, ColorChord 2, 7, ColorChord 3, 8, AL Theme 0, 9, AL Theme 1, 10, AL Theme 2, 11, AL Theme 3, 12)] _LightingForcedColorThemeIndex ("", Int) = 0
		_Unlit_Intensity ("Unlit_Intensity--{condition_showS:(_LightingColorMode==2)}", Range(0.001, 4)) = 1
		[DoNotLock][ToggleUI]_LightingCapEnabled ("Limit Brightness", Float) = 1
		[DoNotLock]_LightingCap ("Max Brightness--{condition_showS:(_LightingCapEnabled==1)}", Range(0, 10)) = 1
		[DoNotLock]_LightingMinLightBrightness ("Min Brightness", Range(0, 1)) = 0
		_LightingIndirectUsesNormals ("Indirect Uses Normals--{condition_showS:(_LightingColorMode==0)}", Range(0, 1)) = 0
		_LightingCastedShadows ("Receive Casted Shadows", Range(0, 1)) = 0
		[DoNotLock]_LightingMonochromatic ("Grayscale Lighting", Range(0, 1)) = 0
		[ToggleUI]_LightingVertexLightingEnabled ("Vertex lights (Non-Important)", Float) = 1
		[ToggleUI]_LightingMirrorVertexLightingEnabled ("Mirror Vertex lights (Non-Important)", Float) = 1
		[ToggleUI]_LightingEnableLightVolumes ("Light Volumes", Float) = 1
		[HideInInspector] s_end_LightDataBasePass ("Base Pass", Float) = 1
		[HideInInspector] s_start_LightDataAddPass ("Add Pass (Point & Spot lights)--{persistent_expand:true,default_expand:true}", Float) = 1
		[ToggleUI]_LightingAdditiveEnable ("Pixel lights (Important)", Float) = 1
		[ToggleUI]_DisableDirectionalInAdd ("Ignore Directional Lights--{condition_showS:(_LightingAdditiveEnable==1)}", Float) = 1
		[ToggleUI]_LightingAdditiveLimited ("Limit Brightness", Float) = 1
		_LightingAdditiveLimit ("Max Brightness--{condition_showS:(_LightingAdditiveLimited==1)}", Range(0, 10)) = 1
		_LightingAdditiveCastedShadows ("Receive Casted Shadows", Range(0, 1)) = 1
		_LightingAdditiveMonochromatic ("Grayscale Lighting", Range(0, 1)) = 0
		_LightingAdditivePassthrough ("Point Light Passthrough--{condition_showS:(_LightingAdditiveEnable==1)}", Range(0, 1)) = .5
		[HideInInspector] s_end_LightDataAddPass ("Add Pass", Float) = 1
		[HideInInspector] s_start_LightDataDebug ("Debug / Data Visualizations--{reference_property:_LightDataDebugEnabled,persistent_expand:true}", Float) = 0
		[HideInInspector][DoNotAnimate][ThryToggleUI(false)]_LightDataDebugEnabled ("Debug", Float) = 0
		[ThryWideEnum(Direct Color, 0, Indirect Color, 1, Light Map, 2, Attenuation, 3, N Dot L, 4, Half Dir, 5, Direction, 6, Add Color, 7, Add Attenuation, 8, Add Shadow, 9, Add N Dot L, 10)] _LightingDebugVisualize ("Visualize", Int) = 0
		[HideInInspector] s_end_LightDataDebug ("Debug", Float) = 0
		[HideInInspector] m_end_PoiLightData ("Light Data", Float) = 0
		[HideInInspector] m_OutlineCategory (" Outlines--{reference_property:_EnableOutlines,button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/outlines/main},hover:Documentation}}", Float) = 0
		[HideInInspector] m_specialFXCategory ("Special FX", Float) = 0
		[HideInInspector] m_vertexCategory ("Vertex Options", Float) = 0
		[HideInInspector] m_start_Uzumore (" View Clip Prevention (Uzumore)--{reference_property:_UzumoreCategoryToggle,button_author:{text:sigmal00,action:{type:URL,data:https://github.com/sigmal00},hover:GitHub}}, button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/vertex-options/view-clip-prevention},hover:Documentation}}", Float) = 0
		[HideInInspector][ThryToggle(POI_UZUMORE)] _UzumoreCategoryToggle (" View Clip Prevention (Uzumore)", Float) = 0
		[ToggleUI] _UzumoreEnabled ("Animation Toggle", Float) = 1
		_UzumoreAmount ("Push Amount (m)", Float) = 0.1
		_UzumoreBias ("Push Bias", Float) = 0.001
		[sRGBWarning]_UzumoreMask ("Push Mask (A)", 2D) = "white" { }
		[ThryWideEnum(R, 0, G, 1, B, 2, A, 3)] _UzumoreMaskUV ("Push Mask Channel", Float) = 3
		[HideInInspector] m_end_Uzumore ("Camera Push Back", Float) = 0
		[HideInInspector] m_modifierCategory ("Global Modifiers & Data", Float) = 0
		[HideInInspector] m_start_PoiGlobalCategory ("Global Data and Masks", Float) = 0
		[HideInInspector] m_start_GlobalThemes ("Global Themes--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/color-and-normals/global-themes},hover:Documentation}}", Float) = 0
		[HideInInspector] m_start_GlobalThemeColor0 ("Theme Color 0", Float) = 0
		[HDR]_GlobalThemeColor0 ("Theme Color 0",       Color       ) = (1, 1, 1, 1)
		_GlobalThemeHue0        ("Hue Adjust",          Range( 0, 1)) = 0
		_GlobalThemeHueSpeed0   ("Hue Adjust Speed",    Float       ) = 0
		_GlobalThemeSaturation0 ("Saturation Adjust",   Range(-1, 1)) = 0
		_GlobalThemeValue0      ("Value Adjust",        Range(-1, 1)) = 0
		[HideInInspector] m_end_GlobalThemeColor0   ("Theme Color 0", Float) = 0
		[HideInInspector] m_start_GlobalThemeColor1 ("Theme Color 1", Float) = 0
		[HDR]_GlobalThemeColor1 ("Theme Color 1",       Color       ) = (1, 1, 1, 1)
		_GlobalThemeHue1        ("Hue Adjust",          Range( 0, 1)) = 0
		_GlobalThemeHueSpeed1   ("Hue Adjust Speed",    Float       ) = 0
		_GlobalThemeSaturation1 ("Saturation Adjust",   Range(-1, 1)) = 0
		_GlobalThemeValue1      ("Value Adjust",        Range(-1, 1)) = 0
		[HideInInspector] m_end_GlobalThemeColor1   ("Theme Color 1", Float) = 0
		[HideInInspector] m_start_GlobalThemeColor2 ("Theme Color 2", Float) = 0
		[HDR]_GlobalThemeColor2 ("Theme Color 2",       Color       ) = (1, 1, 1, 1)
		_GlobalThemeHue2        ("Hue Adjust",          Range( 0, 1)) = 0
		_GlobalThemeHueSpeed2   ("Hue Adjust Speed",    Float       ) = 0
		_GlobalThemeSaturation2 ("Saturation Adjust",   Range(-1, 1)) = 0
		_GlobalThemeValue2      ("Value Adjust",        Range(-1, 1)) = 0
		[HideInInspector] m_end_GlobalThemeColor2   ("Theme Color 2", Float) = 0
		[HideInInspector] m_start_GlobalThemeColor3 ("Theme Color 3", Float) = 0
		[HDR]_GlobalThemeColor3 ("Theme Color 3",       Color       ) = (1, 1, 1, 1)
		_GlobalThemeHue3        ("Hue Adjust",          Range( 0, 1)) = 0
		_GlobalThemeHueSpeed3   ("Hue Adjust Speed",    Float       ) = 0
		_GlobalThemeSaturation3 ("Saturation Adjust",   Range(-1, 1)) = 0
		_GlobalThemeValue3      ("Value Adjust",        Range(-1, 1)) = 0
		[HideInInspector] m_end_GlobalThemeColor3   ("Theme Color 3", Float) = 0
		[HideInInspector] m_end_GlobalThemes ("Global Themes", Float ) = 0
		[HideInInspector] m_start_GlobalMask ("Global Mask--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/modifiers/global-masks},hover:Documentation}}", Float) = 0
		[HideInInspector] m_start_GlobalMaskModifiers ("Modifiers", Float) = 0
		[HideInInspector] m_end_GlobalMaskModifiers ("", Float) = 0
		[HideInInspector] m_end_GlobalMask ("Global Mask", Float) = 0
		[HideInInspector] m_end_PoiGlobalCategory ("Global Data and Masks ", Float) = 0
		[HideInInspector] m_start_PoiUVCategory ("UVs", Float) = 0
		[HideInInspector] m_start_Stochastic ("Stochastic Sampling--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/modifiers/uvs/stochastic-sampling},hover:Documentation}}", Float) = 0
		[KeywordEnum(Deliot Heitz, Hextile, None)] _StochasticMode ("Sampling Mode", Float) = 0
		[HideInInspector] s_start_deliot ("Deliot Heitz--{persistent_expand:true,default_expand:false,condition_show:_StochasticMode==0}", Float) = 0
		_StochasticDeliotHeitzDensity ("Detiling Density", Range(0.1, 10)) = 1
		[HideInInspector] s_end_deliot ("Deliot Heitz", Float) = 0
		[HideInInspector] m_end_Stochastic ("Stochastic Sampling", Float) = 0
		[HideInInspector] m_start_uvLocalWorld ("Local World UV--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/modifiers/uvs/local-world-uv},hover:Documentation}}", Float) = 0
		[ThryWideEnum(X, 0, Y, 1, Z, 2, Zero, 3, VColor R, 4, VColor G, 5, VColor B, 6, VColor A, 7)] _UVModLocalPos0 ("Local X", Int) = 0
		[ThryWideEnum(X, 0, Y, 1, Z, 2, Zero, 3, VColor R, 4, VColor G, 5, VColor B, 6, VColor A, 7)] _UVModLocalPos1 ("Local Y", Int) = 1
		[Space(10)]
		[ThryWideEnum(X, 0, Y, 1, Z, 2, Zero, 3)] _UVModWorldPos0 ("World X", Int) = 0
		[ThryWideEnum(X, 0, Y, 1, Z, 2, Zero, 3)] _UVModWorldPos1 ("World Y", Int) = 2
		[HideInInspector] m_end_uvLocalWorld ("Local World UV", Float) = 0
		[HideInInspector] m_start_uvPanosphere ("Panosphere UV--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/modifiers/uvs/panosphere-uv},hover:Documentation}}", Float) = 0
		[ToggleUI] _StereoEnabled ("Stereo Enabled", Float) = 0
		[ToggleUI] _PanoUseBothEyes ("Perspective Correct (VR)", Float) = 1
		[HideInInspector] m_end_uvPanosphere ("Panosphere UV", Float) = 0
		[HideInInspector] m_start_uvPolar ("Polar UV--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/modifiers/uvs/polar-uv},hover:Documentation}}", Float) = 0
		[ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos, 5, Local Pos, 8)] _PolarUV ("UV", Int) = 0
		[Vector2]_PolarCenter ("Center Coordinate", Vector) = (.5, .5, 0, 0)
		_PolarRadialScale ("Radial Scale", Float) = 1
		_PolarLengthScale ("Length Scale", Float) = 1
		_PolarSpiralPower ("Spiral Power", Float) = 0
		[HideInInspector] m_end_uvPolar ("Polar UV", Float) = 0
		[HideInInspector] m_end_PoiUVCategory ("UVs ", Float) = 0
		[HideInInspector] m_start_PoiPostProcessingCategory ("Post Processing", Float) = 0
		[HideInInspector] m_start_PPAnimations ("PP Animations--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/post-processing/pp-animations},hover:Documentation}}", Float) = 0
		[Helpbox(1)] _PPHelp ("This section meant for real time adjustments through animations and not to be changed in unity", Int) = 0
		_PPLightingMultiplier ("Lighting Mulitplier", Float) = 1
		_PPLightingAddition ("Lighting Add", Float) = 0
		_PPEmissionMultiplier ("Emission Multiplier", Float) = 1
		_PPFinalColorMultiplier ("Final Color Multiplier", Float) = 1
		[HideInInspector] m_end_PPAnimations ("PP Animations ", Float) = 0
		[HideInInspector] m_end_PoiPostProcessingCategory ("Post Processing ", Float) = 0
		[HideInInspector] m_thirdpartyCategory ("Third Party", Float) = 0
		[HideInInspector] m_renderingCategory ("Rendering--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/rendering/main},hover:Documentation}}", Float) = 0
		[DoNotAnimate][Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
		[DoNotAnimate][Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
		[DoNotAnimate][Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 1
		[DoNotAnimate][ThryMask(Thry.ColorMaskFlags)] _ColorMask ("Color Mask", Int) = 15
		[DoNotAnimate] _OffsetFactor ("Offset Factor", Float) = 0.0
		[DoNotAnimate] _OffsetUnits ("Offset Units", Float) = 0.0
		[DoNotAnimate][ToggleUI] _RenderingReduceClipDistance ("Reduce Clip Distance", Float) = 0
		[DoNotAnimate][ToggleUI] _ZClip ("Z Clip", Float) = 1
		[DoNotAnimate][ToggleUI] _IgnoreFog ("Ignore Fog", Float) = 0
		[DoNotAnimate][ToggleUI]_FlipBackfaceNormals ("Flip Backface Normals", Int) = 1
		[DoNotAnimate][HideInInspector] Instancing ("Instancing", Float) = 0 //add this property for instancing variants settings to be shown
		[HideInInspector] m_start_blending ("Blending--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/rendering/blending},hover:Documentation}}", Float) = 0
		[DoNotAnimate][Enum(Thry.BlendOp)] _BlendOp ("RGB Blend Op", Int) = 0
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("RGB Source Blend", Int) = 1
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("RGB Destination Blend", Int) = 0
		[DoNotAnimate][Space][ThryHeaderLabel(Additive Blending, 13)]
		[DoNotAnimate][Enum(Thry.BlendOp)] _AddBlendOp ("RGB Blend Op", Int) = 4
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _AddSrcBlend ("RGB Source Blend", Int) = 1
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _AddDstBlend ("RGB Destination Blend", Int) = 1
		[DoNotAnimate][HideInInspector] m_start_alphaBlending ("Advanced Alpha Blending", Float) = 0
		[DoNotAnimate][Enum(Thry.BlendOp)] _BlendOpAlpha ("Alpha Blend Op", Int) = 0
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _SrcBlendAlpha ("Alpha Source Blend", Int) = 1
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _DstBlendAlpha ("Alpha Destination Blend", Int) = 10
		[DoNotAnimate][Space][ThryHeaderLabel(Additive Blending, 13)]
		[DoNotAnimate][Enum(Thry.BlendOp)] _AddBlendOpAlpha ("Alpha Blend Op", Int) = 4
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _AddSrcBlendAlpha ("Alpha Source Blend", Int) = 0
		[DoNotAnimate][Enum(UnityEngine.Rendering.BlendMode)] _AddDstBlendAlpha ("Alpha Destination Blend", Int) = 1
		[DoNotAnimate][HideInInspector] m_end_alphaBlending ("Advanced Alpha Blending", Float) = 0
		[HideInInspector] m_end_blending ("Blending", Float) = 0
		[HideInInspector] m_start_StencilPassOptions ("Stencil--{button_help:{text:Tutorial,action:{type:URL,data:https://www.poiyomi.com/rendering/stencil},hover:Documentation}}", Float) = 0
		[ThryWideEnum(Simple, 0, Front Face vs Back Face, 1)] _StencilType ("Stencil Type", Float) = 0
		[IntRange] _StencilRef ("Stencil Reference Value", Range(0, 255)) = 0
		[IntRange] _StencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 255
		[IntRange] _StencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 255
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp ("Stencil Pass Op--{condition_showS:(_StencilType==0)}", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp ("Stencil Fail Op--{condition_showS:(_StencilType==0)}", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp ("Stencil ZFail Op--{condition_showS:(_StencilType==0)}", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompareFunction ("Stencil Compare Function--{condition_showS:(_StencilType==0)}", Float) = 8
		[HideInInspector] m_start_StencilPassBackOptions("Back--{condition_showS:(_StencilType==1)}", Float) = 0
		[Helpbox(1)] _FFBFStencilHelp0 ("Front Face and Back Face Stencils only work when locked in due to Unity's Stencil managment", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilBackPassOp ("Back Pass Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilBackFailOp ("Back Fail Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilBackZFailOp ("Back ZFail Op", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilBackCompareFunction ("Back Compare Function", Float) = 8
		[HideInInspector] m_end_StencilPassBackOptions("Back", Float) = 0
		[HideInInspector] m_start_StencilPassFrontOptions("Front--{condition_showS:(_StencilType==1)}", Float) = 0
		[Helpbox(1)] _FFBFStencilHelp1 ("Front Face and Back Face Stencils only work when locked in due to Unity's Stencil managment", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilFrontPassOp ("Front Pass Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilFrontFailOp ("Front Fail Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilFrontZFailOp ("Front ZFail Op", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilFrontCompareFunction ("Front Compare Function", Float) = 8
		[HideInInspector] m_end_StencilPassFrontOptions("Front", Float) = 0
		[HideInInspector] m_end_StencilPassOptions ("Stencil", Float) = 0
	}
	SubShader
	{
		Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" "Queue" = "Geometry" }
		HLSLINCLUDE
		#define POI_BIRP 1
		#define POI_URP 2
		#define POI_PIPE POI_URP
		#if POI_PIPE == POI_BIRP
		#include "UnityCG.cginc"
		#include "AutoLight.cginc"
		#elif POI_PIPE == POI_URP
		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		#endif
		SamplerState sampler_linear_clamp;
		SamplerState sampler_linear_repeat;
		SamplerState sampler_trilinear_clamp;
		SamplerState sampler_trilinear_repeat;
		SamplerState sampler_point_clamp;
		SamplerState sampler_point_repeat;
		#define DielectricSpec float4(0.04, 0.04, 0.04, 1.0 - 0.04)
		#define PI_OVER_2 1.5707963f
		#define PI_OVER_4 0.785398f
		#define EPSILON 0.000001f
		#if POI_PIPE == POI_BIRP
		#define HALF_PI float(1.5707964)
		#define PI float(3.14159265359)
		#define TWO_PI float(6.28318530718)
		#define INV_PI 0.31830988618f
		#define INV_TWO_PI 0.15915494309f
		#elif POI_PIPE == POI_URP
		#define UNITY_PI 3.14159265359f
		#define UNITY_INV_PI 0.31830988618f
		#define UNITY_TWO_PI 6.28318530718f
		#define UNITY_INV_TWO_PI 0.15915494309f
		#define UNITY_DECLARE_TEX2D(tex) Texture2D tex; SamplerState sampler##tex
		#define UNITY_SAMPLE_TEX2D_SAMPLER(tex,samplertex,coord) tex.Sample (sampler##samplertex,coord)
		#define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex, samplertex, coord, lod) tex.SampleLevel (sampler##samplertex, coord, lod)
		#define UNITY_SAMPLE_TEXCUBE_LOD(tex,coord,lod) tex.SampleLevel (sampler##tex,coord, lod)
		#define UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(tex, samplertex, coord, lod) tex.SampleLevel (sampler##samplertex, coord, lod)
		#define UNITY_DECLARE_TEX2DARRAY(tex) TEXTURE2D_ARRAY(tex); SAMPLER(sampler##tex)
		#define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) Texture2DArray tex
		#define UNITY_SAMPLE_TEX2DARRAY(tex,coord) SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
		#define UNITY_SAMPLE_TEX2DARRAY_SAMPLER_LOD(tex,samplertex,coord,lod) tex.SampleLevel (sampler##samplertex,coord,lod)
		#ifdef UNITY_COLORSPACE_GAMMA
		#define unity_ColorSpaceGrey float4(0.5, 0.5, 0.5, 0.5)
		#define unity_ColorSpaceDouble float4(2.0, 2.0, 2.0, 2.0)
		#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)
		#define unity_ColorSpaceLuminance half4(0.22, 0.707, 0.071, 0.0) // Legacy: alpha is set to 0.0 to specify gamma mode
		#else // Linear values
		#define unity_ColorSpaceGrey float4(0.214041144, 0.214041144, 0.214041144, 0.5)
		#define unity_ColorSpaceDouble float4(4.59479380, 4.59479380, 4.59479380, 2.0)
		#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) // standard dielectric reflectivity coef at incident angle (= 4%)
		#define unity_ColorSpaceLuminance half4(0.0396819152, 0.458021790, 0.00609653955, 1.0) // Legacy: alpha is set to 1.0 to specify linear mode
		#endif
		#endif
		#if POI_PIPE == POI_BIRP
		#define POI_SHADOW_COORDS(idx) UNITY_SHADOW_COORDS(idx)
		#define POI_TRANSFER_SHADOW(a, coord) UNITY_TRANSFER_SHADOW(a, coord)
		#define POI_TRANSFER_SHADOW_CASTER_NOPOS(o, opos) TRANSFER_SHADOW_CASTER_NOPOS(o, opos)
		#define POI_SAMPLE_TEXCUBE_LOD(tex,sample,coord,lod) tex.SampleLevel(sample,coord,lod)
		#define POI_SAMPLE_TEX2DARRAY_SAMPLERGRAD(tex, samplertex, coord, dx, dy) tex.SampleGrad(sampler##samplertex, coord, dx, dy)
		#elif POI_PIPE == POI_URP
		#define POI_SHADOW_COORDS(idx) float4 shadowCoord : TEXCOORD##idx;
		#define POI_TRANSFER_SHADOW(a, coord) a.shadowCoord = TransformWorldToShadowCoord(a.worldPos.rgb);
		#define POI_TRANSFER_SHADOW_CASTER_NOPOS(o, opos) opos = GetShadowPositionHClip(o.worldPos.rgb, o.normal.rgb);
		#define POI_SAMPLE_TEXCUBE_LOD(tex,sample,coord,lod) SAMPLE_TEXTURECUBE_LOD(tex,sample,coord,lod)
		#define POI_SAMPLE_TEX2DARRAY_SAMPLERGRAD(tex, samplertex, coord, dx, dy) SAMPLE_TEXTURE2D_ARRAY_GRAD(tex, sampler##samplertex, coord.xy, floor(coord.z), dx, dy);
		#endif
		#define POI2D_SAMPLE_TEX2D_SAMPLERGRAD(tex, samplertex, coord, dx, dy) tex.SampleGrad(sampler##samplertex, coord, dx, dy)
		#define POI2D_SAMPLE_TEX2D_SAMPLERGRADD(tex, samp, uv, pan, dx, dy) tex.SampleGrad(samp, POI_PAN_UV(uv, pan), dx, dy)
		#define POI_PAN_UV(uv, pan) (uv + _Time.x * pan)
		#define POI2D_SAMPLER_PAN(tex, texSampler, uv, pan) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, POI_PAN_UV(uv, pan)))
		#define POI2D_SAMPLER_PANGRAD(tex, texSampler, uv, pan, dx, dy) (POI2D_SAMPLE_TEX2D_SAMPLERGRAD(tex, texSampler, POI_PAN_UV(uv, pan), dx, dy))
		#define POI2D_SAMPLER(tex, texSampler, uv) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv))
		#define POI_SAMPLE_1D_X(tex, samp, uv) tex.Sample(samp, float2(uv, 0.5))
		#define POI2D_SAMPLER_GRAD(tex, texSampler, uv, dx, dy) (POI2D_SAMPLE_TEX2D_SAMPLERGRAD(tex, texSampler, uv, dx, dy))
		#define POI2D_SAMPLER_GRADD(tex, texSampler, uv, dx, dy) tex.SampleGrad(texSampler, uv, dx, dy)
		#define POI2D_PAN(tex, uv, pan) (tex2D(tex, POI_PAN_UV(uv, pan)))
		#define POI2D(tex, uv) (tex2D(tex, uv))
		#define POI_SAMPLE_TEX2D(tex, uv) (UNITY_SAMPLE_TEX2D(tex, uv))
		#define POI_SAMPLE_TEX2D_PAN(tex, uv, pan) (UNITY_SAMPLE_TEX2D(tex, POI_PAN_UV(uv, pan)))
		#define POI_SAMPLE_CUBE_LOD(tex, sampler, coord, lod) tex.SampleLevel(sampler, coord, lod)
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define POI_SAMPLE_SCREEN(tex, samp, uv)          tex.Sample(samp, float3(uv, unity_StereoEyeIndex))
		#else
		#define POI_SAMPLE_SCREEN(tex, samp, uv)          tex.Sample(samp, uv)
		#endif
		#define POI_SAFE_RGB0 float4(mainTexture.rgb * .0001, 0)
		#define POI_SAFE_RGB1 float4(mainTexture.rgb * .0001, 1)
		#define POI_SAFE_RGBA mainTexture
		#if POI_PIPE == POI_URP || defined(UNITY_COMPILER_HLSL) || defined(SHADER_API_PSSL) || defined(UNITY_COMPILER_HLSLCC)
		#define PoiInitStruct(type,name) name = (type)0;
		#else
		#define PoiInitStruct(type,name)
		#endif
		#define POI_ERROR(poiMesh, gridSize) lerp(float3(1, 0, 1), float3(0, 0, 0), fmod(floor((poiMesh.worldPos.x) * gridSize) + floor((poiMesh.worldPos.y) * gridSize) + floor((poiMesh.worldPos.z) * gridSize), 2) == 0)
		#define POI_NAN (asfloat(-1))
		#define POI_MODE_OPAQUE 0
		#define POI_MODE_CUTOUT 1
		#define POI_MODE_FADE 2
		#define POI_MODE_TRANSPARENT 3
		#define POI_MODE_ADDITIVE 4
		#define POI_MODE_SOFTADDITIVE 5
		#define POI_MODE_MULTIPLICATIVE 6
		#define POI_MODE_2XMULTIPLICATIVE 7
		#define POI_MODE_TRANSCLIPPING 9
		#define POI_MAX_VISIBLE_LIGHTS 8
		#define POI_DIRECTIONAL 1
		#define POI_POINT_SPOT 2
		#ifndef UNITY_SPECCUBE_LOD_STEPS
		#define UNITY_SPECCUBE_LOD_STEPS (6)
		#endif
		#ifndef UNITY_LIGHTING_COMMON_INCLUDED
		#define UNITY_LIGHTING_COMMON_INCLUDED
		float4 _LightColor0;
		float4 _SpecColor;
		struct UnityLight
		{
			half3 color;
			half3 dir;
			half ndotl;
		};
		struct UnityIndirect
		{
			half3 diffuse;
			half3 specular;
		};
		struct UnityGI
		{
			UnityLight light;
			UnityIndirect indirect;
		};
		struct UnityGIInput
		{
			UnityLight light;
			float3 worldPos;
			half3 worldViewDir;
			half atten;
			half3 ambient;
			#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION) || defined(UNITY_ENABLE_REFLECTION_BUFFERS)
			float4 boxMin[2];
			#endif
			#ifdef UNITY_SPECCUBE_BOX_PROJECTION
			float4 boxMax[2];
			float4 probePosition[2];
			#endif
			float4 probeHDR[2];
		};
		#endif
		static float4 PoiSHAr = 0;
		static float4 PoiSHAg = 0;
		static float4 PoiSHAb = 0;
		static float4 PoiSHBr = 0;
		static float4 PoiSHBg = 0;
		static float4 PoiSHBb = 0;
		static float4 PoiSHC  = 0;
		struct Unity_GlossyEnvironmentData
		{
			half roughness;
			half3 reflUVW;
		};
		struct PoiMesh
		{
			float3 normals[2];
			float3 objNormal;
			float3 tangentSpaceNormal;
			float3 binormal[2];
			float3 tangent[2];
			float3 worldPos;
			float3 localPos;
			float3 objectPosition;
			float isFrontFace;
			float4 vertexColor;
			float4 lightmapUV;
			float2 uv[10];
			float2 parallaxUV;
			float2 dx;
			float2 dy;
			uint isRightHand;
		};
		struct PoiCam
		{
			float3 viewDir;
			float3 forwardDir;
			float3 worldPos;
			float distanceToVert;
			float4 clipPos;
			float4 screenSpacePosition;
			float3 reflectionDir;
			float3 vertexReflectionDir;
			float3 tangentViewDir;
			float4 posScreenSpace;
			float2 posScreenPixels;
			float2 screenUV;
			float vDotN;
			float4 worldDirection;
		};
		struct PoiMods
		{
			float4 Mask;
			float audioLink[5];
			float audioLinkAvailable;
			float audioLinkVersion;
			float4 audioLinkTexture;
			float2 detailMask;
			float2 backFaceDetailIntensity;
			float globalEmission;
			float4 globalColorTheme[12];
			float globalMask[16];
			float ALTime[8];
		};
		#if POI_PIPE == POI_BIRP
		struct Light
		{
			half3   direction;
			half3   color;
			half    distanceAttenuation;
			half    shadowAttenuation;
		};
		struct BRDFData
		{
			half3 albedo;
			half3 diffuse;
			half3 specular;
			half reflectivity;
			half perceptualRoughness;
			half roughness;
			half roughness2;
			half grazingTerm;
			half normalizationTerm;
			half roughness2MinusOne;
		};
		#endif
		struct PoiLight
		{
			float3 direction;
			float nDotVCentered;
			float attenuation;
			float attenuationStrength;
			float3 directColor;
			float3 indirectColor;
			float occlusion;
			#if POI_PIPE == POI_BIRP
			float shadowMask;
			#elif  POI_PIPE == POI_URP
			float4 shadowMask;
			#endif
			float detailShadow;
			float3 halfDir;
			float lightMap;
			float lightMapNoAttenuation;
			float3 rampedLightMap;
			float vertexNDotL;
			float nDotL;
			float nDotV;
			float vertexNDotV;
			float nDotH;
			float vertexNDotH;
			float lDotv;
			float lDotH;
			float nDotLSaturated;
			float nDotLNormalized;
			float additiveShadow;
			float3 finalLighting;
			float3 finalLightAdd;
			float3 LTCGISpecular;
			float3 LTCGIDiffuse;
			float directLuminance;
			float indirectLuminance;
			float finalLuminance;
			int lightType;
			Light unityLight;
			#if POI_PIPE == POI_URP
			BRDFData brdfData;
			BRDFData brdfDataClearCoat;
			#endif
			#if defined(VERTEXLIGHT_ON)
			float4 vDotNL;
			float4 vertexVDotNL;
			float3 vColor[4];
			float4 vCorrectedDotNL;
			float4 vAttenuation;
			float4 vSaturatedDotNL;
			float3 vPosition[4];
			float3 vDirection[4];
			float3 vFinalLighting;
			float3 vHalfDir[4];
			half4 vDotNH;
			half4 vertexVDotNH;
			half4 vDotLH;
			#endif
		};
		#if POI_PIPE == POI_URP
		struct PoiLightOut
		{
			float3 totalLighting;
			float3 totalLightAdd;
		};
		#endif
		struct PoiFragData
		{
			float smoothness;
			float smoothness2;
			float metallic;
			float specularMask;
			float reflectionMask;
			float3 baseColor;
			float3 finalColor;
			float alpha;
			float3 emission;
			float toggleVertexLights;
		};
		float4 poiTransformClipSpacetoScreenSpaceFrag(float4 clipPos)
		{
			float4 positionSS = float4(clipPos.xyz * clipPos.w, clipPos.w);
			positionSS.xy = positionSS.xy / _ScreenParams.xy;
			return positionSS;
		}
		half3 PoiSHEval_L0L1(half4 normal)
		{
			half3 x;
			x.r = dot(PoiSHAr, normal);
			x.g = dot(PoiSHAg, normal);
			x.b = dot(PoiSHAb, normal);
			return x;
		}
		half3 PoiSHEval_L2(half4 normal)
		{
			half3 x1, x2;
			half4 vB = normal.xyzz * normal.yzzx;
			x1.r = dot(PoiSHBr, vB);
			x1.g = dot(PoiSHBg, vB);
			x1.b = dot(PoiSHBb, vB);
			half  vC = normal.x*normal.x - normal.y*normal.y;
			x2    = PoiSHC.rgb * vC;
			return x1 + x2;
		}
		half3 PoiShadeSH9 (half4 normal)
		{
			half3 res = PoiSHEval_L0L1(normal);
			res += PoiSHEval_L2(normal);
			#ifdef UNITY_COLORSPACE_GAMMA
			res = LinearToGammaSpace(res);
			#endif
			return res;
		}
		inline half Pow5(half x)
		{
			return x * x * x * x * x;
		}
		inline half3 FresnelLerp(half3 F0, half3 F90, half cosA)
		{
			half t = Pow5((1 - cosA));   // ala Schlick interpoliation
			return lerp(F0, F90, t);
		}
		inline half3 FresnelTerm(half3 F0, half cosA)
		{
			half t = Pow5((1 - cosA));   // ala Schlick interpoliation
			return F0 + (1 - F0) * t;
		}
		half perceptualRoughnessToMipmapLevel(half perceptualRoughness)
		{
			return perceptualRoughness * UNITY_SPECCUBE_LOD_STEPS;
		}
		half3 UnpackScaleNormalDXT5nm(half4 packednormal, half bumpScale)
		{
			half3 normal;
			normal.xy = (packednormal.wy * 2 - 1);
			#if (SHADER_TARGET >= 30)
			normal.xy *= bumpScale;
			#endif
			normal.z = sqrt(1.0 - saturate(dot(normal.xy, normal.xy)));
			return normal;
		}
		#ifdef BUILTIN_TARGET_API
		half3 LerpWhiteTo(half3 b, half t)
		{
			half oneMinusT = 1 - t;
			return half3(oneMinusT, oneMinusT, oneMinusT) + b * t;
		}
		#endif
		inline float GGXTerm(float NdotH, float roughness)
		{
			float a2 = roughness * roughness;
			float d = (NdotH * a2 - NdotH) * NdotH + 1.0f; // 2 mad
			return UNITY_INV_PI * a2 / (d * d + 1e-7f); // This function is not intended to be running on Mobile,
		}
		Unity_GlossyEnvironmentData UnityGlossyEnvironmentSetup(half Smoothness, half3 worldViewDir, half3 Normal, half3 fresnel0)
		{
			Unity_GlossyEnvironmentData g;
			g.roughness /* perceptualRoughness */ = 1 - Smoothness;
			g.reflUVW = reflect(-worldViewDir, Normal);
			return g;
		}
		half3 UnpackScaleNormalRGorAG(half4 packednormal, half bumpScale)
		{
			#if defined(UNITY_NO_DXT5nm)
			half3 normal = packednormal.xyz * 2 - 1;
			#if (SHADER_TARGET >= 30)
			normal.xy *= bumpScale;
			#endif
			return normal;
			#elif defined(UNITY_ASTC_NORMALMAP_ENCODING)
			half3 normal;
			normal.xy = (packednormal.wy * 2 - 1);
			normal.z = sqrt(1.0 - saturate(dot(normal.xy, normal.xy)));
			normal.xy *= bumpScale;
			return normal;
			#else
			packednormal.x *= packednormal.w;
			half3 normal;
			normal.xy = (packednormal.xy * 2 - 1);
			#if (SHADER_TARGET >= 30)
			normal.xy *= bumpScale;
			#endif
			normal.z = sqrt(1.0 - saturate(dot(normal.xy, normal.xy)));
			return normal;
			#endif
		}
		half3 UnpackScaleNormal(half4 packednormal, half bumpScale)
		{
			return UnpackScaleNormalRGorAG(packednormal, bumpScale);
		}
		half3 BlendNormals(half3 n1, half3 n2)
		{
			return normalize(half3(n1.xy + n2.xy, n1.z * n2.z));
		}
		inline float2 Pow4(float2 x)
		{
			return x * x * x * x;
		}
		inline float3 Unity_SafeNormalize(float3 inVec)
		{
			float dp3 = max(0.001f, dot(inVec, inVec));
			return inVec * rsqrt(dp3);
		}
		inline float3 BoxProjectedCubemapDirection(float3 worldRefl, float3 worldPos, float4 cubemapCenter, float4 boxMin, float4 boxMax)
		{
			UNITY_BRANCH
			if (cubemapCenter.w > 0.0)
			{
				float3 nrdir = normalize(worldRefl);
				#if 1
				float3 rbmax = (boxMax.xyz - worldPos) / nrdir;
				float3 rbmin = (boxMin.xyz - worldPos) / nrdir;
				float3 rbminmax = (nrdir > 0.0f) ? rbmax : rbmin;
				#else // Optimized version
				float3 rbmax = (boxMax.xyz - worldPos);
				float3 rbmin = (boxMin.xyz - worldPos);
				float3 select = step(float3(0, 0, 0), nrdir);
				float3 rbminmax = lerp(rbmax, rbmin, select);
				rbminmax /= nrdir;
				#endif
				float fa = min(min(rbminmax.x, rbminmax.y), rbminmax.z);
				worldPos -= cubemapCenter.xyz;
				worldRefl = worldPos + nrdir * fa;
			}
			return worldRefl;
		}
		#if POI_PIPE == POI_BIRP
		half3 Unity_GlossyEnvironment(UNITY_ARGS_TEXCUBE(tex), half4 hdr, Unity_GlossyEnvironmentData glossIn)
		{
			half perceptualRoughness = glossIn.roughness /* perceptualRoughness */ ;
			#if 0
			float m = PerceptualRoughnessToRoughness(perceptualRoughness); // m is the real roughness parameter
			const float fEps = 1.192092896e-07F;        // smallest such that 1.0+FLT_EPSILON != 1.0  (+1e-4h is NOT good here. is visibly very wrong)
			float n = (2.0 / max(fEps, m * m)) - 2.0;        // remap to spec power. See eq. 21 in --> https://dl.dropboxusercontent.com/u/55891920/papers/mm_brdf.pdf
			n /= 4;                                     // remap from n_dot_h formulatino to n_dot_r. See section "Pre-convolved Cube Maps vs Path Tracers" --> https://s3.amazonaws.com/docs.knaldtech.com/knald/1.0.0/lys_power_drops.html
			perceptualRoughness = pow(2 / (n + 2), 0.25);      // remap back to square root of real roughness (0.25 include both the sqrt root of the conversion and sqrt for going from roughness to perceptualRoughness)
			#else
			perceptualRoughness = perceptualRoughness * (1.7 - 0.7 * perceptualRoughness);
			#endif
			half mip = perceptualRoughnessToMipmapLevel(perceptualRoughness);
			half3 R = glossIn.reflUVW;
			half4 rgbm = UNITY_SAMPLE_TEXCUBE_LOD(tex, R, mip);
			return DecodeHDR(rgbm, hdr);
		}
		inline half3 UnityGI_IndirectSpecular(UnityGIInput data, half occlusion, Unity_GlossyEnvironmentData glossIn)
		{
			half3 specular;
			#ifdef UNITY_SPECCUBE_BOX_PROJECTION
			half3 originalReflUVW = glossIn.reflUVW;
			glossIn.reflUVW = BoxProjectedCubemapDirection(originalReflUVW, data.worldPos, data.probePosition[0], data.boxMin[0], data.boxMax[0]);
			#endif
			#ifdef _GLOSSYREFLECTIONS_OFF
			specular = unity_IndirectSpecColor.rgb;
			#else
			half3 env0 = Unity_GlossyEnvironment(UNITY_PASS_TEXCUBE(unity_SpecCube0), data.probeHDR[0], glossIn);
			#ifdef UNITY_SPECCUBE_BLENDING
			const float kBlendFactor = 0.99999;
			float blendLerp = data.boxMin[0].w;
			UNITY_BRANCH
			if (blendLerp < kBlendFactor)
			{
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
				glossIn.reflUVW = BoxProjectedCubemapDirection(originalReflUVW, data.worldPos, data.probePosition[1], data.boxMin[1], data.boxMax[1]);
				#endif
				half3 env1 = Unity_GlossyEnvironment(UNITY_PASS_TEXCUBE_SAMPLER(unity_SpecCube1, unity_SpecCube0), data.probeHDR[1], glossIn);
				specular = lerp(env1, env0, blendLerp);
			}
			else
			{
				specular = env0;
			}
			#else
			specular = env0;
			#endif
			#endif
			return specular * occlusion;
		}
		inline half3 UnityGI_IndirectSpecular(UnityGIInput data, half occlusion, half3 normalWorld, Unity_GlossyEnvironmentData glossIn)
		{
			return UnityGI_IndirectSpecular(data, occlusion, glossIn);
		}
		#endif
		#if POI_PIPE == POI_URP
		half LinearRgbToLuminance(half3 linearRgb)
		{
			return dot(linearRgb, half3(0.2126729f,  0.7151522f, 0.0721750f));
		}
		#endif
		#ifndef glsl_mod
		#define glsl_mod(x, y) (((x) - (y) * floor((x) / (y))))
		#endif
		uniform float random_uniform_float_only_used_to_stop_compiler_warnings = 0.0f;
		#if POI_PIPE == POI_URP
		inline float Linear01Depth( float z )
		{
			return 1.0 / (_ZBufferParams.x * z + _ZBufferParams.y);
		}
		inline half3 LinearToGammaSpace (half3 linRGB)
		{
			linRGB = max(linRGB, half3(0.h, 0.h, 0.h));
			return max(1.055h * pow(linRGB, 0.416666667h) - 0.055h, 0.h);
		}
		inline half3 GammaToLinearSpace (half3 sRGB)
		{
			return sRGB * (sRGB * (sRGB * 0.305306011h + 0.682171111h) + 0.012522878h);
		}
		half4 PoiCalculateShadowMask(float2 shadowCoords)
		{
			#if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)
			half4 shadowMask = SAMPLE_SHADOWMASK(shadowCoords); // Shadowmask was sampled from lightmap
			#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
			half4 shadowMask = SAMPLE_SHADOWMASK(shadowCoords); // Shadowmask (probe occlusion) was sampled from APV
			#elif !defined (LIGHTMAP_ON)
			half4 shadowMask = unity_ProbesOcclusion; // Sample shadowmask (probe occlusion) from legacy probes
			#else
			half4 shadowMask = half4(1, 1, 1, 1); // Fallback shadowmask, fully unoccluded
			#endif
			return shadowMask;
		}
		half3 SHEvalLinearL2 (half4 normal)
		{
			half3 x1, x2;
			half4 vB = normal.xyzz * normal.yzzx;
			x1.r = dot(PoiSHBr,vB);
			x1.g = dot(PoiSHBg,vB);
			x1.b = dot(PoiSHBb,vB);
			half vC = normal.x*normal.x - normal.y*normal.y;
			x2 = PoiSHC.rgb * vC;
			return x1 + x2;
		}
		#endif
		float3 PoiUnpackNormalScale(float4 packedNormal, float bumpScale)
		{
			#if POI_PIPE == POI_BIRP
			return UnpackScaleNormal(packedNormal, bumpScale);
			#elif POI_PIPE == POI_URP
			return UnpackNormalScale(packedNormal, bumpScale);
			#endif
		}
		float4 PoiObjectToClipPos(in float3 pos)
		{
			#if POI_PIPE == POI_BIRP
			return UnityObjectToClipPos(pos);
			#elif POI_PIPE == POI_URP
			return TransformObjectToHClip(pos);
			#endif
		}
		float4 PoiWorldToClipPos(in float3 pos)
		{
			#if POI_PIPE == POI_BIRP
			return UnityWorldToClipPos(pos);
			#elif POI_PIPE == POI_URP
			return TransformWorldToHClip(pos);
			#endif
		}
		float4 PoiComputeScreenPos(in float4 pos)
		{
			#if POI_PIPE == POI_BIRP
			return ComputeGrabScreenPos(pos);
			#elif POI_PIPE == POI_URP
			return ComputeScreenPos(pos);
			#endif
		}
		float3 PoiDecodeHDR(float4 data, float4 decodeInstructions)
		{
			#if POI_PIPE == POI_BIRP
			return DecodeHDR(data, decodeInstructions);
			#elif POI_PIPE == POI_URP
			return DecodeHDREnvironment(data, decodeInstructions);
			#endif
		}
		float3 PoiWorldSpaceViewDir(float3 worldPos)
		{
			#if POI_PIPE == POI_BIRP
			return UnityWorldSpaceViewDir(worldPos);
			#elif POI_PIPE == POI_URP
			return GetWorldSpaceViewDir(worldPos);
			#endif
		}
		float2 poiUV(float2 uv, float4 tex_st)
		{
			return uv * tex_st.xy + tex_st.zw;
		}
		float CalculateLuminance(float3 color)
		{
			return color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
		}
		float AverageLuminance(float3 color)
		{
			return (color.r + color.g + color.b) / 3.0;
		}
		float dotToDegrees(float dot)
		{
			dot = clamp(dot, -1.0, 1.0);
			return degrees(acos(dot));
		}
		float dotToDegrees(float3 a, float3 b)
		{
			return dotToDegrees(dot(normalize(a), normalize(b)));
		}
		float poiFastAtan(float x)
		{
			return x * (abs(x) * (1.5707963 * abs(x) - 0.00507668) + 0.420691) /
			(abs(x) * (abs(x) * (0.633387806 + abs(x)) + 0.671041944) + 0.215192627);
		}
		float _VRChatCameraMode;
		float _VRChatMirrorMode;
		float VRCCameraMode()
		{
			return _VRChatCameraMode;
		}
		float VRCMirrorMode()
		{
			return _VRChatMirrorMode;
		}
		bool IsInMirror()
		{
			return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
		}
		bool IsOrthographicCamera()
		{
			return unity_OrthoParams.w == 1 || UNITY_MATRIX_P[3][3] == 1;
		}
		float shEvaluateDiffuseL1Geomerics_local(float L0, float3 L1, float3 n)
		{
			float R0 = max(0, L0);
			float3 R1 = 0.5f * L1;
			float lenR1 = length(R1);
			float q = dot(normalize(R1), n) * 0.5 + 0.5;
			q = saturate(q); // Thanks to ScruffyRuffles for the bug identity.
			float p = 1.0f + 2.0f * lenR1 / R0;
			float a = (1.0f - lenR1 / R0) / (1.0f + lenR1 / R0);
			return R0 * (a + (1.0f - a) * (p + 1.0f) * pow(q, p));
		}
		half3 BetterSH9(half4 normal)
		{
			float3 indirect;
			float3 L0 = float3(PoiSHAr.w, PoiSHAg.w, PoiSHAb.w) + float3(PoiSHBr.z, PoiSHBg.z, PoiSHBb.z) / 3.0;
			indirect.r = shEvaluateDiffuseL1Geomerics_local(L0.r, PoiSHAr.xyz, normal.xyz);
			indirect.g = shEvaluateDiffuseL1Geomerics_local(L0.g, PoiSHAg.xyz, normal.xyz);
			indirect.b = shEvaluateDiffuseL1Geomerics_local(L0.b, PoiSHAb.xyz, normal.xyz);
			indirect = max(0, indirect);
			indirect += SHEvalLinearL2(normal);
			return indirect;
		}
		float3 BetterSH9(float3 normal)
		{
			return BetterSH9(float4(normal, 1));
		}
		float3 getCameraForward()
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 p1 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 1, 1));
			float3 p2 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 0, 1));
			#else
			float3 p1 = mul(unity_CameraToWorld, float4(0, 0, 1, 1)).xyz;
			float3 p2 = mul(unity_CameraToWorld, float4(0, 0, 0, 1)).xyz;
			#endif
			return normalize(p2 - p1);
		}
		half3 GetSHLength()
		{
			half3 x, x1;
			x.r = length(PoiSHAr);
			x.g = length(PoiSHAg);
			x.b = length(PoiSHAb);
			x1.r = length(PoiSHBr);
			x1.g = length(PoiSHBg);
			x1.b = length(PoiSHBb);
			return x + x1;
		}
		float3 BoxProjection(float3 direction, float3 position, float4 cubemapPosition, float3 boxMin, float3 boxMax)
		{
			#if UNITY_SPECCUBE_BOX_PROJECTION
			if (cubemapPosition.w > 0)
			{
				float3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
				float scalar = min(min(factors.x, factors.y), factors.z);
				direction = direction * scalar + (position - cubemapPosition.xyz);
			}
			#endif
			return direction;
		}
		float poiMax(float2 i)
		{
			return max(i.x, i.y);
		}
		float poiMax(float3 i)
		{
			return max(max(i.x, i.y), i.z);
		}
		float poiMax(float4 i)
		{
			return max(max(max(i.x, i.y), i.z), i.w);
		}
		float3 calculateNormal(in float3 baseNormal, in PoiMesh poiMesh, in Texture2D normalTexture, in SamplerState mainSampler, in float4 normal_ST, in float2 normalPan, in float normalUV, in float normalIntensity)
		{
			float3 normal = PoiUnpackNormalScale(normalTexture.Sample(mainSampler, POI_PAN_UV(poiUV(poiMesh.uv[normalUV], normal_ST), normalPan)), normalIntensity);
			return normalize(
			normal.x * poiMesh.tangent[0] +
			normal.y * poiMesh.binormal[0] +
			normal.z * baseNormal
			);
		}
		float remap(float x, float minOld, float maxOld, float minNew = 0, float maxNew = 1)
		{
			return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
		}
		float2 remap(float2 x, float2 minOld, float2 maxOld, float2 minNew = 0, float2 maxNew = 1)
		{
			return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
		}
		float3 remap(float3 x, float3 minOld, float3 maxOld, float3 minNew = 0, float3 maxNew = 1)
		{
			return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
		}
		float4 remap(float4 x, float4 minOld, float4 maxOld, float4 minNew = 0, float4 maxNew = 1)
		{
			return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
		}
		float remapClamped(float minOld, float maxOld, float x, float minNew = 0, float maxNew = 1)
		{
			return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), minNew, maxNew);
		}
		float2 remapClamped(float2 minOld, float2 maxOld, float2 x, float2 minNew, float2 maxNew)
		{
			return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), minNew, maxNew);
		}
		float3 remapClamped(float3 minOld, float3 maxOld, float3 x, float3 minNew, float3 maxNew)
		{
			return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), minNew, maxNew);
		}
		float4 remapClamped(float4 minOld, float4 maxOld, float4 x, float4 minNew, float4 maxNew)
		{
			return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), minNew, maxNew);
		}
		float2 calcParallax(in float height, in PoiCam poiCam)
		{
			return ((height * - 1) + 1) * (poiCam.tangentViewDir.xy / poiCam.tangentViewDir.z);
		}
		float4 poiBlend(const float sourceFactor, const  float4 sourceColor, const  float destinationFactor, const  float4 destinationColor, const float4 blendFactor)
		{
			float4 sA = 1 - blendFactor;
			const float4 blendData[11] = {
				float4(0.0, 0.0, 0.0, 0.0),
				float4(1.0, 1.0, 1.0, 1.0),
				destinationColor,
				sourceColor,
				float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
				sA,
				float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
				sA,
				float4(1.0, 1.0, 1.0, 1.0) - sA,
				saturate(sourceColor.aaaa),
				1 - sA,
			};
			return lerp(blendData[sourceFactor] * sourceColor + blendData[destinationFactor] * destinationColor, sourceColor, sA);
		}
		float blendColorBurn(float base, float blend)
		{
			return (blend == 0.0) ? blend : max((1.0 - ((1.0 - base) * rcp(random_uniform_float_only_used_to_stop_compiler_warnings + blend))), 0.0);
		}
		float3 blendColorBurn(float3 base, float3 blend)
		{
			return float3(blendColorBurn(base.r, blend.r), blendColorBurn(base.g, blend.g), blendColorBurn(base.b, blend.b));
		}
		float blendColorDodge(float base, float blend)
		{
			return (blend == 1.0) ? blend : min(base / (1.0 - blend), 1.0);
		}
		float3 blendColorDodge(float3 base, float3 blend)
		{
			return float3(blendColorDodge(base.r, blend.r), blendColorDodge(base.g, blend.g), blendColorDodge(base.b, blend.b));
		}
		float blendDarken(float base, float blend)
		{
			return min(blend, base);
		}
		float3 blendDarken(float3 base, float3 blend)
		{
			return float3(blendDarken(base.r, blend.r), blendDarken(base.g, blend.g), blendDarken(base.b, blend.b));
		}
		float blendOverlay(float base, float blend)
		{
			return base < 0.5 ? (2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
		}
		float3 blendOverlay(float3 base, float3 blend)
		{
			return float3(blendOverlay(base.r, blend.r), blendOverlay(base.g, blend.g), blendOverlay(base.b, blend.b));
		}
		float blendLighten(float base, float blend)
		{
			return max(blend, base);
		}
		float3 blendLighten(float3 base, float3 blend)
		{
			return float3(blendLighten(base.r, blend.r), blendLighten(base.g, blend.g), blendLighten(base.b, blend.b));
		}
		float blendLinearDodge(float base, float blend)
		{
			return min(base + blend, 1.0);
		}
		float3 blendLinearDodge(float3 base, float3 blend)
		{
			return base + blend;
		}
		float blendMultiply(float base, float blend)
		{
			return base * blend;
		}
		float3 blendMultiply(float3 base, float3 blend)
		{
			return base * blend;
		}
		float blendNormal(float base, float blend)
		{
			return blend;
		}
		float3 blendNormal(float3 base, float3 blend)
		{
			return blend;
		}
		float blendScreen(float base, float blend)
		{
			return 1.0 - ((1.0 - base) * (1.0 - blend));
		}
		float3 blendScreen(float3 base, float3 blend)
		{
			return float3(blendScreen(base.r, blend.r), blendScreen(base.g, blend.g), blendScreen(base.b, blend.b));
		}
		float blendSubtract(float base, float blend)
		{
			return max(base - blend, 0.0);
		}
		float3 blendSubtract(float3 base, float3 blend)
		{
			return max(base - blend, 0.0);
		}
		float blendMixed(float base, float blend)
		{
			return base + base * blend;
		}
		float3 blendMixed(float3 base, float3 blend)
		{
			return base + base * blend;
		}
		float3 customBlend(float3 base, float3 blend, float blendType, float alpha = 1)
		{
			float3 output = base;
			switch(blendType)
			{
				case 0: output = lerp(base, blend, alpha); break;
				case 1: output = lerp(base, blendDarken(base, blend), alpha); break;
				case 2: output = base * lerp(1, blend, alpha); break;
				case 5: output = lerp(base, blendLighten(base, blend), alpha); break;
				case 6: output = lerp(base, blendScreen(base, blend), alpha); break;
				case 7: output = blendSubtract(base, blend * alpha); break;
				case 8: output = lerp(base, blendLinearDodge(base, blend), alpha); break;
				case 9: output = lerp(base, blendOverlay(base, blend), alpha); break;
				case 20: output = lerp(base, blendMixed(base, blend), alpha); break;
				default: output = 0; break;
			}
			return output;
		}
		float customBlend(float base, float blend, float blendType, float alpha = 1)
		{
			float output = base;
			switch(blendType)
			{
				case 0: output = lerp(base, blend, alpha); break;
				case 2: output = base * lerp(1, blend, alpha); break;
				case 5: output = lerp(base, blendLighten(base, blend), alpha); break;
				case 6: output = lerp(base, blendScreen(base, blend), alpha); break;
				case 7: output = blendSubtract(base, blend * alpha); break;
				case 8: output = lerp(base, blendLinearDodge(base, blend), alpha); break;
				case 9: output = lerp(base, blendOverlay(base, blend), alpha); break;
				case 20: output = lerp(base, blendMixed(base, blend), alpha); break;
				default: output = 0; break;
			}
			return output;
		}
		#define REPLACE 0
		#define SUBSTRACT 1
		#define MULTIPLY 2
		#define DIVIDE 3
		#define MIN 4
		#define MAX 5
		#define AVERAGE 6
		#define ADD 7
		float maskBlend(float baseMask, float blendMask, float blendType)
		{
			float output = 0;
			switch(blendType)
			{
				case REPLACE: output = blendMask; break;
				case SUBSTRACT: output = baseMask - blendMask; break;
				case MULTIPLY: output = baseMask * blendMask; break;
				case DIVIDE: output = baseMask / blendMask; break;
				case MIN: output = min(baseMask, blendMask); break;
				case MAX: output = max(baseMask, blendMask); break;
				case AVERAGE: output = (baseMask + blendMask) * 0.5; break;
				case ADD: output = baseMask + blendMask; break;
			}
			return saturate(output);
		}
		float globalMaskBlend(float baseMask, float globalMaskIndex, float blendType, PoiMods poiMods)
		{
			if (globalMaskIndex == 0)
			{
				return baseMask;
			}
			else
			{
				return maskBlend(baseMask, poiMods.globalMask[globalMaskIndex - 1], blendType);
			}
		}
		inline float poiRand(float2 co)
		{
			float3 p3 = frac(float3(co.xyx) * 0.1031);
			p3 += dot(p3, p3.yzx + 33.33);
			return frac((p3.x + p3.y) * p3.z);
		}
		inline float4 poiRand4(float2 seed)
		{
			float3 p3 = frac(float3(seed.xyx) * 0.1031);
			p3 += dot(p3, p3.yzx + 33.33);
			float2 a = frac((p3.xx + p3.yz) * p3.zy);
			float2 s2 = seed + 37.0;
			float3 q3 = frac(float3(s2.xyx) * 0.1031);
			q3 += dot(q3, q3.yzx + 33.33);
			float2 b = frac((q3.xx + q3.yz) * q3.zy);
			return float4(a, b);
		}
		inline float2 poiRand2(float seed)
		{
			float2 x = float2(seed, seed * 1.3);
			float3 p3 = frac(float3(x.xyx) * 0.1031);
			p3 += dot(p3, p3.yzx + 33.33);
			return frac((p3.xx + p3.yz) * p3.zy);
		}
		inline float2 poiRand2(float2 seed)
		{
			float3 p3 = frac(float3(seed.xyx) * 0.1031);
			p3 += dot(p3, p3.yzx + 33.33);
			return frac((p3.xx + p3.yz) * p3.zy);
		}
		inline float poiRand3(float seed)
		{
			float p = frac(seed * 0.1031);
			p *= p + 33.33;
			p *= p + p;
			return frac(p);
		}
		inline float3 poiRand3(float2 seed)
		{
			float3 p3 = frac(float3(seed.xyx) * 0.1031);
			p3 += dot(p3, p3.yzx + 33.33);
			return frac((p3.xxy + p3.yzz) * p3.zyx);
		}
		inline float3 poiRand3(float3 seed)
		{
			float3 p3 = frac(seed * 0.1031);
			p3 += dot(p3, p3.zyx + 31.32);
			return frac((p3.xxy + p3.yzz) * p3.zyx);
		}
		inline float3 poiRand3Range(float2 Seed, float Range)
		{
			float3 r = poiRand3(Seed);
			return (r * 2.0 - 1.0) * Range;
		}
		float3 randomFloat3WiggleRange(float2 Seed, float Range, float wiggleSpeed, float timeOffset)
		{
			float3 rando = (float3(
			frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
			) * 2 - 1);
			float speed = 1 + wiggleSpeed;
			return float3(sin(((_Time.x + timeOffset) + rando.x * UNITY_PI) * speed), sin(((_Time.x + timeOffset) + rando.y * UNITY_PI) * speed), sin(((_Time.x + timeOffset) + rando.z * UNITY_PI) * speed)) * Range;
		}
		static const float3 HCYwts = float3(0.299, 0.587, 0.114);
		static const float HCLgamma = 3;
		static const float HCLy0 = 100;
		static const float HCLmaxL = 0.530454533953517; // == exp(HCLgamma / HCLy0) - 0.5
		static const float3 wref = float3(1.0, 1.0, 1.0);
		#define TAU 6.28318531
		float3 HUEtoRGB(in float H)
		{
			float R = abs(H * 6 - 3) - 1;
			float G = 2 - abs(H * 6 - 2);
			float B = 2 - abs(H * 6 - 4);
			return saturate(float3(R, G, B));
		}
		float3 RGBtoHCV(in float3 RGB)
		{
			float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0 / 3.0) : float4(RGB.gb, 0.0, -1.0 / 3.0);
			float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
			float C = Q.x - min(Q.w, Q.y);
			float H = abs((Q.w - Q.y) / (6 * C + EPSILON) + Q.z);
			return float3(H, C, Q.x);
		}
		float3 RGBtoHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
			float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));
			float d = q.x - min(q.w, q.y);
			float e = 1.0e-10;
			return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}
		float3 HSVtoRGB(float3 c)
		{
			float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
			float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
			return c.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
		}
		void DecomposeHDRColor(in float3 linearColorHDR, out float3 baseLinearColor, out float exposure)
		{
			float maxColorComponent = max(linearColorHDR.r, max(linearColorHDR.g, linearColorHDR.b));
			bool isSDR = maxColorComponent <= 1.0;
			float scaleFactor = isSDR ? 1.0 : (1.0 / maxColorComponent);
			exposure = isSDR ? 0.0 : log(maxColorComponent) * 1.44269504089; // ln(2)
			baseLinearColor = scaleFactor * linearColorHDR;
		}
		float3 ApplyHDRExposure(float3 linearColor, float exposure)
		{
			return linearColor * pow(2, exposure);
		}
		float3 ModifyViaHSV(float3 color, float h, float s, float v)
		{
			float3 colorHSV = RGBtoHSV(color);
			colorHSV.x = frac(colorHSV.x + h);
			colorHSV.y = saturate(colorHSV.y + s);
			colorHSV.z = saturate(colorHSV.z + v);
			return HSVtoRGB(colorHSV);
		}
		float3 ModifyViaHSV(float3 color, float3 HSVMod)
		{
			return ModifyViaHSV(color, HSVMod.x, HSVMod.y, HSVMod.z);
		}
		float4x4 brightnessMatrix(float brightness)
		{
			return float4x4(
			1, 0, 0, 0,
			0, 1, 0, 0,
			0, 0, 1, 0,
			brightness, brightness, brightness, 1
			);
		}
		float4x4 contrastMatrix(float contrast)
		{
			float t = (1.0 - contrast) / 2.0;
			return float4x4(
			contrast, 0, 0, 0,
			0, contrast, 0, 0,
			0, 0, contrast, 0,
			t, t, t, 1
			);
		}
		float4x4 saturationMatrix(float saturation)
		{
			float3 luminance = float3(0.3086, 0.6094, 0.0820);
			float oneMinusSat = 1.0 - saturation;
			float3 red = luminance.x * oneMinusSat;
			red += float3(saturation, 0, 0);
			float3 green = luminance.y * oneMinusSat;
			green += float3(0, saturation, 0);
			float3 blue = luminance.z * oneMinusSat;
			blue += float3(0, 0, saturation);
			return float4x4(
			red, 0,
			green, 0,
			blue, 0,
			0, 0, 0, 1
			);
		}
		float4 PoiColorBCS(float4 color, float brightness, float contrast, float saturation)
		{
			return mul(color, mul(brightnessMatrix(brightness), mul(contrastMatrix(contrast), saturationMatrix(saturation))));
		}
		float3 PoiColorBCS(float3 color, float brightness, float contrast, float saturation)
		{
			return mul(float4(color, 1), mul(brightnessMatrix(brightness), mul(contrastMatrix(contrast), saturationMatrix(saturation)))).rgb;
		}
		float3 linear_srgb_to_oklab(float3 c)
		{
			float l = 0.4122214708 * c.x + 0.5363325363 * c.y + 0.0514459929 * c.z;
			float m = 0.2119034982 * c.x + 0.6806995451 * c.y + 0.1073969566 * c.z;
			float s = 0.0883024619 * c.x + 0.2817188376 * c.y + 0.6299787005 * c.z;
			float l_ = pow(l, 1.0 / 3.0);
			float m_ = pow(m, 1.0 / 3.0);
			float s_ = pow(s, 1.0 / 3.0);
			return float3(
			0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_,
			1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_,
			0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_
			);
		}
		float3 oklab_to_linear_srgb(float3 c)
		{
			float l_ = c.x + 0.3963377774 * c.y + 0.2158037573 * c.z;
			float m_ = c.x - 0.1055613458 * c.y - 0.0638541728 * c.z;
			float s_ = c.x - 0.0894841775 * c.y - 1.2914855480 * c.z;
			float l = l_ * l_ * l_;
			float m = m_ * m_ * m_;
			float s = s_ * s_ * s_;
			return float3(
			+ 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
			- 1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
			- 0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s
			);
		}
		float3 hueShiftOKLab(float3 color, float shift, float selectOrShift)
		{
			float3 oklab = linear_srgb_to_oklab(color);
			float chroma = length(oklab.yz);
			oklab.y = selectOrShift > 0.5 ? oklab.y : chroma;
			oklab.z = selectOrShift > 0.5 ? oklab.z : 0;
			float s, c;
			sincos(shift * UNITY_TWO_PI, s, c);
			oklab.yz = float2(c * oklab.y - s * oklab.z, s * oklab.y + c * oklab.z);
			return oklab_to_linear_srgb(oklab);
		}
		float3 hueShiftHSV(float3 color, float hueOffset, float selectOrShift)
		{
			float3 hsvCol = RGBtoHSV(color);
			hsvCol.x = hsvCol.x * selectOrShift + hueOffset;
			return HSVtoRGB(hsvCol);
		}
		float3 hueShift(float3 color, float shift, float ColorSpace, float selectOrShift)
		{
			switch(ColorSpace)
			{
				case 0.0:
				return hueShiftOKLab(color, shift, selectOrShift);
				case 1.0:
				return hueShiftHSV(color, shift, selectOrShift);
				default:
				return float3(1.0, 0.0, 0.0);
			}
		}
		float4 hueShift(float4 color, float shift, float ColorSpace, float selectOrShift)
		{
			return float4(hueShift(color.rgb, shift, ColorSpace, selectOrShift), color.a);
		}
		float4x4 poiRotationMatrixFromAngles(float x, float y, float z)
		{
			float angleX = radians(x);
			float c = cos(angleX);
			float s = sin(angleX);
			float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
			0, c, -s, 0,
			0, s, c, 0,
			0, 0, 0, 1);
			float angleY = radians(y);
			c = cos(angleY);
			s = sin(angleY);
			float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
			0, 1, 0, 0,
			- s, 0, c, 0,
			0, 0, 0, 1);
			float angleZ = radians(z);
			c = cos(angleZ);
			s = sin(angleZ);
			float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
			s, c, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1);
			return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
		}
		float4x4 poiRotationMatrixFromAngles(float3 angles)
		{
			float angleX = radians(angles.x);
			float c = cos(angleX);
			float s = sin(angleX);
			float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
			0, c, -s, 0,
			0, s, c, 0,
			0, 0, 0, 1);
			float angleY = radians(angles.y);
			c = cos(angleY);
			s = sin(angleY);
			float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
			0, 1, 0, 0,
			- s, 0, c, 0,
			0, 0, 0, 1);
			float angleZ = radians(angles.z);
			c = cos(angleZ);
			s = sin(angleZ);
			float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
			s, c, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1);
			return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
		}
		float3 _VRChatMirrorCameraPos;
		float3 getCameraPosition()
		{
			#ifdef USING_STEREO_MATRICES
			return unity_StereoWorldSpaceCameraPos[0] * .5 + unity_StereoWorldSpaceCameraPos[1] * .5;
			#endif
			return _VRChatMirrorMode == 1 ? _VRChatMirrorCameraPos : _WorldSpaceCameraPos;
		}
		float2 calcPixelScreenUVs(half4 grabPos)
		{
			half2 uv = grabPos.xy / (grabPos.w + 0.0000000001);
			#if UNITY_SINGLE_PASS_STEREO
			uv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
			#else
			uv.xy *= _ScreenParams.xy;
			#endif
			return uv;
		}
		float CalcMipLevel(float2 texture_coord)
		{
			float2 dx = ddx(texture_coord);
			float2 dy = ddy(texture_coord);
			float delta_max_sqr = max(dot(dx, dx), dot(dy, dy));
			return 0.5 * log2(delta_max_sqr);
		}
		float inverseLerp(float A, float B, float T)
		{
			return (T - A) / (B - A);
		}
		float inverseLerp2(float2 a, float2 b, float2 value)
		{
			float2 AB = b - a;
			float2 AV = value - a;
			return dot(AV, AB) / dot(AB, AB);
		}
		float inverseLerp3(float3 a, float3 b, float3 value)
		{
			float3 AB = b - a;
			float3 AV = value - a;
			return dot(AV, AB) / dot(AB, AB);
		}
		float inverseLerp4(float4 a, float4 b, float4 value)
		{
			float4 AB = b - a;
			float4 AV = value - a;
			return dot(AV, AB) / dot(AB, AB);
		}
		float4 QuaternionFromMatrix(
		float m00, float m01, float m02,
		float m10, float m11, float m12,
		float m20, float m21, float m22)
		{
			float4 q;
			float trace = m00 + m11 + m22;
			if (trace > 0)
			{
				float s = sqrt(trace + 1) * 2;
				q.w = 0.25 * s;
				q.x = (m21 - m12) / s;
				q.y = (m02 - m20) / s;
				q.z = (m10 - m01) / s;
			}
			else if (m00 > m11 && m00 > m22)
			{
				float s = sqrt(1 + m00 - m11 - m22) * 2;
				q.w = (m21 - m12) / s;
				q.x = 0.25 * s;
				q.y = (m01 + m10) / s;
				q.z = (m02 + m20) / s;
			}
			else if (m11 > m22)
			{
				float s = sqrt(1 + m11 - m00 - m22) * 2;
				q.w = (m02 - m20) / s;
				q.x = (m01 + m10) / s;
				q.y = 0.25 * s;
				q.z = (m12 + m21) / s;
			}
			else
			{
				float s = sqrt(1 + m22 - m00 - m11) * 2;
				q.w = (m10 - m01) / s;
				q.x = (m02 + m20) / s;
				q.y = (m12 + m21) / s;
				q.z = 0.25 * s;
			}
			return q;
		}
		float4 MulQuat(float4 a, float4 b)
		{
			return float4(
			a.w * b.x + a.x * b.w + a.y * b.z - a.z * b.y,
			a.w * b.y - a.x * b.z + a.y * b.w + a.z * b.x,
			a.w * b.z + a.x * b.y - a.y * b.x + a.z * b.w,
			a.w * b.w - a.x * b.x - a.y * b.y - a.z * b.z
			);
		}
		float4 QuaternionFromBasis(float3 sx, float3 sy, float3 sz)
		{
			return QuaternionFromMatrix(
			sx.x, sy.x, sz.x,
			sx.y, sy.y, sz.y,
			sx.z, sy.z, sz.z
			);
		}
		float4 BuildQuatFromForwardUp(float3 forward, float3 up)
		{
			float3 f = normalize(forward);
			float3 u = normalize(up);
			float3 x = normalize(cross(u, f));
			float3 y = cross(f, x);
			return QuaternionFromBasis(x, y, f);
		}
		float3 QuaternionToEuler(float4 q)
		{
			float3 euler;
			float sinr_cosp = 2 * (q.w * q.z + q.x * q.y);
			float cosr_cosp = 1 - 2 * (q.z * q.z + q.x * q.x);
			euler.z = atan2(sinr_cosp, cosr_cosp) * 57.2958;
			float sinp = 2 * (q.w * q.x - q.y * q.z);
			if (abs(sinp) >= 1)
			euler.x = (sinp >= 0 ? 1 : - 1) * 90;
			else
			euler.x = asin(sinp) * 57.2958;
			float siny_cosp = 2 * (q.w * q.y + q.z * q.x);
			float cosy_cosp = 1 - 2 * (q.x * q.x + q.y * q.y);
			euler.y = atan2(siny_cosp, cosy_cosp) * 57.2958;
			return euler;
		}
		float4 EulerToQuaternion(float3 euler)
		{
			float3 eulerRad = euler * 0.0174533;
			float cx = cos(eulerRad.x * 0.5);
			float sx = sin(eulerRad.x * 0.5);
			float cy = cos(eulerRad.y * 0.5);
			float sy = sin(eulerRad.y * 0.5);
			float cz = cos(eulerRad.z * 0.5);
			float sz = sin(eulerRad.z * 0.5);
			float4 q;
			q.w = cx * cy * cz + sx * sy * sz;
			q.x = sx * cy * cz - cx * sy * sz;
			q.y = cx * sy * cz + sx * cy * sz;
			q.z = cx * cy * sz - sx * sy * cz;
			return q;
		}
		float4 quaternion_conjugate(float4 v)
		{
			return float4(
			v.x, -v.yzw
			);
		}
		float4 quaternion_mul(float4 v1, float4 v2)
		{
			float4 result1 = (v1.x * v2 + v1 * v2.x);
			float4 result2 = float4(
			- dot(v1.yzw, v2.yzw),
			cross(v1.yzw, v2.yzw)
			);
			return float4(result1 + result2);
		}
		float4 get_quaternion_from_angle(float3 axis, float angle)
		{
			float sn = sin(angle * 0.5);
			float cs = cos(angle * 0.5);
			return float4(axis * sn, cs);
		}
		float4 quaternion_from_vector(float3 inVec)
		{
			return float4(0.0, inVec);
		}
		float degree_to_radius(float degree)
		{
			return (
			degree / 180.0 * UNITY_PI
			);
		}
		float3 rotate_with_quaternion(float3 inVec, float3 rotation)
		{
			float4 qx = get_quaternion_from_angle(float3(1, 0, 0), radians(rotation.x));
			float4 qy = get_quaternion_from_angle(float3(0, 1, 0), radians(rotation.y));
			float4 qz = get_quaternion_from_angle(float3(0, 0, 1), radians(rotation.z));
			#define MUL3(A, B, C) quaternion_mul(quaternion_mul((A), (B)), (C))
			float4 quaternion = normalize(MUL3(qx, qy, qz));
			float4 conjugate = quaternion_conjugate(quaternion);
			float4 inVecQ = quaternion_from_vector(inVec);
			float3 rotated = (
			MUL3(quaternion, inVecQ, conjugate)
			).yzw;
			return rotated;
		}
		float3 RotateByQuaternion(float4 q, float3 v)
		{
			float3 u = q.xyz;
			float s = q.w;
			return 2.0 * dot(u, v) * u
			+ (s * s - dot(u, u)) * v
			+ 2.0 * s * cross(u, v);
		}
		float4 SlerpQuaternion(float4 qa, float4 qb, float t)
		{
			float cosHalfTheta = dot(qa, qb);
			if (cosHalfTheta < 0.0)
			{
				qb = -qb;
				cosHalfTheta = -cosHalfTheta;
			}
			if (cosHalfTheta > 0.9995)
			{
				float4 qr = normalize(qa * (1 - t) + qb * t);
				return qr;
			}
			float halfTheta = acos(cosHalfTheta);
			float sinHalfTheta = sqrt(1.0 - cosHalfTheta * cosHalfTheta);
			float a = sin((1 - t) * halfTheta) / sinHalfTheta;
			float b = sin(t * halfTheta) / sinHalfTheta;
			return qa * a + qb * b;
		}
		float4 transform(float4 input, float4 pos, float4 rotation, float4 scale)
		{
			input.rgb *= (scale.xyz * scale.w);
			input = float4(rotate_with_quaternion(input.xyz, rotation.xyz * rotation.w) + (pos.xyz * pos.w), input.w);
			return input;
		}
		float2 RotateUV(float2 _uv, float _radian, float2 _piv, float _time)
		{
			float RotateUV_ang = _radian;
			float RotateUV_cos = cos(_time * RotateUV_ang);
			float RotateUV_sin = sin(_time * RotateUV_ang);
			return (mul(_uv - _piv, float2x2(RotateUV_cos, -RotateUV_sin, RotateUV_sin, RotateUV_cos)) + _piv);
		}
		float3 RotateAroundAxis(float3 original, float3 axis, float radian)
		{
			float s = sin(radian);
			float c = cos(radian);
			float one_minus_c = 1.0 - c;
			axis = normalize(axis);
			float3x3 rot_mat = {
				one_minus_c * axis.x * axis.x + c, one_minus_c * axis.x * axis.y - axis.z * s, one_minus_c * axis.z * axis.x + axis.y * s,
				one_minus_c * axis.x * axis.y + axis.z * s, one_minus_c * axis.y * axis.y + c, one_minus_c * axis.y * axis.z - axis.x * s,
				one_minus_c * axis.z * axis.x - axis.y * s, one_minus_c * axis.y * axis.z + axis.x * s, one_minus_c * axis.z * axis.z + c
			};
			return mul(rot_mat, original);
		}
		float3 poiThemeColor(in PoiMods poiMods, in float3 srcColor, in float themeIndex)
		{
			float3 outputColor = srcColor;
			if (themeIndex != 0)
			{
				themeIndex = max(themeIndex - 1, 0);
				if (themeIndex <= 3)
				{
					outputColor = poiMods.globalColorTheme[themeIndex].rgb;
				}
				else
				{
					#ifdef POI_AUDIOLINK
					if (poiMods.audioLinkAvailable)
					{
						outputColor = poiMods.globalColorTheme[themeIndex].rgb;
					}
					#endif
				}
			}
			return outputColor;
		}
		float3 lilToneCorrection(float3 c, float4 hsvg)
		{
			c = pow(abs(c), hsvg.w);
			float4 p = (c.b > c.g) ? float4(c.bg, -1.0, 2.0 / 3.0) : float4(c.gb, 0.0, -1.0 / 3.0);
			float4 q = (p.x > c.r) ? float4(p.xyw, c.r) : float4(c.r, p.yzx);
			float d = q.x - min(q.w, q.y);
			float e = 1.0e-10;
			float3 hsv = float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			hsv = float3(hsv.x + hsvg.x, saturate(hsv.y * hsvg.y), saturate(hsv.z * hsvg.z));
			return hsv.z - hsv.z * hsv.y + hsv.z * hsv.y * saturate(abs(frac(hsv.x + float3(1.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0) - 1.0);
		}
		float3 lilBlendColor(float3 dstCol, float3 srcCol, float3 srcA, int blendMode)
		{
			float3 ad = dstCol + srcCol;
			float3 mu = dstCol * srcCol;
			float3 outCol = float3(0, 0, 0);
			if (blendMode == 0) outCol = srcCol; // Normal
			if (blendMode == 1) outCol = ad; // Add
			if (blendMode == 2) outCol = max(ad - mu, dstCol); // Screen
			if (blendMode == 3) outCol = mu; // Multiply
			return lerp(dstCol, outCol, srcA);
		}
		float lilIsIn0to1(float f)
		{
			float value = 0.5 - abs(f - 0.5);
			return saturate(value / clamp(fwidth(value), 0.0001, 1.0));
		}
		float lilIsIn0to1(float f, float nv)
		{
			float value = 0.5 - abs(f - 0.5);
			return saturate(value / clamp(fwidth(value), 0.0001, nv));
		}
		float poiEdgeLinearNoSaturate(float value, float border)
		{
			return (value - border) / clamp(fwidth(value), 0.0001, 1.0);
		}
		float3 poiEdgeLinearNoSaturate(float value, float3 border)
		{
			return float3(
			(value - border.x) / clamp(fwidth(value), 0.0001, 1.0),
			(value - border.y) / clamp(fwidth(value), 0.0001, 1.0),
			(value - border.z) / clamp(fwidth(value), 0.0001, 1.0)
			);
		}
		float poiEdgeLinearNoSaturate(float value, float border, float blur)
		{
			float borderMin = saturate(border - blur * 0.5);
			float borderMax = saturate(border + blur * 0.5);
			return (value - borderMin) / max(saturate(borderMax - borderMin + fwidth(value)), .0001);
		}
		float poiEdgeLinearNoSaturate(float value, float border, float blur, float borderRange)
		{
			float borderMin = saturate(border - blur * 0.5 - borderRange);
			float borderMax = saturate(border + blur * 0.5);
			return (value - borderMin) / max(saturate(borderMax - borderMin + fwidth(value)), .0001);
		}
		float poiEdgeNonLinearNoSaturate(float value, float border)
		{
			float fwidthValue = fwidth(value);
			return smoothstep(border - fwidthValue, border + fwidthValue, value);
		}
		float poiEdgeNonLinearNoSaturate(float value, float border, float blur)
		{
			float fwidthValue = fwidth(value);
			float borderMin = saturate(border - blur * 0.5);
			float borderMax = saturate(border + blur * 0.5);
			return smoothstep(borderMin - fwidthValue, borderMax + fwidthValue, value);
		}
		float poiEdgeNonLinearNoSaturate(float value, float border, float blur, float borderRange)
		{
			float fwidthValue = fwidth(value);
			float borderMin = saturate(border - blur * 0.5 - borderRange);
			float borderMax = saturate(border + blur * 0.5);
			return smoothstep(borderMin - fwidthValue, borderMax + fwidthValue, value);
		}
		float poiEdgeNonLinear(float value, float border)
		{
			return saturate(poiEdgeNonLinearNoSaturate(value, border));
		}
		float poiEdgeNonLinear(float value, float border, float blur)
		{
			return saturate(poiEdgeNonLinearNoSaturate(value, border, blur));
		}
		float poiEdgeNonLinear(float value, float border, float blur, float borderRange)
		{
			return saturate(poiEdgeNonLinearNoSaturate(value, border, blur, borderRange));
		}
		float poiEdgeLinear(float value, float border)
		{
			return saturate(poiEdgeLinearNoSaturate(value, border));
		}
		float poiEdgeLinear(float value, float border, float blur)
		{
			return saturate(poiEdgeLinearNoSaturate(value, border, blur));
		}
		float poiEdgeLinear(float value, float border, float blur, float borderRange)
		{
			return saturate(poiEdgeLinearNoSaturate(value, border, blur, borderRange));
		}
		float3 OpenLitLinearToSRGB(float3 col)
		{
			return LinearToGammaSpace(col);
		}
		float3 OpenLitSRGBToLinear(float3 col)
		{
			return GammaToLinearSpace(col);
		}
		float OpenLitLuminance(float3 rgb)
		{
			#if defined(UNITY_COLORSPACE_GAMMA)
			return dot(rgb, float3(0.22, 0.707, 0.071));
			#else
			return dot(rgb, float3(0.0396819152, 0.458021790, 0.00609653955));
			#endif
		}
		float3 AdjustLitLuminance(float3 rgb, float targetLuminance)
		{
			float currentLuminance;
			#if defined(UNITY_COLORSPACE_GAMMA)
			currentLuminance = dot(rgb, float3(0.22, 0.707, 0.071));
			#else
			currentLuminance = dot(rgb, float3(0.0396819152, 0.458021790, 0.00609653955));
			#endif
			float luminanceRatio = targetLuminance / currentLuminance;
			return rgb * luminanceRatio;
		}
		float3 ClampLuminance(float3 rgb, float minLuminance, float maxLuminance)
		{
			float currentLuminance = dot(rgb, float3(0.299, 0.587, 0.114));
			float minRatio = (currentLuminance != 0) ? minLuminance / currentLuminance : 1.0;
			float maxRatio = (currentLuminance != 0) ? maxLuminance / currentLuminance : 1.0;
			float luminanceRatio = clamp(min(maxRatio, max(minRatio, 1.0)), 0.0, 1.0);
			return lerp(rgb, rgb * luminanceRatio, luminanceRatio < 1.0);
		}
		float3 MaxLuminance(float3 rgb, float maxLuminance)
		{
			float currentLuminance = dot(rgb, float3(0.299, 0.587, 0.114));
			float luminanceRatio = (currentLuminance != 0) ? maxLuminance / max(currentLuminance, 0.00001) : 1.0;
			return lerp(rgb, rgb * luminanceRatio, currentLuminance > maxLuminance);
		}
		float OpenLitGray(float3 rgb)
		{
			return dot(rgb, float3(1.0 / 3.0, 1.0 / 3.0, 1.0 / 3.0));
		}
		void OpenLitShadeSH9ToonDouble(float3 lightDirection, out float3 shMax, out float3 shMin)
		{
			#if !defined(LIGHTMAP_ON)
			float3 N = lightDirection * 0.666666;
			float4 vB = N.xyzz * N.yzzx;
			float3 res = float3(PoiSHAr.w, PoiSHAg.w, PoiSHAb.w);
			res.r += dot(PoiSHBr, vB);
			res.g += dot(PoiSHBg, vB);
			res.b += dot(PoiSHBb, vB);
			res += PoiSHC.rgb * (N.x * N.x - N.y * N.y);
			float3 l1;
			l1.r = dot(PoiSHAr.rgb, N);
			l1.g = dot(PoiSHAg.rgb, N);
			l1.b = dot(PoiSHAb.rgb, N);
			shMax = res + l1;
			shMin = res - l1;
			#if defined(UNITY_COLORSPACE_GAMMA)
			shMax = OpenLitLinearToSRGB(shMax);
			shMin = OpenLitLinearToSRGB(shMin);
			#endif
			#else
			shMax = 0.0;
			shMin = 0.0;
			#endif
		}
		float3 OpenLitComputeCustomLightDirection(float4 lightDirectionOverride)
		{
			float3 customDir = length(lightDirectionOverride.xyz) * normalize(mul((float3x3)unity_ObjectToWorld, lightDirectionOverride.xyz));
			return lightDirectionOverride.w ? customDir : lightDirectionOverride.xyz; // .w isn't doc'd anywhere and is always 0 unless end user changes it
		}
		float3 OpenLitLightingDirectionForSH9(float3 mainDir)
		{
			#if !defined(LIGHTMAP_ON)
			float3 sh9Dir = PoiSHAr.xyz * 0.333333 + PoiSHAg.xyz * 0.333333 + PoiSHAb.xyz * 0.333333;
			float3 sh9DirAbs = float3(sh9Dir.x, abs(sh9Dir.y), sh9Dir.z);
			#else
			float3 sh9Dir = 0;
			float3 sh9DirAbs = 0;
			#endif
			float3 lightDirectionForSH9 = sh9Dir + mainDir;
			lightDirectionForSH9 = dot(lightDirectionForSH9, lightDirectionForSH9) < 0.000001 ? 0 : normalize(lightDirectionForSH9);
			return lightDirectionForSH9;
		}
		float3 OpenLitLightingDirectionForSH9(Light light)
		{
			float3 mainDir = light.direction * OpenLitLuminance(light.color);
			return OpenLitLightingDirectionForSH9(mainDir);
		}
		float3 OpenLitLightingDirection(float4 lightDirectionOverride, float3 mainDir)
		{
			#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
			float3 sh9Dir = PoiSHAr.xyz * 0.333333 + PoiSHAg.xyz * 0.333333 + PoiSHAb.xyz * 0.333333;
			float3 sh9DirAbs = float3(sh9Dir.x, abs(sh9Dir.y), sh9Dir.z);
			#else
			float3 sh9Dir = 0;
			float3 sh9DirAbs = 0;
			#endif
			float3 customDir = OpenLitComputeCustomLightDirection(lightDirectionOverride);
			return normalize(sh9DirAbs + mainDir + customDir);
		}
		float3 OpenLitLightingDirection(float4 lightDirectionOverride, Light light)
		{
			float3 mainDir = light.direction.xyz * OpenLitLuminance(light.color);
			return OpenLitLightingDirection(lightDirectionOverride, mainDir);
		}
		float3 OpenLitLightingDirection(Light light)
		{
			float4 customDir = float4(0.001, 0.002, 0.001, 0.0);
			return OpenLitLightingDirection(customDir, light);
		}
		inline float4 CalculateFrustumCorrection()
		{
			float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
			float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
			return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
		}
		inline float CorrectedLinearEyeDepth(float z, float correctionFactor)
		{
			return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
		}
		float evalRamp4(float time, float4 ramp)
		{
			return lerp(ramp.x, ramp.y, smoothstep(ramp.z, ramp.w, time));
		}
		float2 sharpSample(float4 texelSize, float2 p)
		{
			p = p * texelSize.zw;
			float2 c = max(0.0, fwidth(p));
			p = floor(p) + saturate(frac(p) / c);
			p = (p - 0.5) * texelSize.xy;
			return p;
		}
		void applyToGlobalMask(inout PoiMods poiMods, int index, int blendType, float val)
		{
			float valBlended = saturate(maskBlend(poiMods.globalMask[index], val, blendType));
			switch(index)
			{
				case 0: poiMods.globalMask[0] = valBlended; break;
				case 1: poiMods.globalMask[1] = valBlended; break;
				case 2: poiMods.globalMask[2] = valBlended; break;
				case 3: poiMods.globalMask[3] = valBlended; break;
				case 4: poiMods.globalMask[4] = valBlended; break;
				case 5: poiMods.globalMask[5] = valBlended; break;
				case 6: poiMods.globalMask[6] = valBlended; break;
				case 7: poiMods.globalMask[7] = valBlended; break;
				case 8: poiMods.globalMask[8] = valBlended; break;
				case 9: poiMods.globalMask[9] = valBlended; break;
				case 10: poiMods.globalMask[10] = valBlended; break;
				case 11: poiMods.globalMask[11] = valBlended; break;
				case 12: poiMods.globalMask[12] = valBlended; break;
				case 13: poiMods.globalMask[13] = valBlended; break;
				case 14: poiMods.globalMask[14] = valBlended; break;
				case 15: poiMods.globalMask[15] = valBlended; break;
			}
		}
		void assignValueToVectorFromIndex(inout float4 vec, int index, float value)
		{
			switch(index)
			{
				case 0: vec[0] = value; break;
				case 1: vec[1] = value; break;
				case 2: vec[2] = value; break;
				case 3: vec[3] = value; break;
			}
		}
		float3 mod289(float3 x)
		{
			return x - floor(x * (1.0 / 289.0)) * 289.0;
		}
		float2 mod289(float2 x)
		{
			return x - floor(x * (1.0 / 289.0)) * 289.0;
		}
		float3 permute(float3 x)
		{
			return mod289(((x * 34.0) + 1.0) * x);
		}
		float snoise(float2 v)
		{
			const float4 C = float4(0.211324865405187, // (3.0 - sqrt(3.0)) / 6.0
			0.366025403784439, // 0.5 * (sqrt(3.0) - 1.0)
			- 0.577350269189626, // - 1.0 + 2.0 * C.x
			0.024390243902439); // 1.0 / 41.0
			float2 i = floor(v + dot(v, C.yy));
			float2 x0 = v - i + dot(i, C.xx);
			float2 i1;
			i1 = (x0.x > x0.y) ? float2(1.0, 0.0) : float2(0.0, 1.0);
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod289(i); // Avoid truncation effects in permutation
			float3 p = permute(permute(i.y + float3(0.0, i1.y, 1.0))
			+ i.x + float3(0.0, i1.x, 1.0));
			float3 m = max(0.5 - float3(dot(x0, x0), dot(x12.xy, x12.xy), dot(x12.zw, x12.zw)), 0.0);
			m = m * m ;
			m = m * m ;
			float3 x = 2.0 * frac(p * C.www) - 1.0;
			float3 h = abs(x) - 0.5;
			float3 ox = floor(x + 0.5);
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * (a0 * a0 + h * h);
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot(m, g);
		}
		float poiInvertToggle(in float value, in float toggle)
		{
			return (toggle == 0 ? value : 1 - value);
		}
		float3 PoiBlendNormal(float3 dstNormal, float3 srcNormal)
		{
			return float3(dstNormal.xy + srcNormal.xy, dstNormal.z * srcNormal.z);
		}
		float3 lilTransformDirOStoWS(float3 directionOS, bool doNormalize)
		{
			if (doNormalize) return normalize(mul((float3x3)unity_ObjectToWorld, directionOS));
			else            return mul((float3x3)unity_ObjectToWorld, directionOS);
		}
		float2 poiGetWidthAndHeight(Texture2D tex)
		{
			uint width, height;
			tex.GetDimensions(width, height);
			return float2(width, height);
		}
		float2 poiGetWidthAndHeight(Texture2DArray tex)
		{
			uint width, height, element;
			tex.GetDimensions(width, height, element);
			return float2(width, height);
		}
		bool SceneHasReflections()
		{
			bool hasReflection = false;
			float width, height;
			unity_SpecCube0.GetDimensions(width, height);
			hasReflection = !(width * height < 2);
			#if CLUSTER_HAS_REFLECTION_PROBES
			urp_ReflProbes_Atlas.GetDimensions(width, height);
			hasReflection = hasReflection | !(width * height < 2);
			#endif
			return hasReflection;
		}
		void applyUnityFog(inout float3 col, float2 fogData)
		{
			float fogFactor = 1.0;
			float depth = UNITY_Z_0_FAR_FROM_CLIPSPACE(fogData.x);
			if (unity_FogParams.z != unity_FogParams.w)
			{
				fogFactor = depth * unity_FogParams.z + unity_FogParams.w;
			}
			else if (fogData.y)
			{
				float exponent_val = unity_FogParams.x * depth;
				fogFactor = exp2(-exponent_val * exponent_val);
			}
			else if (unity_FogParams.y != 0.0f)
			{
				float exponent = unity_FogParams.y * depth;
				fogFactor = exp2(-exponent);
			}
			float3 appliedFogColor = unity_FogColor.rgb;
			#if defined(POI_PASS_ADD)
			appliedFogColor = float3(0, 0, 0);
			#endif
			col.rgb = lerp(appliedFogColor, col.rgb, saturate(fogFactor));
		}
		ENDHLSL
		Pass
		{
			Name "ForwardLit"
			Tags { "LightMode" = "UniversalForward" }
			Stencil
			{
				Ref [_StencilRef]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilCompareFunction]
				Pass [_StencilPassOp]
				Fail [_StencilFailOp]
				ZFail [_StencilZFailOp]
			}
			ZWrite [_ZWrite]
			Cull Off
			ZTest [_ZTest]
			ColorMask RGB
			Offset [_OffsetFactor], [_OffsetUnits]
			BlendOp [_BlendOp], [_BlendOpAlpha]
			Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
			HLSLPROGRAM
 #define _STOCHASTICMODE_DELIOT_HEITZ 
 #define OPTIMIZER_ENABLED 
			#pragma target 5.0
			#pragma skip_variants DECALS_OFF DECALS_3RT DECALS_4RT DECAL_SURFACE_GRADIENT _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3 _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH _DECAL_LAYERS
			#pragma skip_variants _MAIN_LIGHT_SHADOWS_SCREEN _SCREEN_SPACE_OCCLUSION _USE_FAST_SRGB_LINEAR_CONVERSION _LIGHT_LAYERS
			#if !defined(POI_WORLD)
			#pragma skip_variants _ADDITIONAL_LIGHT_SHADOWS _ADDITIONAL_LIGHTS_VERTEX LIGHTMAP_ON DYNAMICLIGHTMAP_ON LIGHTMAP_SHADOW_MIXING SHADOWS_SHADOWMASK DIRLIGHTMAP_COMBINED _MIXED_LIGHTING_SUBTRACTIVE
			#endif
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag
			#if POI_PIPE == POI_URP
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _CLUSTER_LIGHT_LOOP
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile _ FOG_EXP2
			#endif
			#if POI_PIPE == POI_BIRP
			#pragma multi_compile_fwdbase
			#pragma multi_compile_vertex _ FOG_EXP2
			#pragma multi_compile_fragment _ VERTEXLIGHT_ON
			#endif
			#ifdef POI_WORLD
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#endif
			#pragma multi_compile_instancing
			#define POI_PASS_BASE
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonMaterial.hlsl"
			#include "Packages/com.unity.render-pipelines.core/Runtime/Lighting/ProbeVolume/ProbeVolume.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			CBUFFER_START(UnityPerMaterial)
			float _GrabMode;
			float _Mode;
			#ifndef _STOCHASTICMODE_NONE
			#ifdef _STOCHASTICMODE_DELIOT_HEITZ
			float _StochasticDeliotHeitzDensity;
			#endif
			#endif
			float4 _LightingAOMaps_ST;
			float2 _LightingAOMapsPan;
			float _LightingAOMapsUV;
			float _LightDataAOStrengthR;
			float _LightDataAOStrengthG;
			float _LightDataAOStrengthB;
			float _LightDataAOStrengthA;
			float _LightDataAOGlobalMaskR;
			float _LightDataAOGlobalMaskBlendTypeR;
			float4 _LightingDetailShadowMaps_ST;
			float2 _LightingDetailShadowMapsPan;
			float _LightingDetailShadowMapsUV;
			float _LightingDetailShadowStrengthR;
			float _LightingDetailShadowStrengthG;
			float _LightingDetailShadowStrengthB;
			float _LightingDetailShadowStrengthA;
			float _LightingAddDetailShadowStrengthR;
			float _LightingAddDetailShadowStrengthG;
			float _LightingAddDetailShadowStrengthB;
			float _LightingAddDetailShadowStrengthA;
			float _LightDataDetailShadowGlobalMaskR;
			float _LightDataDetailShadowGlobalMaskBlendTypeR;
			float4 _LightingShadowMasks_ST;
			float2 _LightingShadowMasksPan;
			float _LightingShadowMasksUV;
			float _LightingShadowMaskStrengthR;
			float _LightingShadowMaskStrengthG;
			float _LightingShadowMaskStrengthB;
			float _LightingShadowMaskStrengthA;
			float _LightDataShadowMaskGlobalMaskR;
			float _LightDataShadowMaskGlobalMaskBlendTypeR;
			float _Unlit_Intensity;
			float _LightingColorMode;
			float _LightingMapMode;
			#if defined(PROP_LIGHTDATASDFMAP)
			float4 _LightDataSDFMap_ST;
			float2 _LightDataSDFMapPan;
			float _LightDataSDFMapUV;
			float _LightDataSDFMapLOD;
			float _LightDataSDFBlendY;
			#endif
			float _LightingDirectionMode;
			float3 _LightngForcedDirection;
			float _LightingViewDirOffsetPitch;
			float _LightingViewDirOffsetYaw;
			float _LightingIndirectUsesNormals;
			float _LightingCapEnabled;
			float _LightingCap;
			float _LightingForceColorEnabled;
			float3 _LightingForcedColor;
			float _LightingForcedColorThemeIndex;
			float _LightingCastedShadows;
			float _LightingMonochromatic;
			float _LightingMinLightBrightness;
			float _LightingAdditiveEnable;
			float _LightingAdditiveLimited;
			float _LightingAdditiveLimit;
			float _LightingAdditiveCastedShadows;
			float _LightingAdditiveMonochromatic;
			float _LightingAdditivePassthrough;
			float _DisableDirectionalInAdd;
			float _LightingVertexLightingEnabled;
			float _LightingMirrorVertexLightingEnabled;
			float _LightingEnableLightVolumes;
			float _LightDataDebugEnabled;
			float _LightingDebugVisualize;
			uint _UdonForceSceneLighting;
			float4 _Color;
			float _ColorThemeIndex;
			float _MainPixelMode;
			float4 _MainTex_ST;
			float4 _MainTex_TexelSize;
			float2 _MainTexPan;
			float _MainTexUV;
			float _MainTexStochastic;
			float _MainIgnoreTexAlpha;
			float4 _BumpMap_ST;
			float2 _BumpMapPan;
			float _BumpMapUV;
			float _BumpScale;
			float _BumpMapStochastic;
			float4 _AlphaMask_ST;
			float2 _AlphaMaskPan;
			float _AlphaMaskUV;
			float _AlphaMaskInvert;
			float _MainAlphaMaskMode;
			float _AlphaMaskBlendStrength;
			float _AlphaMaskValue;
			float _Cutoff;
			float _AlphaForceOpaque;
			float _AlphaMod;
			float _AlphaPremultiply;
			float _AlphaBoostFA;
			float _AlphaGlobalMask;
			float _AlphaGlobalMaskBlendType;
			float _ParticleRandomSeedOffset;
			float _ParticleApplyGlobalMaskIndex;
			float _ParticleApplyGlobalMaskBlendType;
			float4 _ParticleBaseColorOverride;
			float _ParticleOverrideBaseColor;
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleSpawnMask_ST;
			float2 _ParticleSpawnMaskPan;
			float _ParticleSpawnMaskUV;
			float _ParticleSpawnMaskChannel;
			float _ParticleSpawnMaskInvert;
			#endif
			float _ParticleSpawnMaskVertexColor;
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleTexture_ST;
			float2 _ParticleTexturePan;
			float _ParticleTextureUV;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleNoiseTex_ST;
			float2 _ParticleNoiseTexPan;
			float _ParticleNoiseTexUV;
			#endif
			float4 _ParticleSizeRamp;
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleLifetimeGradient_ST;
			#endif
			float4 _ParticleAlphaRamp;
			float4 _ParticleEmissionRamp;
			float _ParticleColorBlendMode;
			float _ParticleColorBlendAlpha;
			float _ParticleEmissionBlendMode;
			float4 _ParticleColor;
			float _ParticleColorThemeIndex;
			float4 _ParticleEmissionStrength;
			float4 _ParticleAlpha;
			float _ParticleSpriteSheetEnabled;
			float _ParticleSpriteSheetColumns;
			float _ParticleSpriteSheetRows;
			float _ParticleSpriteSheetFrameSelection;
			float _ParticleSpriteSheetFPS;
			float _ParticleSpriteSheetRandomStart;
			float _ParticleSpriteSheetTotalFrames;
			float _ParticleSpriteSheetInset;
			float _ParticleSpriteSheetFrameBias;
			float _ParticleRenderBaseMesh;
			float _ParticleDensity;
			float4 _ParticleSize;
			float4 _ParticleFloatDistance;
			float4 _ParticleNoiseStrength;
			float4 _ParticleNoiseScrollSpeed;
			float4 _ParticleRotationSpeed;
			float _ParticleMotionMode;
			float4 _ParticleTravelDistance;
			float _ParticleCycleDuration;
			float _ParticleSpawnReductionEnabled;
			float4 _ParticleSpawnDistances;
			float4 _ParticleSpawnReduction;
			float _ParticlePosUVSource;
			float _ParticlePosUVDestination;
			float4 _ParticleWorldDirection;
			float _ParticleDirectionStrength;
			float _ParticleDirectionStrengthCurve;
			float _ParticleSpawnDirectionCull;
			float4 _ParticleDirectionRamp;
			float _ParticleFaceDirection;
			float _ParticleInheritNormal;
			float _ParticleALType;
			#ifdef POI_AUDIOLINK
			float _ParticleALWaveformScale;
			float _ParticleALWaveformSmoothing;
			float _ParticleALGradientSource;
			float _ParticleALReactiveEmission;
			float _ParticleALReactiveEmissionBand;
			float4 _ParticleALReactiveEmissionRamp;
			float _ParticleALSizeModulation;
			float _ParticleALSizeBand;
			float4 _ParticleALSizeRamp;
			float _ParticleALRotationModulation;
			float _ParticleALRotationBand;
			float _ParticleALRotationType;
			float _ParticleALRotationSpeed;
			float _ParticleALNoiseModulation;
			float _ParticleALNoiseBand;
			float4 _ParticleALNoiseRamp;
			float _ParticleALAlphaModulation;
			float _ParticleALAlphaBand;
			float4 _ParticleALAlphaRamp;
			float _ParticleALSpriteSheetFrameControl;
			float _ParticleALSpriteSheetBand;
			#endif
			float4 _GlobalThemeColor0;
			float4 _GlobalThemeColor1;
			float4 _GlobalThemeColor2;
			float4 _GlobalThemeColor3;
			float _GlobalThemeHue0;
			float _GlobalThemeHue1;
			float _GlobalThemeHue2;
			float _GlobalThemeHue3;
			float _GlobalThemeHueSpeed0;
			float _GlobalThemeHueSpeed1;
			float _GlobalThemeHueSpeed2;
			float _GlobalThemeHueSpeed3;
			float _GlobalThemeSaturation0;
			float _GlobalThemeSaturation1;
			float _GlobalThemeSaturation2;
			float _GlobalThemeSaturation3;
			float _GlobalThemeValue0;
			float _GlobalThemeValue1;
			float _GlobalThemeValue2;
			float _GlobalThemeValue3;
			int _GlobalMaskVertexColorLinearSpace;
			float _StereoEnabled;
			float _PolarUV;
			float2 _PolarCenter;
			float _PolarRadialScale;
			float _PolarLengthScale;
			float _PolarSpiralPower;
			float _PanoUseBothEyes;
			float _UVModWorldPos0;
			float _UVModWorldPos1;
			float _UVModLocalPos0;
			float _UVModLocalPos1;
			float _PPLightingMultiplier;
			float _PPLightingAddition;
			float _PPEmissionMultiplier;
			float _PPFinalColorMultiplier;
			CBUFFER_END
			#if defined(PROP_LIGHTINGAOMAPS)
			Texture2D _LightingAOMaps;
			#endif
			#if defined(PROP_LIGHTINGDETAILSHADOWMAPS)
			Texture2D _LightingDetailShadowMaps;
			#endif
			#if defined(PROP_LIGHTINGSHADOWMASKS)
			Texture2D _LightingShadowMasks;
			#endif
			#if defined(PROP_LIGHTDATASDFMAP)
			Texture2D _LightDataSDFMap;
			#endif
			float _IgnoreFog;
			float _RenderingReduceClipDistance;
			int _FlipBackfaceNormals;
			float _AddBlendOp;
			float _Cull;
			SamplerState point_clamp_sampler;
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			#define STEREO_UV(uv) float3(uv, unity_StereoEyeIndex)
			#else
			#define STEREO_UV(uv) uv
			#endif
			#if POI_PIPE == POI_BIRP
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			Texture2DArray<float> _CameraDepthTexture;
			#else
			Texture2D<float> _CameraDepthTexture;
			#endif
			#endif
			#if POI_PIPE == POI_URP
			TEXTURE2D_X_FLOAT(_CameraDepthTexture);
			float4 _CameraDepthTexture_TexelSize;
			#endif
			float SampleScreenDepth(float2 uv)
			{
				uv.y = _ProjectionParams.x * 0.5 + 0.5 - uv.y * _ProjectionParams.x;
				return _CameraDepthTexture.SampleLevel(point_clamp_sampler, STEREO_UV(uv), 0).r;
			}
			bool DepthTextureExists()
			{
				float3 dTexDim = 0;
				#if POI_PIPE == POI_BIRP
				#ifdef UNITY_STEREO_INSTANCING_ENABLED
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y, dTexDim.z);
				#else
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y);
				#endif
				#endif
				#if POI_PIPE == POI_URP
				dTexDim.xy = _CameraDepthTexture_TexelSize.zw;
				#endif
				return dTexDim.x > 16;
			}
			UNITY_DECLARE_TEX2D(_MainTex);
			#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BumpMap;
			#endif
			#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _AlphaMask;
			#endif
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleSpawnMask;
			#endif
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleTexture;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleNoiseTex;
			#endif
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleLifetimeGradient;
			#endif
			struct MatcapAudioLinkData
			{
				float matcapALEnabled;
				float matcapALAlphaAddBand;
				float4 matcapALAlphaAdd;
				float matcapALEmissionAddBand;
				float4 matcapALEmissionAdd;
				float matcapALIntensityAddBand;
				float4 matcapALIntensityAdd;
				float matcapALChronoPanType;
				float matcapALChronoPanBand;
				float matcapALChronoPanSpeed;
			};
			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				#ifdef POI_PASS_MOTION_VECTORS
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
				float3 alembicMotionVector : TEXCOORD5;
				#endif
				#endif
				uint vertexId : SV_VertexID;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct tessellatedAppData
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				uint vertexId : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct VertexOut
			{
				float4 pos : SV_POSITION;
				float4 uv[2] : TEXCOORD0;
				float3 normal : TEXCOORD2;
				float4 tangent : TEXCOORD3;
				float4 worldPos : TEXCOORD4;
				float4 localPos : TEXCOORD5;
				float4 vertexColor : TEXCOORD6;
				float4 lightmapUV : TEXCOORD7;
				float2 fogData: TEXCOORD8;
				POI_SHADOW_COORDS(9)
				#ifdef POI_PASS_MOTION_VECTORS
				float4 positionCSNoJitter         : POSITION_CS_NO_JITTER;
				float4 previousPositionCSNoJitter : PREV_POSITION_CS_NO_JITTER;
				#endif
				nointerpolation float3 particleData : TEXCOORD13;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			float2 vertexUV(in VertexOut o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			float2 vertexUV(in appdata v, int index)
			{
				switch(index)
				{
					case 0:
					return v.uv0.xy;
					case 1:
					return v.uv1.xy;
					case 2:
					return v.uv2.xy;
					case 3:
					return v.uv3.xy;
					default:
					return v.uv0.xy;
				}
			}
			#ifdef POI_PASS_LILFUR
			float2 vertexUV(in PoiGeoToFragLilFur o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			#endif
			#ifdef POI_AUDIOLINK
			inline int poiALBandPass(int bandIdx)
			{
				bandIdx = clamp(bandIdx, 0, 3);
				return bandIdx == 0 ? ALPASS_AUDIOBASS : bandIdx == 1 ? ALPASS_AUDIOLOWMIDS : bandIdx == 2 ? ALPASS_AUDIOHIGHMIDS : ALPASS_AUDIOTREBLE;
			}
			#endif
			void applyReducedRenderClipDistance(inout VertexOut o)
			{
				if (o.pos.w < _ProjectionParams.y * 1.01 && o.pos.w > 0)
				{
					#if defined(UNITY_REVERSED_Z) // DirectX
					o.pos.z = o.pos.z * 0.0001 + o.pos.w * 0.999;
					#else // OpenGL
					o.pos.z = o.pos.z * 0.0001 - o.pos.w * 0.999;
					#endif
				}
			}
			VertexOut vert(appdata v)
			{
				UNITY_SETUP_INSTANCE_ID(v);
				VertexOut o;
				PoiInitStruct(VertexOut, o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				#ifdef POI_TESSELLATED
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v);
				#endif
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				#ifdef POI_PASS_OUTLINE
				if (0.0 > 0.5)
				{
					return (VertexOut)POI_NAN;
				}
				#endif
				#ifdef POI_AUDIOLINK
				float vertexAudioLink[5];
				vertexAudioLink[0] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 0))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 0))[0];
				vertexAudioLink[1] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 1))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 1))[0];
				vertexAudioLink[2] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 2))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 2))[0];
				vertexAudioLink[3] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 3))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 3))[0];
				vertexAudioLink[4] = AudioLinkData(ALPASS_GENERALVU + float2(8, 0))[0];
				#endif
				#if POI_PIPE == POI_BIRP
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.tangent.xyz = UnityObjectToWorldDir(v.tangent);
				#elif  POI_PIPE == POI_URP
				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(v.normal, v.tangent);
				o.normal = vertexNormalInput.normalWS;
				o.tangent.xyz = vertexNormalInput.tangentWS;
				#endif
				o.tangent.w = v.tangent.w;
				o.vertexColor = v.color;
				o.uv[0] = float4(v.uv0.xy, v.uv1.xy);
				o.uv[1] = float4(v.uv2.xy, v.uv3.xy);
				#if defined(LIGHTMAP_ON)
				OUTPUT_LIGHTMAP_UV(v.uv1.xy, unity_LightmapST, o.lightmapUV.xy);
				#endif
				#ifdef DYNAMICLIGHTMAP_ON
				OUTPUT_LIGHTMAP_UV(v.uv2.xy, unity_LightmapST, o.lightmapUV.zw);
				#endif
				o.localPos = v.vertex;
				o.worldPos = mul(unity_ObjectToWorld, o.localPos);
				float3 localOffset = float3(0, 0, 0);
				float3 worldOffset = float3(0, 0, 0);
				o.localPos.rgb += localOffset;
				o.worldPos.rgb += worldOffset;
				o.pos = PoiObjectToClipPos(o.localPos.rgb);
				o.fogData.x = o.pos.z; // This is used for fog calculations, so we need to ensure it's in clip space
				#ifdef FOG_EXP2
				o.fogData.y = 1;
				#else
				o.fogData.y = 0;
				#endif
				#if !defined(POI_PASS_SHADOW)
				POI_TRANSFER_SHADOW(o, o.uv[0].xy);
				#else
				v.vertex.xyz = o.localPos.xyz;
				POI_TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
				#endif
				if (0.0)
				{
					applyReducedRenderClipDistance(o);
				}
				#ifdef POI_PASS_META
				o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
				#endif
				#ifdef POI_PASS_MOTION_VECTORS
				#if defined(APPLICATION_SPACE_WARP_MOTION)
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				o.pos = o.positionCSNoJitter;
				#else
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				#endif
				float4 prevPos = (unity_MotionVectorsParams.x == 1) ? float4(v.positionOld, 1) : o.localPos;
				#if _ADD_PRECOMPUTED_VELOCITY
				prevPos = prevPos - float4(v.alembicMotionVector, 0);
				#endif
				o.previousPositionCSNoJitter = mul(_PrevViewProjMatrix, mul(UNITY_PREV_MATRIX_M, prevPos));
				#endif
				#ifdef POI_PASS_LILFUR
				#endif
				return o;
			}
			#define MAX_PARTICLES_PER_TRIANGLE 3
			#define CM2_TO_M2 10000.0
			#define CM_TO_M 0.01
			#define PARTICLE_VERTICES 4
			struct ParticleData
			{
				float3 position;
				float size;
				float progress;
				float audioHeight;
				float audioPosition;
				float rotationSpeed;
				float audioRotationOffset;
				float2 particleSeed;
				float2 spawnUV;
				float3 spawnNormal;
				float3 noiseOffset;
				float3 moveDir;
				float motionVelocity;
			};
			float3 poiAnyPerpendicular(float3 v)
			{
				float3 a = (abs(v.x) < 0.5) ? float3(1, 0, 0) : float3(0, 1, 0);
				float3 p = cross(v, a);
				return (length(p) > 1e-6) ? normalize(p) : normalize(cross(v, float3(0, 0, 1)));
			}
			float3 poiRotateAroundAxis(float3 v, float3 axis, float angle)
			{
				float s, c; sincos(angle, s, c);
				return v * c + cross(axis, v) * s + axis * dot(axis, v) * (1 - c);
			}
			float3 poiSlerpUnitStable(float3 fromDir, float3 toDir, float t)
			{
				fromDir = normalize(fromDir);
				toDir = normalize(toDir);
				float d = clamp(dot(fromDir, toDir), -1.0, 1.0);
				if (d > 0.999)
				{
					return normalize(lerp(fromDir, toDir, t));
				}
				if (d < - 0.999)
				{
					float3 axis = poiAnyPerpendicular(fromDir);
					return normalize(poiRotateAroundAxis(fromDir, axis, UNITY_PI * t));
				}
				float omega = acos(d);
				float s = sin(omega);
				float w0 = sin((1.0 - t) * omega) / s;
				float w1 = sin(t * omega) / s;
				return normalize(fromDir * w0 + toDir * w1);
			}
			ParticleData GenerateParticle(int particleIndex, uint primID, float3 v0_world, float3 v1_world, float3 v2_world, float3 n0, float3 n1, float3 n2, float3 tangent, float3 bitangent, float2 uvA, float2 uvB, float2 uvC, bool audioLinkAvailable)
			{
				ParticleData particle;
				float2 seedBase = float2((primID + particleIndex) * 0.51, particleIndex * 1.123) + 0.069;
				float randomU = poiRand(seedBase);
				float randomV = poiRand(seedBase.yx);
				if (randomU + randomV > 1.0)
				{
					randomU = 1.0 - randomU; randomV = 1.0 - randomV;
				}
				float3 basePos = v0_world * (1.0 - randomU - randomV) + v1_world * randomU + v2_world * randomV;
				particle.spawnUV = uvA * (1.0 - randomU - randomV) + uvB * randomU + uvC * randomV;
				particle.spawnNormal = normalize(n0 * (1.0 - randomU - randomV) + n1 * randomU + n2 * randomV);
				float3 normal = normalize(n0 + n1 + n2);
				float4 rand1 = float4(poiRand3(seedBase), poiRand(seedBase + 11.0));
				float4 rand2 = float4(poiRand3(seedBase + 1.0), poiRand(seedBase + 12.0));
				float4 rand3 = float4(poiRand3(seedBase + 2.0), poiRand(seedBase + 13.0));
				float progress = frac((_Time.y / 2.0) + rand1.x);
				float3 worldDir = float4(0,1,0,0).xyz;
				float invLen = rsqrt(max(dot(worldDir, worldDir), 1e-8));
				worldDir *= invLen;
				float specificTravelDistance = lerp(float4(50,100,0,1000).x, float4(50,100,0,1000).y, rand1.w) * CM_TO_M;
				float dBW = clamp(dot(normal, worldDir), -1.0, 1.0);
				float angN = acos(dBW) / 3.14159265;
				float effStrength = saturate(0.0 / max(angN, 1e-4));
				float3 moveDir = poiSlerpUnitStable(normal, worldDir, effStrength);
				float motionVelocity = 0;
				if (0.0 >= 1) // Outward or Ping Pong
				{
					float effectiveProgress = progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(progress * UNITY_PI);
						motionVelocity = cos(progress * UNITY_PI);
					}
					else // Outward
					{
						motionVelocity = 1.0; // Always moving forward
					}
					float3 integratedPos = basePos;
					[unroll]
					for (int step = 0; step < 8; ++step)
					{
						float t = effectiveProgress * ((step + 0.5) / 8.0);
						float ramp = evalRamp4(saturate(t), float4(0,1,0,1));
						float blend = saturate(effStrength * ramp);
						float3 stepDir = poiSlerpUnitStable(normal, worldDir, blend);
						integratedPos += stepDir * (specificTravelDistance * (effectiveProgress / 8.0));
					}
					basePos = integratedPos;
				}
				float3 floatPos = basePos + moveDir * (lerp(float4(1,1.5,0,500).x, float4(1,1.5,0,500).y, rand2.z) * CM_TO_M);
				float3 noiseOffset = 0;
				#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
				float noiseStrength = lerp(float4(0,0,0,50).x, float4(0,0,0,50).y, rand3.x) * CM_TO_M;
				float noiseScrollSpeed = lerp(float4(1,1,0,0).x, float4(1,1,0,0).y, rand3.w);
				float2 lookupUV = (rand2.xy * float4(1,1,0,0).xy) + float4(1,1,0,0).zw;
				float2 dynamicPan = float4(0,0,0,0) + (_Time.x * noiseScrollSpeed);
				float3 noiseVal = _ParticleNoiseTex.SampleLevel(sampler_linear_repeat, lookupUV + dynamicPan, 0).rgb * 2.0 - 1.0;
				noiseOffset = (tangent * noiseVal.r + bitangent * noiseVal.g) * noiseStrength;
				#endif
				float audioLinkHeight = 0, frequencyPosition = 0, bandAssignment = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable)
				{
					if (2.0 == 0)
					{
						float waveformX = frac(randomU + randomV) * 128.0;
						frequencyPosition = waveformX / 128.0;
						float4 waveformData = AudioLinkLerpMultiline(float2(waveformX, 6));
						float audioLinkSample = waveformData.r;
						float4 waveformDataNext = AudioLinkLerpMultiline(float2(waveformX + 1, 6));
						audioLinkSample = lerp(audioLinkSample, waveformDataNext.r, 0.2);
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 1)
					{
						float dftX = frac(randomU + randomV) * 128.0;
						frequencyPosition = dftX / 128.0;
						float4 dftData = AudioLinkLerpMultiline(float2(dftX, 4));
						float audioLinkSample = dftData.r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 2)
					{
						int band = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 3)
					{
						int filteredBand = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = filteredBand / 3.0;
						float filteredX = frac(randomU + randomV) * 16.0;
						frequencyPosition = filteredX / 16.0;
						float audioLinkSample = AudioLinkLerp(float2(filteredX, 28 + filteredBand)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 4)
					{
						float autocorrX = frac(randomU + randomV) * 128.0;
						frequencyPosition = autocorrX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(autocorrX, 27)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 >= 5 && 2.0 <= 8)
					{
						int band = 2.0 - 5;
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					if (0.0 == 1)
					{
						float audioLinkNoise;
						if (1.0 == 5)
						{
							audioLinkNoise = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						}
						else
						{
							int noiseBand = clamp(1.0, 0, 4);
							audioLinkNoise = AudioLinkLerp(float2(0, noiseBand)).r;
						}
						float noiseMultiplier = evalRamp4(audioLinkNoise, float4(1,1,0,1));
						noiseOffset *= noiseMultiplier;
					}
				}
				#endif
				particle.position = floatPos + noiseOffset +moveDir * audioLinkHeight;
				particle.noiseOffset = noiseOffset;
				particle.moveDir = moveDir;
				particle.motionVelocity = motionVelocity;
				particle.rotationSpeed = lerp(float4(-3,3,-20,20).x, float4(-3,3,-20,20).y, rand1.z);
				particle.audioRotationOffset = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 0.0)
				{
					if (0.0 == 5)
					{
						float normalizedAudioHeight = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						particle.audioRotationOffset = normalizedAudioHeight * 2.0 * 360;
					}
					else
					{
						int rotationBand = clamp(0.0, 0, 4);
						particle.audioRotationOffset = AudioLinkGetChronoTime(0.0, rotationBand) * 2.0 * 360;
					}
				}
				#endif
				particle.size = lerp(float4(1.5,2,0.01,100).x, float4(1.5,2,0.01,100).y, rand3.y) * CM_TO_M;
				particle.size *= evalRamp4(saturate(progress), float4(1,1,0,1));
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 1.0)
				{
					float audioLinkSize;
					if (0.0 == 5)
					{
						audioLinkSize = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
					}
					else
					{
						int sizeBand = clamp(0.0, 0, 4);
						audioLinkSize = AudioLinkLerp(float2(0, sizeBand)).r;
					}
					float sizeAdd = evalRamp4(audioLinkSize, float4(0,0,0,1)) * CM_TO_M;
					particle.size = max(0.0001, particle.size + sizeAdd);
				}
				#endif
				particle.progress = progress;
				particle.audioHeight = audioLinkHeight;
				if (2.0 <= 1)
				{
					particle.audioPosition = frequencyPosition;
				}
				else
				{
					particle.audioPosition = bandAssignment;
				}
				particle.particleSeed = seedBase;
				return particle;
			}
			inline void AppendParticleVertex(VertexOut output, float3 worldPosition, float2 quadUV, float2 triCenterUV, int outSet, float3 normalVector, float3 tangentVector, float handedness, float3 camPos, inout TriangleStream<VertexOut> triStream)
			{
				output.worldPos = float4(worldPosition, 1);
				output.localPos = mul(unity_WorldToObject, float4(worldPosition, 1));
				output.pos = PoiWorldToClipPos(worldPosition);
				output.fogData.x = output.pos.z;
				#ifdef FOG_EXP2
				output.fogData.y = 1;
				#else
				output.fogData.y = 0;
				#endif
				POI_TRANSFER_SHADOW(output, output.uv[0].xy);
				output.normal = normalVector;
				output.tangent.xyz = tangentVector;
				output.tangent.w = handedness;
				output.uv[0] = float4(quadUV, quadUV);
				output.uv[1] = float4(quadUV, quadUV);
				if (outSet == 0)
				{
					output.uv[0].xy = triCenterUV;
				}
				else if (outSet == 1)
				{
					output.uv[0].zw = triCenterUV;
				}
				else if (outSet == 2)
				{
					output.uv[1].xy = triCenterUV;
				}
				else if (outSet == 3)
				{
					output.uv[1].zw = triCenterUV;
				}
				triStream.Append(output);
			}
			void RenderParticle(ParticleData particle, VertexOut input[3], inout TriangleStream<VertexOut> triStream)
			{
				float3 camPos = getCameraPosition();
				float3 toCamera = normalize(camPos - particle.position + float3(1e-6, 0, 0));
				float theta = atan2(toCamera.z, toCamera.x);
				float phi = asin(toCamera.y);
				float cosTheta, sinTheta, cosPhi, sinPhi;
				sincos(theta, sinTheta, cosTheta);
				sincos(phi, sinPhi, cosPhi);
				float3 camRight = float3(-sinTheta, 0, cosTheta);
				float3 camUp = float3(-sinPhi * cosTheta, cosPhi, -sinPhi * sinTheta);
				float3 billboardNormal = normalize(camPos - particle.position);
				float3 normalVector = normalize(lerp(billboardNormal, particle.spawnNormal, 0.0));
				float3 tangentVector = normalize(camRight - dot(camRight, normalVector) * normalVector);
				float3 bitangentVector = normalize(cross(normalVector, tangentVector));
				float3 camFacing = normalVector;
				float faceBlend = 0.0;
				float alignAngle = 0;
				if (faceBlend > 0.0001)
				{
					float3 baseMotionDir = particle.moveDir;
					float effectiveProgress = particle.progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(particle.progress * UNITY_PI);
					}
					float rampAtP = evalRamp4(saturate(effectiveProgress), float4(0,1,0,1));
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					baseMotionDir = poiSlerpUnitStable(triNormal, baseMotionDir, saturate(rampAtP));
					float2 dir2 = normalize(float2(dot(baseMotionDir, camRight), dot(baseMotionDir, camUp)) + 1e-6);
					alignAngle = atan2(dir2.y, dir2.x);
					if (0.0 == 2) // Ping Pong
					{
						if (particle.motionVelocity < - 0.001)
						{
							alignAngle += UNITY_PI;
						}
					}
					else if (particle.motionVelocity < - 0.001) // Other modes
					{
						alignAngle += UNITY_PI;
					}
				}
				float baseAngle = _Time.y * particle.rotationSpeed + radians(particle.audioRotationOffset);
				float finalAngle = baseAngle + alignAngle * faceBlend;
				float sinAngle, cosAngle;
				sincos(finalAngle, sinAngle, cosAngle);
				float2x2 rotMatrix = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
				float handedness = 1;
				if (dot(cross(tangentVector, bitangentVector), normalVector) < 0)
				{
					handedness = -1;
				}
				float halfSize = particle.size * 0.5f;
				VertexOut outputVertex = input[0];
				#ifdef POI_AUDIOLINK
				float normalizedAudioHeight = saturate(particle.audioHeight / max(1.0 * CM_TO_M, 0.001));
				#else
				float normalizedAudioHeight = 0;
				#endif
				float packedAudio = floor(normalizedAudioHeight * 65535.0) * 65536.0 + floor(particle.audioPosition * 65535.0);
				outputVertex.particleData = float3(-particle.progress - 1.0, packedAudio, poiRand(particle.particleSeed));
				float2 corner0 = mul(rotMatrix, float2(-1, -1) * halfSize);
				float2 corner1 = mul(rotMatrix, float2(1, -1) * halfSize);
				float2 corner2 = mul(rotMatrix, float2(-1, 1) * halfSize);
				float2 corner3 = mul(rotMatrix, float2(1, 1) * halfSize);
				float2 particleSpawnUV = particle.spawnUV;
				float3 worldPos;
				worldPos = particle.position + camRight * corner0.x + camUp * corner0.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner3.x + camUp * corner3.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
			}
			[maxvertexcount(21)]
			void geom(triangle VertexOut input[3], inout TriangleStream<VertexOut> triStream, uint primID : SV_PrimitiveID)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[0]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[1]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[2]);
				if (1.0)
				{
					[unroll]
					for (int vertexIndex = 0; vertexIndex < 3; vertexIndex++)
					{
						VertexOut vertex = input[vertexIndex];
						vertex.particleData = float3(0, 0, 0);
						triStream.Append(vertex);
					}
					triStream.RestartStrip();
				}
				if (0.15 <= 0)
				{
					return;
				}
				float3 v0_world = input[0].worldPos.xyz;
				float3 v1_world = input[1].worldPos.xyz;
				float3 v2_world = input[2].worldPos.xyz;
				float triangleArea = length(cross(v1_world - v0_world, v2_world - v0_world)) * 0.5;
				if (0.0 >= 1 && 0.0 > 0.0)
				{
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					float3 safeWorldDir = float4(0,1,0,0).xyz;
					float lenW = length(safeWorldDir);
					safeWorldDir = (lenW > 1e-4) ? (safeWorldDir / lenW) : float3(0, 1, 0);
					if (dot(triNormal, safeWorldDir) * .5 + .5 < 0.0)
					{
						return;
					}
				}
				float distanceToCamera = length(getCameraPosition() - (v0_world + v1_world + v2_world) / 3.0);
				float desiredCount = (triangleArea * CM2_TO_M2) * 0.15;
				if (0.0 > 0)
				{
					desiredCount *= ((input[0].vertexColor + input[1].vertexColor + input[2].vertexColor) / 3.0)[0.0 - 1];
				}
				#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
				float4 avgUV = (input[0].uv[0.0 / 2] + input[1].uv[0.0 / 2] + input[2].uv[0.0 / 2]) / 3.0;
				float2 maskUV;
				if (0.0 % 2 == 0)
				{
					maskUV = avgUV.xy;
				}
				else
				{
					maskUV = avgUV.zw;
				}
				maskUV = maskUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw + _Time.y * float4(0,0,0,0);
				float maskValue = _ParticleSpawnMask.SampleLevel(sampler_linear_repeat, maskUV, 0)[0.0];
				if (0.0)
				{
					desiredCount *= 1.0 - maskValue;
				}
				else
				{
					desiredCount *= maskValue;
				}
				#endif
				if (1.0)
				{
					float distanceInterpolation = saturate((distanceToCamera - float4(3,8,0,0).x) / (float4(3,8,0,0).y - float4(3,8,0,0).x));
					desiredCount *= lerp(float4(1,0,0,0).x, float4(1,0,0,0).y, distanceInterpolation);
				}
				int finalSpawnCount = min(floor(desiredCount + poiRand(float2(primID, primID) + 0.069)), MAX_PARTICLES_PER_TRIANGLE);
				if (finalSpawnCount == 0)
				{
					return;
				}
				float3 normal = normalize(input[0].normal + input[1].normal + input[2].normal);
				float4 avgTangent = (input[0].tangent + input[1].tangent + input[2].tangent) / 3.0;
				float3 tangent;
				if (length(avgTangent.xyz) > 0.0001)
				{
					tangent = normalize(avgTangent.xyz);
				}
				else
				{
					tangent = float3(1, 0, 0);
				}
				float3 bitangent = cross(normal, tangent) * avgTangent.w;
				#ifdef POI_AUDIOLINK
				bool audioLinkAvailable = AudioLinkIsAvailable();
				#else
				bool audioLinkAvailable = false;
				#endif
				[unroll(3)]
				for (int i = 0; i < finalSpawnCount && i < 3; ++i)
				{
					int spawnUvSet = (int)clamp(0.0, 0, 3);
					float4 uvA4 = input[0].uv[spawnUvSet / 2];
					float4 uvB4 = input[1].uv[spawnUvSet / 2];
					float4 uvC4 = input[2].uv[spawnUvSet / 2];
					float2 uvA = (spawnUvSet % 2 == 0) ? uvA4.xy : uvA4.zw;
					float2 uvB = (spawnUvSet % 2 == 0) ? uvB4.xy : uvB4.zw;
					float2 uvC = (spawnUvSet % 2 == 0) ? uvC4.xy : uvC4.zw;
					ParticleData p = GenerateParticle(i, primID, v0_world, v1_world, v2_world, input[0].normal, input[1].normal, input[2].normal, tangent, bitangent, uvA, uvB, uvC, audioLinkAvailable);
					RenderParticle(p, input, triStream);
				}
			}
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			#define POI2D_SAMPLER_STOCHASTIC(tex, texSampler, uv, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, uv) : POI2D_SAMPLER(tex, texSampler, uv))
			#define POI2D_SAMPLER_PAN_STOCHASTIC(tex, texSampler, uv, pan, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan)) : POI2D_SAMPLER_PAN(tex, texSampler, uv, pan))
			#define POI2D_SAMPLER_PANGRAD_STOCHASTIC(tex, texSampler, uv, pan, dx, dy, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan), dx, dy) : POI2D_SAMPLER_PANGRAD(tex, texSampler, uv, pan, dx, dy))
			#endif
			#if !defined(_STOCHASTICMODE_NONE)
			float2 StochasticHash2D2D(float2 s)
			{
				return frac(sin(glsl_mod(float2(dot(s, float2(127.1, 311.7)), dot(s, float2(269.5, 183.3))), 3.14159)) * 43758.5453);
			}
			#endif
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			float3x3 DeliotHeitzStochasticUVBW(float2 uv)
			{
				const float2x2 stochasticSkewedGrid = float2x2(1.0, -0.57735027, 0.0, 1.15470054);
				float2 skewUV = mul(stochasticSkewedGrid, uv * 3.4641 * 1.0);
				float2 vxID = floor(skewUV);
				float3 bary = float3(frac(skewUV), 0);
				bary.z = 1.0 - bary.x - bary.y;
				float3x3 pos = float3x3(
				float3(vxID, bary.z),
				float3(vxID + float2(0, 1), bary.y),
				float3(vxID + float2(1, 0), bary.x)
				);
				float3x3 neg = float3x3(
				float3(vxID + float2(1, 1), -bary.z),
				float3(vxID + float2(1, 0), 1.0 - bary.y),
				float3(vxID + float2(0, 1), 1.0 - bary.x)
				);
				return (bary.z > 0) ? pos : neg;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv, float2 dx, float2 dy)
			{
				float3x3 UVBW = DeliotHeitzStochasticUVBW(uv);
				return mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[0].xy), dx, dy), UVBW[0].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[1].xy), dx, dy), UVBW[1].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[2].xy), dx, dy), UVBW[2].z) ;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv)
			{
				float2 dx = ddx(uv), dy = ddy(uv);
				return DeliotHeitzSampleTexture(tex, texSampler, uv, dx, dy);
			}
			#endif // defined(_STOCHASTICMODE_DELIOT_HEITZ)
			float4 PoiLightDataSetupAdd(
			inout PoiLight poiLight,
			inout PoiFragData poiFragData,
			in PoiMesh poiMesh,
			in PoiCam poiCam,
			in PoiMods poiMods,
			#ifdef POI_PASS_LILFUR
			in PoiGeoToFragLilFur i,
			#else
			in VertexOut i,
			#endif
			in float4 mainTexture)
			{
				poiLight.finalLightAdd = 0;
				if (!1.0)
				{
					return float4(mainTexture.rgb * .0001, 1);
				}
				#if defined(DIRECTIONAL)
				if (1.0)
				{
					return float4(mainTexture.rgb * .0001, 1);
				}
				#endif
				#if POI_PIPE == POI_BIRP
				poiLight.direction = normalize(_WorldSpaceLightPos0.xyz - poiMesh.worldPos.xyz * _WorldSpaceLightPos0.w);
				#elif POI_PIPE == POI_URP
				poiLight.direction = poiLight.unityLight.direction.xyz;
				#endif
				#if defined(POINT) || defined(SPOT)
				#ifdef POINT
				unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1)).xyz;
				poiLight.attenuation = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
				#endif
				#ifdef SPOT
				unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1));
				poiLight.attenuation = (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
				#endif
				#else
				#if POI_PIPE == POI_BIRP
				#ifndef POI_PASS_LILFUR
				UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
				poiLight.attenuation = attenuation;
				#else
				poiLight.attenuation = 1;
				#endif
				#elif POI_PIPE == POI_URP
				poiLight.attenuation = poiLight.unityLight.distanceAttenuation * poiLight.unityLight.shadowAttenuation;
				#endif
				#endif
				#if POI_PIPE == POI_BIRP && !defined(POI_PASS_LILFUR)
				poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(i, poiMesh.worldPos);
				#elif POI_PIPE == POI_URP
				poiLight.additiveShadow = poiLight.unityLight.shadowAttenuation;
				#endif
				poiLight.attenuationStrength = 1.0;
				poiLight.directColor = 1.0 ? MaxLuminance(poiLight.unityLight.color * poiLight.attenuation, 1.0) : poiLight.unityLight.color * poiLight.attenuation;
				#if defined(POINT_COOKIE) || defined(DIRECTIONAL_COOKIE)
				poiLight.indirectColor = 0;
				#else
				poiLight.indirectColor = lerp(0, poiLight.directColor, 0.5);
				poiLight.indirectColor = 1.0 ? MaxLuminance(poiLight.indirectColor, 1.0) : poiLight.indirectColor;
				#endif
				poiLight.directColor = lerp(poiLight.directColor, dot(poiLight.directColor, float3(0.299, 0.587, 0.114)), 0.0);
				poiLight.indirectColor = lerp(poiLight.indirectColor, dot(poiLight.indirectColor, float3(0.299, 0.587, 0.114)), 0.0);
				poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
				poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
				poiLight.nDotLSaturated = saturate(poiLight.nDotL);
				poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
				poiLight.nDotV = abs(dot(poiMesh.normals[1], poiCam.viewDir));
				poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
				poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
				poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);
				poiLight.vertexNDotL = dot(poiMesh.normals[0], poiLight.direction);
				poiLight.vertexNDotV = abs(dot(poiMesh.normals[0], poiCam.viewDir));
				poiLight.vertexNDotH = max(0.00001, dot(poiMesh.normals[0], poiLight.halfDir));
				if (0.0 == 0 || 0.0 == 1 || 0.0 == 2)
				{
					poiLight.lightMap = poiLight.nDotLNormalized;
				}
				if (0.0 == 3)
				{
					poiLight.lightMap = 1;
				}
				poiLight.lightMap *= poiLight.detailShadow;
				poiLight.lightMapNoAttenuation = poiLight.lightMap;
				poiLight.lightMap *= lerp(1, poiLight.additiveShadow, poiLight.attenuationStrength);
				float4 debugColor = 0;
				return debugColor;
			}
			float4 PoiLightDataSetup(
			inout PoiLight poiLight,
			inout PoiFragData poiFragData,
			in PoiMesh poiMesh,
			in PoiCam poiCam,
			in PoiMods poiMods,
			#ifdef POI_PASS_LILFUR
			in PoiGeoToFragLilFur i,
			#else
			in VertexOut i,
			#endif
			in float4 mainTexture)
			{
				bool lightExists = false;
				if (any(poiLight.unityLight.color.rgb >= 0.002))
				{
					lightExists = true;
				}
				if (1.0)
				{
					poiFragData.toggleVertexLights = 1;
				}
				if (IsInMirror() && 1.0 == 0)
				{
					poiFragData.toggleVertexLights = 0;
				}
				#if POI_PIPE == POI_BIRP
				if (1.0)
				{
					#if defined(VERTEXLIGHT_ON)
					float4 toLightX = unity_4LightPosX0 - poiMesh.worldPos.x;
					float4 toLightY = unity_4LightPosY0 - poiMesh.worldPos.y;
					float4 toLightZ = unity_4LightPosZ0 - poiMesh.worldPos.z;
					float4 lengthSq = 0;
					lengthSq += toLightX * toLightX;
					lengthSq += toLightY * toLightY;
					lengthSq += toLightZ * toLightZ;
					float4 lightAttenSq = unity_4LightAtten0;
					float4 atten = 1.0 / (1.0 + lengthSq * lightAttenSq);
					float4 vLightWeight = saturate(1 - (lengthSq * lightAttenSq / 25));
					poiLight.vAttenuation = min(atten, vLightWeight * vLightWeight);
					poiLight.vDotNL = 0;
					poiLight.vDotNL += toLightX * poiMesh.normals[1].x;
					poiLight.vDotNL += toLightY * poiMesh.normals[1].y;
					poiLight.vDotNL += toLightZ * poiMesh.normals[1].z;
					float4 corr = rsqrt(lengthSq);
					poiLight.vertexVDotNL = max(0, poiLight.vDotNL * corr);
					poiLight.vertexVDotNL = 0;
					poiLight.vertexVDotNL += toLightX * poiMesh.normals[0].x;
					poiLight.vertexVDotNL += toLightY * poiMesh.normals[0].y;
					poiLight.vertexVDotNL += toLightZ * poiMesh.normals[0].z;
					poiLight.vertexVDotNL = max(0, poiLight.vDotNL * corr);
					poiLight.vSaturatedDotNL = saturate(poiLight.vDotNL);
					[unroll]
					for (int index = 0; index < 4; index++)
					{
						poiLight.vPosition[index] = float3(unity_4LightPosX0[index], unity_4LightPosY0[index], unity_4LightPosZ0[index]);
						float3 vertexToLightSource = poiLight.vPosition[index] - poiMesh.worldPos;
						poiLight.vDirection[index] = normalize(vertexToLightSource);
						poiLight.vColor[index] = 1.0 ? MaxLuminance(unity_LightColor[index].rgb * poiLight.vAttenuation[index], 1.0) : unity_LightColor[index].rgb * poiLight.vAttenuation[index];
						poiLight.vColor[index] = lerp(poiLight.vColor[index], dot(poiLight.vColor[index], float3(0.299, 0.587, 0.114)), 0.0);
						poiLight.vHalfDir[index] = Unity_SafeNormalize(poiLight.vDirection[index] + poiCam.viewDir);
						poiLight.vDotNL[index] = dot(poiMesh.normals[1], poiLight.vDirection[index]);
						poiLight.vCorrectedDotNL[index] = .5 * (poiLight.vDotNL[index] + 1);
						poiLight.vDotLH[index] = saturate(dot(poiLight.vDirection[index], poiLight.vHalfDir[index]));
						poiLight.vDotNH[index] = dot(poiMesh.normals[1], poiLight.vHalfDir[index]);
						poiLight.vertexVDotNH[index] = saturate(dot(poiMesh.normals[0], poiLight.vHalfDir[index]));
					}
					#endif
				}
				#endif
				if (0.0 == 0) // Poi Custom Light Color
				{
					float3 magic = max(BetterSH9(normalize(PoiSHAr + PoiSHAg + PoiSHAb)), 0);
					float3 normalLight = poiLight.unityLight.color.rgb + BetterSH9(float4(0, 0, 0, 1));
					float magiLumi = CalculateLuminance(magic);
					float normaLumi = CalculateLuminance(normalLight);
					float maginormalumi = magiLumi + normaLumi;
					float magiratio = magiLumi / maginormalumi;
					float normaRatio = normaLumi / maginormalumi;
					float target = CalculateLuminance(magic * magiratio + normalLight * normaRatio);
					float3 properLightColor = magic + normalLight;
					float properLuminance = CalculateLuminance(magic + normalLight);
					poiLight.directColor = properLightColor * max(0.0001, (target / properLuminance));
					poiLight.indirectColor = BetterSH9(float4(lerp(0, poiMesh.normals[1], 0.0), 1));
				}
				if (0.0 == 1) // More standard approach to light color
				{
					float3 indirectColor = BetterSH9(float4(poiMesh.normals[1], 1));
					if (lightExists)
					{
						poiLight.directColor = poiLight.unityLight.color.rgb;
						poiLight.indirectColor = indirectColor;
					}
					else
					{
						poiLight.directColor = indirectColor * 0.6;
						poiLight.indirectColor = indirectColor * 0.5;
					}
				}
				if (0.0 == 2) // UTS style
				{
					poiLight.indirectColor = saturate(max(half3(0.05, 0.05, 0.05) * 1.0, max(PoiShadeSH9(half4(0.0, 0.0, 0.0, 1.0)), PoiShadeSH9(half4(0.0, -1.0, 0.0, 1.0)).rgb) * 1.0));
					poiLight.directColor = max(poiLight.indirectColor, poiLight.unityLight.color.rgb);
				}
				if (0.0 == 3) // OpenLit
				{
					float3 lightDirectionForSH9 = OpenLitLightingDirectionForSH9(poiLight.unityLight);
					OpenLitShadeSH9ToonDouble(lightDirectionForSH9, poiLight.directColor, poiLight.indirectColor);
					poiLight.directColor += poiLight.unityLight.color.rgb;
				}
				float lightMapMode = 0.0;
				if (0.0 == 0)
				{
					poiLight.direction = CalculateLuminance(poiLight.unityLight.color.rgb) * poiLight.unityLight.direction.xyz + (PoiSHAr.xyz + PoiSHAg.xyz + PoiSHAb.xyz) / 3.0;
				}
				if (0.0 == 1 || 0.0 == 2)
				{
					if (0.0 == 1)
					{
						poiLight.direction = mul((float3x3)unity_ObjectToWorld, float4(0,0,0,1)).xyz;
					}
					if (0.0 == 2)
					{
						poiLight.direction = float4(0,0,0,1);
					}
					if (lightMapMode == 0)
					{
						lightMapMode = 1;
					}
				}
				if (0.0 == 3) // UTS
				{
					float3 defaultLightDirection = normalize(UNITY_MATRIX_V[2].xyz + UNITY_MATRIX_V[1].xyz);
					float3 lightDirection = normalize(lerp(defaultLightDirection, poiLight.unityLight.direction.xyz, any(poiLight.unityLight.direction.xyz)));
					poiLight.direction = lightDirection;
				}
				if (0.0 == 4) // OpenLit
				{
					poiLight.direction = OpenLitLightingDirection(poiLight.unityLight); // float4 customDir = 0; // Do we want to give users to alter this (OpenLit always does!)?
				}
				if (0.0 == 5) // View Direction
				{
					float3 upViewDir = normalize(UNITY_MATRIX_V[1].xyz);
					float3 rightViewDir = normalize(UNITY_MATRIX_V[0].xyz);
					float yawOffset_Rads = radians(!IsInMirror() ? - 0.0 : 0.0);
					float3 rotatedViewYaw = normalize(RotateAroundAxis(rightViewDir, upViewDir, yawOffset_Rads));
					float3 rotatedViewCameraMeshOffset = RotateAroundAxis((getCameraPosition() - (poiMesh.worldPos)), upViewDir, yawOffset_Rads);
					float pitchOffset_Rads = radians(!IsInMirror() ? 0.0 : - 0.0);
					float3 rotatedViewPitch = RotateAroundAxis(rotatedViewCameraMeshOffset, rotatedViewYaw, pitchOffset_Rads);
					poiLight.direction = normalize(rotatedViewPitch);
				}
				if (!any(poiLight.direction))
				{
					poiLight.direction = float3(.4, 1, .4);
				}
				poiLight.direction = normalize(poiLight.direction);
				poiLight.attenuationStrength = 0.0;
				poiLight.attenuation = 1;
				if (!all(poiLight.unityLight.color.rgb == 0.0))
				{
					#if POI_PIPE == POI_BIRP
					#ifndef POI_PASS_LILFUR
					UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
					poiLight.attenuation *= attenuation;
					#endif
					#elif POI_PIPE == POI_URP
					poiLight.attenuation *= poiLight.unityLight.distanceAttenuation * poiLight.unityLight.shadowAttenuation;
					#endif
				}
				#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
				half bakedAtten = UnitySampleBakedOcclusion(poiMesh.lightmapUV.xy, poiMesh.worldPos);
				float zDist = dot(_WorldSpaceCameraPos - poiMesh.worldPos, UNITY_MATRIX_V[2].xyz);
				float fadeDist = UnityComputeShadowFadeDistance(poiMesh.worldPos, zDist);
				poiLight.attenuation = UnityMixRealtimeAndBakedShadows(poiLight.attenuation, bakedAtten, UnityComputeShadowFade(fadeDist));
				#endif
				#ifdef RALIV_PENETRATION
				if (0.0 || 0.0)
				{
					if (1.0)
					{
						poiLight.attenuation = 1;
					}
				}
				#endif
				if (!any(poiLight.directColor) && !any(poiLight.indirectColor) && lightMapMode == 0)
				{
					lightMapMode = 1;
					if (0.0 == 0)
					{
						poiLight.direction = normalize(float3(.4, 1, .4));
					}
				}
				poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
				poiLight.vertexNDotL = dot(poiMesh.normals[0], poiLight.direction);
				poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
				poiLight.nDotLSaturated = saturate(poiLight.nDotL);
				poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
				poiLight.nDotV = abs(dot(poiMesh.normals[1], poiCam.viewDir));
				poiLight.nDotVCentered = abs(dot(poiMesh.normals[1], normalize(getCameraPosition() - poiMesh.worldPos.xyz)));
				poiLight.vertexNDotV = abs(dot(poiMesh.normals[0], poiCam.viewDir));
				poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
				poiLight.vertexNDotH = max(0.00001, dot(poiMesh.normals[0], poiLight.halfDir));
				poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
				poiLight.lDotH = max(0.00001, dot(poiLight.direction, poiLight.halfDir));
				if (lightMapMode == 0)
				{
					float3 ShadeSH9Plus = GetSHLength();
					float3 ShadeSH9Minus = float3(PoiSHAr.w, PoiSHAg.w, PoiSHAb.w) + float3(PoiSHBr.z, PoiSHBg.z, PoiSHBb.z) / 3.0;
					float3 greyScaleVector = float3(.33333, .33333, .33333);
					float bw_lightColor = dot(poiLight.directColor, greyScaleVector);
					float bw_directLighting = (((poiLight.nDotL * 0.5 + 0.5) * bw_lightColor * lerp(1, poiLight.attenuation, poiLight.attenuationStrength)) + dot(PoiShadeSH9(float4(poiMesh.normals[1], 1)), greyScaleVector));
					float bw_directLightingNoAtten = (((poiLight.nDotL * 0.5 + 0.5) * bw_lightColor) + dot(PoiShadeSH9(float4(poiMesh.normals[1], 1)), greyScaleVector));
					float bw_bottomIndirectLighting = dot(ShadeSH9Minus, greyScaleVector);
					float bw_topIndirectLighting = dot(ShadeSH9Plus, greyScaleVector);
					float lightDifference = ((bw_topIndirectLighting + bw_lightColor) - bw_bottomIndirectLighting);
					poiLight.lightMap = smoothstep(0, lightDifference, bw_directLighting - bw_bottomIndirectLighting);
					poiLight.lightMapNoAttenuation = smoothstep(0, lightDifference, bw_directLightingNoAtten - bw_bottomIndirectLighting);
				}
				if (lightMapMode == 1)
				{
					poiLight.lightMapNoAttenuation = poiLight.nDotLNormalized;
					poiLight.lightMap = poiLight.nDotLNormalized * lerp(1, poiLight.attenuation, poiLight.attenuationStrength);
				}
				if (lightMapMode == 2)
				{
					poiLight.lightMapNoAttenuation = poiLight.nDotLSaturated;
					poiLight.lightMap = poiLight.nDotLSaturated * lerp(1, poiLight.attenuation, poiLight.attenuationStrength);
				}
				if (lightMapMode == 3)
				{
					poiLight.lightMapNoAttenuation = 1;
					poiLight.lightMap = lerp(1, poiLight.attenuation, poiLight.attenuationStrength);
				}
				if (lightMapMode == 4)
				{
					#if defined(PROP_LIGHTDATASDFMAP)
					float2 lightDataSDFMap = 1;
					if (0.0 > 0)
					{
						float sdfLod = pow(0.0, 4.0);
						lightDataSDFMap = POI2D_SAMPLER_PANGRAD(_LightDataSDFMap, _linear_repeat, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0), max(poiMesh.dx, sdfLod), max(poiMesh.dy, sdfLod)).rg;
					}
					else
					{
						lightDataSDFMap = POI2D_SAMPLER_PAN(_LightDataSDFMap, _linear_repeat, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0)).rg;
					}
					poiLight.lightMapNoAttenuation = poiLight.nDotLSaturated;
					float3 faceR = mul((float3x3)unity_ObjectToWorld, float3(-1.0, 0.0, 0.0));
					float LdotR = dot(poiLight.direction.xz, faceR.xz);
					float sdf = LdotR < 0 ? lightDataSDFMap.g : lightDataSDFMap.r;
					float3 faceF = mul((float3x3)unity_ObjectToWorld, float3(0.0, 0.0, 1.0)).xyz;
					faceF.y *= 1.0;
					faceF = dot(faceF, faceF) == 0 ? 0 : normalize(faceF);
					float3 faceL = poiLight.direction;
					faceL.y *= 1.0;
					faceL = dot(faceL, faceL) == 0 ? 0 : normalize(faceL);
					float lnSDF = dot(faceL, faceF);
					poiLight.lightMapNoAttenuation = saturate(lnSDF * 0.5 + sdf * 0.5 + 0.25);
					poiLight.lightMap = saturate(lnSDF * 0.5 + sdf * 0.5 + 0.25) * lerp(1, poiLight.attenuation, poiLight.attenuationStrength);
					#else
					poiLight.lightMapNoAttenuation = poiLight.nDotLNormalized;
					poiLight.lightMap = poiLight.nDotLNormalized * lerp(1, poiLight.attenuation, poiLight.attenuationStrength);
					#endif
				}
				poiLight.lightMapNoAttenuation *= poiLight.detailShadow;
				poiLight.lightMap *= poiLight.detailShadow;
				poiLight.directColor = max(poiLight.directColor, 0.0001);
				poiLight.indirectColor = max(poiLight.indirectColor, 0.0001);
				if (0.0 == 3)
				{
					poiLight.directColor = max(poiLight.directColor, _LightingMinLightBrightness);
				}
				else
				{
					poiLight.directColor = max(poiLight.directColor, _LightingMinLightBrightness);
					poiLight.indirectColor = max(poiLight.indirectColor, _LightingMinLightBrightness);
				}
				poiLight.directColor = lerp(poiLight.directColor, dot(poiLight.directColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
				poiLight.indirectColor = lerp(poiLight.indirectColor, dot(poiLight.indirectColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
				if (_LightingCapEnabled)
				{
					poiLight.directColor = min(poiLight.directColor, _LightingCap);
					poiLight.indirectColor = min(poiLight.indirectColor, _LightingCap);
				}
				if (0.0)
				{
					poiLight.directColor = poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
				}
				#ifdef POI_PASS_BASE
				poiLight.directColor = max(poiLight.directColor * 1.0, 0);
				poiLight.directColor = max(poiLight.directColor + 0.0, 0);
				poiLight.indirectColor = max(poiLight.indirectColor * 1.0, 0);
				poiLight.indirectColor = max(poiLight.indirectColor + 0.0, 0);
				#endif
				float4 debugColor = 0;
				#ifdef POI_PASS_ADD
				debugColor = PoiLightDataSetupAdd(poiLight, poiFragData, poiMesh, poiCam, poiMods, i, mainTexture);
				#endif
				return debugColor;
			}
			void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiMods poiMods)
			{
				poiFragData.alpha = saturate(poiFragData.alpha + 0.0);
				if (0.0 > 0)
				{
					poiFragData.alpha = maskBlend(poiFragData.alpha, poiMods.globalMask[0.0 - 1], 2.0);
				}
			}
			void poiGeoParticle(VertexOut i, inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
				if (i.particleData.x < 0)
				{
					float progress = -i.particleData.x - 1.0;
					float packedAudio = i.particleData.y;
					float audioLinkHeight = floor(packedAudio / 65536.0) / 65535.0;
					float audioPosition = fmod(packedAudio, 65536.0) / 65535.0;
					float particleSeed = i.particleData.z;
					float frameIndex = 0;
					if (0.0)
					{
						float totalFrames = (0.0 > 0) ? 0.0 : (1.0 * 1.0);
						if (0.0 == 0)
						{
							frameIndex = floor(particleSeed * totalFrames);
						}
						else if (0.0 == 1)
						{
							frameIndex = floor(progress * totalFrames);
						}
						else if (0.0 == 2)
						{
							float timeOffset = 0;
							if (0.0)
							{
								timeOffset = particleSeed * totalFrames;
							}
							frameIndex = floor(fmod(_Time.y * 10.0 + timeOffset, totalFrames));
						}
						#ifdef POI_AUDIOLINK
						if (AudioLinkIsAvailable() && 0.0)
						{
							int spriteBand = clamp(0.0, 0, 3);
							frameIndex = floor(poiMods.audioLink[spriteBand] * totalFrames);
						}
						#endif
						frameIndex = clamp(frameIndex, 0, totalFrames - 1);
					}
					#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
					float3 lifetimeColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(progress, 0.5), 0).rgb;
					#else
					float3 lifetimeColor = float3(1, 1, 1);
					#endif
					float4 randFrag = poiRand4(float2(particleSeed, particleSeed * 1.37));
					float2 alphaRange = float4(1,1,0,0).xy;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable() && 0.0)
					{
						float alphaValue;
						if (0.0 == 5)
						{
							alphaValue = audioLinkHeight;
						}
						else
						{
							int alphaBand = clamp(0.0, 0, 4);
							alphaValue = poiMods.audioLink[alphaBand];
						}
						float alphaAdd = evalRamp4(alphaValue, float4(0,0,0,1));
						alphaRange = saturate(alphaRange + alphaAdd);
					}
					#endif
					float lifetimeAlpha = lerp(alphaRange.x, alphaRange.y, randFrag.y);
					float3 finalColor = float3(1, 1, 1);
					float finalAlpha = 1;
					float emissionBoost = 0;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable())
					{
						#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
						if (2.0 != 2)
						{
							float gradientSample = progress;
							if (2.0 == 0)
							gradientSample = audioPosition;
							else if (2.0 == 1)
							gradientSample = audioLinkHeight;
							float4 alGradientColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(gradientSample, 0.5), 0);
							lifetimeColor = alGradientColor.rgb;
						}
						#endif
						if (1.0)
						{
							float emissionValue;
							if (0.0 == 5)
							{
								emissionValue = audioLinkHeight;
							}
							else
							{
								int emissionBand = clamp(0.0, 0, 4);
								emissionValue = poiMods.audioLink[emissionBand];
							}
							emissionBoost += evalRamp4(emissionValue, float4(0,0,0,1));
						}
					}
					#endif
					#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
					float2 lookupUV = poiMesh.uv[0].xy;
					if (0.0)
					{
						float invCols = 1.0 / 1.0;
						float invRows = 1.0 / 1.0;
						float2 frameSize = float2(invCols, invRows);
						float column = fmod(frameIndex, 1.0);
						float row = floor(frameIndex * invCols);
						row = 1.0 - 1 - row;
						lookupUV = (lookupUV * frameSize) + float2(column, row) * frameSize;
						if (0.0 > 0)
						{
							float2 texelInset = (0.0) * frameSize / max(float4(1,1,0,0).xy, 1e-6);
							lookupUV = lerp(lookupUV, (float2(column + 1, row + 1) * frameSize), texelInset);
						}
					}
					lookupUV = lookupUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw;
					float4 particleTex = _ParticleTexture.SampleLevel(sampler_linear_repeat, lookupUV, 0);
					finalColor = particleTex.rgb * lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = particleTex.a * lifetimeAlpha * float4(1,1,1,1).a;
					#else
					finalColor = lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = lifetimeAlpha * float4(1,1,1,1).a;
					#endif
					finalAlpha *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 originalColor = poiFragData.baseColor;
					float3 originalEmission = poiFragData.emission;
					poiFragData.baseColor = customBlend(originalColor, finalColor, 0.0, 1.0);
					poiFragData.alpha *= saturate(finalAlpha);
					float emissStrength = lerp(float4(0,0,0,0).x, float4(0,0,0,0).y, randFrag.x) + emissionBoost;
					emissStrength *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 particleEmission = finalColor * emissStrength;
					if (0.0 == 0)
					{
						poiFragData.emission = particleEmission;
					}
					else
					{
						poiFragData.emission = originalEmission + particleEmission;
					}
				}
			}
			void calculateGlobalThemes(inout PoiMods poiMods)
			{
				float4 themeColorExposures = 0;
				float4 themeColor0, themeColor1, themeColor2, themeColor3 = 0;
				DecomposeHDRColor(float4(1,1,1,1).rgb, themeColor0.rgb, themeColorExposures.x);
				DecomposeHDRColor(float4(1,1,1,1).rgb, themeColor1.rgb, themeColorExposures.y);
				DecomposeHDRColor(float4(1,1,1,1).rgb, themeColor2.rgb, themeColorExposures.z);
				DecomposeHDRColor(float4(1,1,1,1).rgb, themeColor3.rgb, themeColorExposures.w);
				poiMods.globalColorTheme[0] = float4(ApplyHDRExposure(ModifyViaHSV(themeColor0.rgb, frac(0.0 + 0.0 * _Time.x), 0.0, 0.0), themeColorExposures.x), float4(1,1,1,1).a);
				poiMods.globalColorTheme[1] = float4(ApplyHDRExposure(ModifyViaHSV(themeColor1.rgb, frac(0.0 + 0.0 * _Time.x), 0.0, 0.0), themeColorExposures.y), float4(1,1,1,1).a);
				poiMods.globalColorTheme[2] = float4(ApplyHDRExposure(ModifyViaHSV(themeColor2.rgb, frac(0.0 + 0.0 * _Time.x), 0.0, 0.0), themeColorExposures.z), float4(1,1,1,1).a);
				poiMods.globalColorTheme[3] = float4(ApplyHDRExposure(ModifyViaHSV(themeColor3.rgb, frac(0.0 + 0.0 * _Time.x), 0.0, 0.0), themeColorExposures.w), float4(1,1,1,1).a);
			}
			void ApplyGlobalMaskModifiers(in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
			}
			float2 calculatePolarCoordinate(in PoiMesh poiMesh)
			{
				float2 delta = poiMesh.uv[0.0] - float4(0.5,0.5,0,0);
				float radius = length(delta) * 2 * 1.0;
				float angle = atan2(delta.x, delta.y);
				float phi = angle / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				angle = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				angle *= 1.0;
				return float2(radius, angle + distance(poiMesh.uv[0.0], float4(0.5,0.5,0,0)) * 0.0);
			}
			float2 MonoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(1.0, 1.0 / UNITY_PI);
				return float2(1.0, 1.0) - sphereCoords;
			}
			float2 StereoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(0.5, 1.0 / UNITY_PI);
				sphereCoords = float2(0.5, 1.0) - sphereCoords;
				return (sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
			}
			float2 calculateWorldUV(in PoiMesh poiMesh)
			{
				return float2(0.0 != 3 ? poiMesh.worldPos[ 0.0] : 0.0f, 2.0 != 3 ? poiMesh.worldPos[2.0] : 0.0f);
			}
			float2 calculatelocalUV(in PoiMesh poiMesh)
			{
				float localUVs[8];
				localUVs[0] = poiMesh.localPos.x;
				localUVs[1] = poiMesh.localPos.y;
				localUVs[2] = poiMesh.localPos.z;
				localUVs[3] = 0;
				localUVs[4] = poiMesh.vertexColor.r;
				localUVs[5] = poiMesh.vertexColor.g;
				localUVs[6] = poiMesh.vertexColor.b;
				localUVs[7] = poiMesh.vertexColor.a;
				return float2(localUVs[0.0],localUVs[1.0]);
			}
			float2 calculatePanosphereUV(in PoiMesh poiMesh)
			{
				float3 viewDirection = normalize(lerp(getCameraPosition().xyz, _WorldSpaceCameraPos.xyz, 1.0) - poiMesh.worldPos.xyz) * - 1;
				return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), 0.0);
			}
			#ifdef POI_CONSTELLATION
			float PoiDistLine(float2 p, float2 a, float2 b)
			{
				float2 pa = p-a;
				float2 ba = b-a;
				float t = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
				return length(pa - ba * t);
			}
			float PoiLine(float2 p, float2 a, float2 b)
			{
				float2 pa = p-a;
				float2 ba = b-a;
				float t = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
				float d = length(pa - ba * t);
				float lineLength = length(a-b);
				float baseThickness = lerp(0.005, 0.05, 0.5);
				float centerThinness = 4.0 * t * (1.0 - t);
				float minThickness = lerp(baseThickness, baseThickness * 0.3, 0.7);
				float thickness = lerp(minThickness, baseThickness, 1.0 - centerThinness);
				float lineFade = 1.0 - smoothstep(0.0, thickness, d);
				float lengthFade = smoothstep(1.2, 0.05, lineLength);
				return lineFade * lengthFade;
			}
			float PoiN21(float2 p)
			{
				p = frac(p*float2(233.213, 853.23));
				p += dot(p, p+23.24);
				return frac(p.x*p.y);
			}
			float2 PoiN22(float2 p)
			{
				float n = PoiN21(p);
				return float2(n, PoiN21(p+n));
			}
			float2 PoiGetPos(float2 id, float2 off, float time)
			{
				float2 n = PoiN22(id + off) * time;
				return off + sin(n) * 0.4;
			}
			float PoiLayer(float2 uv, float time)
			{
				float2 gv = frac(uv) - 0.5;
				float2 id = floor(uv);
				float lines = 0.0;
				float sparkles = 0.0;
				float2 p[9];
				int i = 0;
				for(float y=-1.0;y<=1.0;y++){
					for(float x=-1.0;x<=1.0;x++){
						p[i++] = PoiGetPos(id, float2(x, y), time);
					}
				}
				float t = time * 5.0;
				for(int j = 0; j < 9; j++)
				{
					lines += PoiLine(gv, p[4], p[j]);
					float2 vec = (p[j] - gv) * 30.0 * (1-0.75*0.75);
					float sparkle = 1.0/max(dot(vec, vec), 0.01);
					sparkle = min(sparkle, 5.0);
					sparkles += sparkle*(sin(t+frac(p[j].x)*10.0)*0.5 + 0.5);
				}
				lines += PoiLine(gv, p[1], p[3]);
				lines += PoiLine(gv, p[1], p[5]);
				lines += PoiLine(gv, p[3], p[7]);
				lines += PoiLine(gv, p[5], p[7]);
				lines = min(lines * 1.0, 1.0);
				sparkles = min(sparkles * 1.0 / 4.0, 1.0);
				return min(lines + sparkles, 1.0);
			}
			void applyConstellation(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiMods poiMods)
			{
				if(0.0 == 0) return;
				float4 constellationColorFinal = float4(1,1,1,1);
				if(0.0 > 0)
				{
					constellationColorFinal.rgb = poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
				}
				float mask = 1.0;
				#if defined(PROP_CONSTELLATIONMASK) || !defined(OPTIMIZER_ENABLED)
				mask = POI2D_SAMPLER_PAN(_ConstellationMask, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0)).r;
				#endif
				if(0.0)
				{
					mask = 1.0 - mask;
				}
				if(0.0 > 0)
				{
					mask = maskBlend(mask, poiMods.globalMask[0.0 - 1], 2.0);
				}
				if(mask == 0.0)
				{
					return;
				}
				float2 uv = poiMesh.uv[0.0].xy - float4(0.5,0.5,0,0);
				uv *= 10.0;
				float m = 0.0;
				float t = _Time.y * float4(0,0,0,0).z / 10.0 + float4(0,0,0,0).z;
				uv += (float4(0,0,0,0).xy / 10.0) * _Time.y + float4(0,0,0,0).xy;
				for(float i=0.0;i<1.0;i+= 1.0/4.0)
				{
					float z = frac(i+t);
					float size = lerp(10.0, 0.5, z);
					float fadeStart = 0.8;
					float fadeEnd = 1.0 - (1.0 - 0.8) * 0.2;
					fadeEnd = min(fadeEnd, 0.999);
					float fade = smoothstep(0.0, fadeStart, z) * smoothstep(1.0, fadeEnd, z);
					m += PoiLayer(uv * size + i*24.0, _Time.y) * fade;
				}
				m = min(m, 1.0);
				m *= mask;
				float constellationMask = m;
				float3 constellationColor = m * constellationColorFinal.rgb;
				if(2.0 == 0)
				{
					poiFragData.baseColor = lerp(poiFragData.baseColor, constellationColor, constellationMask);
				}
				else if(2.0 == 1)
				{
					poiFragData.baseColor = lerp(poiFragData.baseColor, poiFragData.baseColor * constellationColor, constellationMask);
				}
				else
				{
					poiFragData.baseColor += constellationColor * constellationMask;
				}
				poiFragData.emission += constellationColor * constellationMask * 5.0;
				if(0.0 > 0)
				{
					applyToGlobalMask(poiMods, 0.0 - 1, 0.0, constellationMask);
				}
			}
			#endif
			float4 frag(VertexOut i, uint facing : SV_IsFrontFace) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				PoiSHAr = unity_SHAr;
				PoiSHAg = unity_SHAg;
				PoiSHAb = unity_SHAb;
				PoiSHBr = unity_SHBr;
				PoiSHBg = unity_SHBg;
				PoiSHBb = unity_SHBb;
				PoiSHC =  unity_SHC;
				PoiMesh poiMesh;
				PoiInitStruct(PoiMesh, poiMesh);
				PoiLight poiLight;
				PoiInitStruct(PoiLight, poiLight);
				PoiCam poiCam;
				PoiInitStruct(PoiCam, poiCam);
				PoiMods poiMods;
				PoiInitStruct(PoiMods, poiMods);
				#if POI_PIPE == POI_URP
				PoiLightOut poiLightOut;
				PoiInitStruct(PoiLightOut, poiLightOut);
				#endif
				poiMods.globalEmission = 1;
				PoiFragData poiFragData;
				poiFragData.smoothness = 1;
				poiFragData.smoothness2 = 1;
				poiFragData.metallic = 1;
				poiFragData.specularMask = 1;
				poiFragData.reflectionMask = 1;
				poiFragData.emission = 0;
				poiFragData.baseColor = float3(0, 0, 0);
				poiFragData.finalColor = float3(0, 0, 0);
				poiFragData.alpha = 1;
				poiFragData.toggleVertexLights = 0;
				#ifdef POI_UDIMDISCARD
				applyUDIMDiscard(i, facing);
				#endif
				poiMesh.objectPosition = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
				poiMesh.objNormal = mul((float3x3)unity_WorldToObject, i.normal);
				poiMesh.normals[0] = i.normal;
				poiMesh.tangent[0] = i.tangent.xyz;
				poiMesh.binormal[0] = cross(i.normal, i.tangent.xyz) * (i.tangent.w * unity_WorldTransformParams.w);
				poiMesh.worldPos = i.worldPos.xyz;
				poiMesh.localPos = i.localPos.xyz;
				poiMesh.vertexColor = i.vertexColor;
				poiMesh.isFrontFace = facing;
				poiMesh.dx = ddx(poiMesh.uv[0]);
				poiMesh.dy = ddy(poiMesh.uv[0]);
				poiMesh.isRightHand = i.tangent.w > 0.0;
				#ifndef POI_PASS_OUTLINE
				if (!poiMesh.isFrontFace && 1)
				{
					poiMesh.normals[0] *= -1;
					poiMesh.tangent[0] *= -1;
					poiMesh.binormal[0] *= -1;
				}
				#endif
				poiCam.viewDir = !IsOrthographicCamera() ?
				#if defined(USING_STEREO_MATRICES)
				normalize((unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5 - i.worldPos.xyz) :
				#else
				normalize(_WorldSpaceCameraPos - i.worldPos.xyz) :
				#endif
				normalize(UNITY_MATRIX_I_V._m02_m12_m22);
				float3 tanToWorld0 = float3(poiMesh.tangent[0].x, poiMesh.binormal[0].x, poiMesh.normals[0].x);
				float3 tanToWorld1 = float3(poiMesh.tangent[0].y, poiMesh.binormal[0].y, poiMesh.normals[0].y);
				float3 tanToWorld2 = float3(poiMesh.tangent[0].z, poiMesh.binormal[0].z, poiMesh.normals[0].z);
				float3 ase_tanViewDir = tanToWorld0 * poiCam.viewDir.x + tanToWorld1 * poiCam.viewDir.y + tanToWorld2 * poiCam.viewDir.z;
				poiCam.tangentViewDir = normalize(ase_tanViewDir);
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
				poiMesh.lightmapUV = i.lightmapUV;
				#endif
				poiMesh.parallaxUV = poiCam.tangentViewDir.xy / max(poiCam.tangentViewDir.z, 0.0001);
				poiMesh.uv[0] = i.uv[0].xy;
				poiMesh.uv[1] = i.uv[0].zw;
				poiMesh.uv[2] = i.uv[1].xy;
				poiMesh.uv[3] = i.uv[1].zw;
				poiMesh.uv[4] = poiMesh.uv[0];
				poiMesh.uv[5] = poiMesh.uv[0];
				poiMesh.uv[6] = poiMesh.uv[0];
				poiMesh.uv[7] = poiMesh.uv[0];
				poiMesh.uv[8] = poiMesh.uv[0];
				poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
				poiMesh.uv[5] = calculateWorldUV(poiMesh);
				poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
				poiMesh.uv[8] = calculatelocalUV(poiMesh);
				float3 worldViewUp = normalize(float3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, float3(0, 1, 0)));
				float3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
				poiMesh.uv[9] = float2(dot(worldViewRight, poiMesh.normals[0]), dot(worldViewUp, poiMesh.normals[0])) * 0.5 + 0.5;
				poiMods.globalMask[0] = 1;
				poiMods.globalMask[1] = 1;
				poiMods.globalMask[2] = 1;
				poiMods.globalMask[3] = 1;
				poiMods.globalMask[4] = 1;
				poiMods.globalMask[5] = 1;
				poiMods.globalMask[6] = 1;
				poiMods.globalMask[7] = 1;
				poiMods.globalMask[8] = 1;
				poiMods.globalMask[9] = 1;
				poiMods.globalMask[10] = 1;
				poiMods.globalMask[11] = 1;
				poiMods.globalMask[12] = 1;
				poiMods.globalMask[13] = 1;
				poiMods.globalMask[14] = 1;
				poiMods.globalMask[15] = 1;
				ApplyGlobalMaskModifiers(poiMesh, poiMods, poiCam);
				#if POI_PIPE == POI_URP
				InputData inputData;
				PoiInitStruct(InputData, inputData);
				inputData.positionWS = poiMesh.worldPos;
				inputData.normalWS = poiMesh.normals[1];
				inputData.viewDirectionWS = poiCam.viewDir;
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(i.pos);
				#endif
				float2 mainUV = poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0));
				if (0.0)
				{
					mainUV = sharpSample(float4(0.03125,0.03125,32,32), mainUV);
				}
				float4 mainTexture = POI2D_SAMPLER_PAN_STOCHASTIC(_MainTex, _MainTex, mainUV, float4(0,0,0,0), 0.0);
				mainTexture.a = max(mainTexture.a, 0.0);
				#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
				poiMesh.tangentSpaceNormal = PoiUnpackNormalScale(POI2D_SAMPLER_PAN_STOCHASTIC(_BumpMap, _MainTex, poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0)), float4(0,0,0,0), 0.0), 1.0);
				#else
				poiMesh.tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				#endif
				float3 tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				poiMesh.normals[0] = normalize(
				tangentSpaceNormal.x * poiMesh.tangent[0] +
				tangentSpaceNormal.y * poiMesh.binormal[0] +
				tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.normals[1] = normalize(
				poiMesh.tangentSpaceNormal.x * poiMesh.tangent[0] +
				poiMesh.tangentSpaceNormal.y * poiMesh.binormal[0] +
				poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.tangent[1] = cross(poiMesh.binormal[0], -poiMesh.normals[1]);
				poiMesh.binormal[1] = cross(-poiMesh.normals[1], poiMesh.tangent[0]);
				poiCam.forwardDir = getCameraForward();
				#if defined(USING_STEREO_MATRICES)
				poiCam.worldPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
				#else
				poiCam.worldPos = _WorldSpaceCameraPos;
				#endif
				poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
				poiCam.vertexReflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[0]);
				poiCam.clipPos = i.pos;
				poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
				poiCam.posScreenSpace = poiTransformClipSpacetoScreenSpaceFrag(poiCam.clipPos);
				#ifdef UNITY_SINGLE_PASS_STEREO
				poiCam.posScreenSpace.x = poiCam.posScreenSpace.x * 0.5;
				#endif
				poiCam.screenUV = poiCam.posScreenSpace.xy / poiCam.posScreenSpace.w;
				poiCam.posScreenPixels = calcPixelScreenUVs(poiCam.posScreenSpace);
				poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
				poiCam.worldDirection.xyz = poiMesh.worldPos.xyz - poiCam.worldPos;
				poiCam.worldDirection.w = dot(i.pos, CalculateFrustumCorrection());
				calculateGlobalThemes(poiMods);
				if (_UdonForceSceneLighting)
				{
					_LightingMinLightBrightness = 0;
					_LightingCapEnabled = 0;
					_LightingMonochromatic = 0;
				}
				#ifdef POI_PASS_BASE
				float3 L0 = float3(0, 0, 0);
				float3 L1r = float3(0, 0, 0);
				float3 L1g = float3(0, 0, 0);
				float3 L1b = float3(0, 0, 0);
				#if POI_PIPE == POI_BIRP
				if (_UdonLightVolumeEnabled && 1.0)
				{
					LightVolumeSH(poiMesh.worldPos, L0, L1r, L1g, L1b);
					PoiSHAr = float4(L1r, L0.r);
					PoiSHAg = float4(L1g, L0.g);
					PoiSHAb = float4(L1b, L0.b);
					PoiSHBr = 0;
					PoiSHBg = 0;
					PoiSHBb = 0;
					PoiSHC = 0;
				}
				#endif
				#if POI_PIPE == POI_URP
				#ifdef PROBE_VOLUMES_L1
				if (1.0)
				{
					APVResources apvRes = FillAPVResources();
					float3 posWS = GetAbsolutePositionWS(poiMesh.worldPos);
					posWS = AddNoiseToSamplingPosition(posWS, poiCam.clipPos.xy, poiCam.viewDir);
					APVSample apvSample = SampleAPV(posWS, poiMesh.normals[1], GetMeshRenderingLayer(), poiCam.viewDir);
					if (apvSample.status != APV_SAMPLE_STATUS_INVALID)
					{
						apvSample.Decode();
						PoiSHAr = float4(apvSample.L1_R, apvSample.L0.r);
						PoiSHAg = float4(apvSample.L1_G, apvSample.L0.g);
						PoiSHAb = float4(apvSample.L1_B, apvSample.L0.b);
						#ifdef PROBE_VOLUMES_L2
						PoiSHBr = float4(apvSample.L2_R, apvSample.L0.r);
						PoiSHBg = float4(apvSample.L2_G, apvSample.L0.r);
						PoiSHBb = float4(apvSample.L2_B, apvSample.L0.r);
						PoiSHC = float4(apvSample.L2_C, 0);
						#else
						PoiSHBr = 0;
						PoiSHBg = 0;
						PoiSHBb = 0;
						PoiSHC = 0;
						#endif
					}
				}
				#endif
				#endif
				#endif
				#if defined(PROP_LIGHTINGDETAILSHADOWMAPS)
				float4 DetailShadows = POI2D_SAMPLER_PAN(_LightingDetailShadowMaps, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0));
				float poiDetailShadowAdditional = lerp(1, DetailShadows.r, 1.0) * lerp(1, DetailShadows.g, 0.0) * lerp(1, DetailShadows.b, 0.0) * lerp(1, DetailShadows.a, 0.0);
				float poiDetailShadowMain = lerp(1, DetailShadows.r, 1.0) * lerp(1, DetailShadows.g, 0.0) * lerp(1, DetailShadows.b, 0.0) * lerp(1, DetailShadows.a, 0.0);
				#else
				float poiDetailShadowAdditional = 1;
				float poiDetailShadowMain = 1;
				#endif
				if (0.0 > 0)
				{
					poiDetailShadowAdditional = maskBlend(poiDetailShadowAdditional, poiMods.globalMask[0.0 - 1], 2.0);
					poiDetailShadowMain = maskBlend(poiDetailShadowMain, poiMods.globalMask[0.0 - 1], 2.0);
				}
				#ifndef POI_PASS_ADD
				poiLight.detailShadow = poiDetailShadowMain;
				#else
				poiLight.detailShadow = poiDetailShadowAdditional;
				#endif
				#if defined(PROP_LIGHTINGSHADOWMASKS)
				float4 ShadowMasks = POI2D_SAMPLER_PAN(_LightingShadowMasks, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0));
				poiLight.shadowMask = lerp(1, ShadowMasks.r, 1.0) * lerp(1, ShadowMasks.g, 0.0) * lerp(1, ShadowMasks.b, 0.0) * lerp(1, ShadowMasks.a, 0.0);
				#else
				poiLight.shadowMask = 1;
				#endif
				if (0.0 > 0)
				{
					poiLight.shadowMask = maskBlend(poiLight.shadowMask.r, poiMods.globalMask[0.0 - 1], 2.0);
				}
				#if POI_PIPE == POI_URP && !defined(POI_PASS_LILFUR)
				poiLight.shadowMask = poiLight.shadowMask * PoiCalculateShadowMask(i.lightmapUV.xy);
				#endif
				#if defined(PROP_LIGHTINGAOMAPS)
				float4 AOMaps = POI2D_SAMPLER_PAN(_LightingAOMaps, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0));
				poiLight.occlusion = min(min(min(lerp(1, AOMaps.r, 1.0), lerp(1, AOMaps.g, 0.0)), lerp(1, AOMaps.b, 0.0)), lerp(1, AOMaps.a, 0.0));
				#else
				poiLight.occlusion = 1;
				#endif
				if (0.0 > 0)
				{
					poiLight.occlusion = maskBlend(poiLight.occlusion, poiMods.globalMask[0.0 - 1], 2.0);
				}
				Light mainLight;
				PoiInitStruct(Light, mainLight);
				#if POI_PIPE == POI_BIRP
				mainLight.direction = _WorldSpaceLightPos0.xyz;
				mainLight.color = _LightColor0.rgb;
				#elif POI_PIPE == POI_URP
				mainLight = GetMainLight(TransformWorldToShadowCoord(poiMesh.worldPos), poiMesh.worldPos, poiLight.shadowMask);
				BRDFData brdfData;
				InitializeBRDFData(1, 0.0, 0.0, 0.0, poiFragData.alpha, brdfData);
				BRDFData brdfDataClearCoat;
				InitializeBRDFDataClearCoat(0.0, 0.5, brdfData, brdfDataClearCoat);
				poiLight.brdfData = brdfData;
				poiLight.brdfDataClearCoat = brdfDataClearCoat;
				#endif
				poiLight.lightType = POI_DIRECTIONAL;
				poiLight.unityLight = mainLight;
				float4 debugLight = PoiLightDataSetup(poiLight, poiFragData, poiMesh, poiCam, poiMods, i, mainTexture);
				#if defined(POI_PASS_BASE) || defined(POI_PASS_ADD)
				if (0.0) return debugLight;
				#endif
				poiFragData.baseColor = mainTexture.rgb;
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.baseColor *= poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
				poiFragData.alpha = mainTexture.a * float4(1,1,1,1).a;
				#else
				if(_TwoPassOverrideFirstPassColor)
				{
					poiFragData.baseColor *= poiThemeColor(poiMods, _TwoPassColor.rgb, _TwoPassColorThemeIndex);
					poiFragData.alpha = mainTexture.a * _TwoPassColor.a;
				}
				#endif
				if (2.0)
				{
					#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
					float alphaMask = POI2D_SAMPLER_PAN(_AlphaMask, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0).xy).r;
					#else
					float alphaMask = 1;
					#endif
					alphaMask = saturate(alphaMask * 1.0 + (0.0 ? 0.0 * - 1 : 0.0));
					if (0.0) alphaMask = 1 - alphaMask;
					if (2.0 == 1) poiFragData.alpha = alphaMask;
					if (2.0 == 2) poiFragData.alpha = poiFragData.alpha * alphaMask;
					if (2.0 == 3) poiFragData.alpha = saturate(poiFragData.alpha + alphaMask);
					if (2.0 == 4) poiFragData.alpha = saturate(poiFragData.alpha - alphaMask);
				}
				applyAlphaOptions(poiFragData, poiMesh, poiCam, poiMods);
				if (0.0 > 0)
				{
					applyToGlobalMask(poiMods, 0.0 - 1, 0.0, i.particleData.x < 0 ? 1.0 : 0.0);
				}
				if (i.particleData.x < 0)
				{
					poiFragData.baseColor = lerp(poiFragData.baseColor, float4(1,1,1,1), 1.0);
				}
				poiGeoParticle(i, poiFragData, poiMesh, poiMods, poiCam);
				
				if (0.0)
				{
					poiFragData.baseColor *= saturate(poiFragData.alpha);
				}
				poiFragData.finalColor = poiFragData.baseColor;
				poiLight.finalLighting = 1;
				poiLight.rampedLightMap = poiEdgeNonLinear(poiLight.nDotL, 0.1, .1);
				#if POI_PIPE == POI_URP
				poiLight.finalLighting += poiLightOut.totalLighting;
				poiFragData.finalColor = poiFragData.finalColor * poiLight.finalLighting;
				#else
				poiFragData.finalColor = poiFragData.baseColor * poiLight.finalLighting;
				#endif
				#if POI_PIPE == POI_URP
				poiLight.finalLightAdd += poiLightOut.totalLightAdd;
				#endif
				poiFragData.finalColor += poiLight.finalLightAdd;
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.alpha = 0.0 ? 1 : poiFragData.alpha;
				#else
				poiFragData.alpha = _AlphaForceOpaque2 ? 1 : poiFragData.alpha;
				#endif
				#ifdef POI_PASS_BASE
				poiFragData.emission = max(poiFragData.emission * 1.0, 0);
				poiFragData.finalColor = max(poiFragData.finalColor * 1.0, 0);
				#endif
				if (2.0 == POI_MODE_OPAQUE)
				{
				}
				clip(poiFragData.alpha - 0.0);
				if (2.0 == POI_MODE_CUTOUT && !0.0)
				{
					poiFragData.alpha = 1;
				}
				poiFragData.finalColor += poiFragData.emission * poiMods.globalEmission;
				applyUnityFog(poiFragData.finalColor, i.fogData);
				return float4(poiFragData.finalColor, poiFragData.alpha) + POI_SAFE_RGB0;
			}
			ENDHLSL
		}
		Pass
		{
			Name "ShadowCaster"
			Tags { "LightMode" = "ShadowCaster" }
			Stencil
			{
				Ref [_StencilRef]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilCompareFunction]
				Pass [_StencilPassOp]
				Fail [_StencilFailOp]
				ZFail [_StencilZFailOp]
			}
			ZWrite [_ZWrite]
			Cull Off
			AlphaToMask Off
			ZTest [_ZTest]
			ColorMask RGB
			Offset [_OffsetFactor], [_OffsetUnits]
			BlendOp [_BlendOp], [_BlendOpAlpha]
			Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
			HLSLPROGRAM
 #define _STOCHASTICMODE_DELIOT_HEITZ 
 #define OPTIMIZER_ENABLED 
			#pragma target 5.0
			#pragma skip_variants DECALS_OFF DECALS_3RT DECALS_4RT DECAL_SURFACE_GRADIENT _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3 _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH _DECAL_LAYERS
			#pragma skip_variants _MAIN_LIGHT_SHADOWS_SCREEN _SCREEN_SPACE_OCCLUSION _USE_FAST_SRGB_LINEAR_CONVERSION _LIGHT_LAYERS
			#if !defined(POI_WORLD)
			#pragma skip_variants _ADDITIONAL_LIGHT_SHADOWS _ADDITIONAL_LIGHTS_VERTEX LIGHTMAP_ON DYNAMICLIGHTMAP_ON LIGHTMAP_SHADOW_MIXING SHADOWS_SHADOWMASK DIRLIGHTMAP_COMBINED _MIXED_LIGHTING_SUBTRACTIVE
			#endif
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag
			#if POI_PIPE == POI_URP
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#define FOG_LINEAR 0
			#define FOG_EXP 0
			#define FOG_EXP2 0
			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW
			#else
			#pragma multi_compile_vertex _ FOG_EXP2
			#endif
			#pragma multi_compile_instancing
			#pragma multi_compile_shadowcaster
			#define POI_PASS_SHADOW
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			CBUFFER_START(UnityPerMaterial)
			float _GrabMode;
			float _Mode;
			#ifndef _STOCHASTICMODE_NONE
			#ifdef _STOCHASTICMODE_DELIOT_HEITZ
			float _StochasticDeliotHeitzDensity;
			#endif
			#endif
			float4 _Color;
			float _ColorThemeIndex;
			float _MainPixelMode;
			float4 _MainTex_ST;
			float4 _MainTex_TexelSize;
			float2 _MainTexPan;
			float _MainTexUV;
			float _MainTexStochastic;
			float _MainIgnoreTexAlpha;
			float4 _BumpMap_ST;
			float2 _BumpMapPan;
			float _BumpMapUV;
			float _BumpScale;
			float _BumpMapStochastic;
			float4 _AlphaMask_ST;
			float2 _AlphaMaskPan;
			float _AlphaMaskUV;
			float _AlphaMaskInvert;
			float _MainAlphaMaskMode;
			float _AlphaMaskBlendStrength;
			float _AlphaMaskValue;
			float _Cutoff;
			float _AlphaForceOpaque;
			float _AlphaMod;
			float _AlphaPremultiply;
			float _AlphaBoostFA;
			float _AlphaGlobalMask;
			float _AlphaGlobalMaskBlendType;
			float _ParticleRandomSeedOffset;
			float _ParticleApplyGlobalMaskIndex;
			float _ParticleApplyGlobalMaskBlendType;
			float4 _ParticleBaseColorOverride;
			float _ParticleOverrideBaseColor;
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleSpawnMask_ST;
			float2 _ParticleSpawnMaskPan;
			float _ParticleSpawnMaskUV;
			float _ParticleSpawnMaskChannel;
			float _ParticleSpawnMaskInvert;
			#endif
			float _ParticleSpawnMaskVertexColor;
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleTexture_ST;
			float2 _ParticleTexturePan;
			float _ParticleTextureUV;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleNoiseTex_ST;
			float2 _ParticleNoiseTexPan;
			float _ParticleNoiseTexUV;
			#endif
			float4 _ParticleSizeRamp;
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleLifetimeGradient_ST;
			#endif
			float4 _ParticleAlphaRamp;
			float4 _ParticleEmissionRamp;
			float _ParticleColorBlendMode;
			float _ParticleColorBlendAlpha;
			float _ParticleEmissionBlendMode;
			float4 _ParticleColor;
			float _ParticleColorThemeIndex;
			float4 _ParticleEmissionStrength;
			float4 _ParticleAlpha;
			float _ParticleSpriteSheetEnabled;
			float _ParticleSpriteSheetColumns;
			float _ParticleSpriteSheetRows;
			float _ParticleSpriteSheetFrameSelection;
			float _ParticleSpriteSheetFPS;
			float _ParticleSpriteSheetRandomStart;
			float _ParticleSpriteSheetTotalFrames;
			float _ParticleSpriteSheetInset;
			float _ParticleSpriteSheetFrameBias;
			float _ParticleRenderBaseMesh;
			float _ParticleDensity;
			float4 _ParticleSize;
			float4 _ParticleFloatDistance;
			float4 _ParticleNoiseStrength;
			float4 _ParticleNoiseScrollSpeed;
			float4 _ParticleRotationSpeed;
			float _ParticleMotionMode;
			float4 _ParticleTravelDistance;
			float _ParticleCycleDuration;
			float _ParticleSpawnReductionEnabled;
			float4 _ParticleSpawnDistances;
			float4 _ParticleSpawnReduction;
			float _ParticlePosUVSource;
			float _ParticlePosUVDestination;
			float4 _ParticleWorldDirection;
			float _ParticleDirectionStrength;
			float _ParticleDirectionStrengthCurve;
			float _ParticleSpawnDirectionCull;
			float4 _ParticleDirectionRamp;
			float _ParticleFaceDirection;
			float _ParticleInheritNormal;
			float _ParticleALType;
			#ifdef POI_AUDIOLINK
			float _ParticleALWaveformScale;
			float _ParticleALWaveformSmoothing;
			float _ParticleALGradientSource;
			float _ParticleALReactiveEmission;
			float _ParticleALReactiveEmissionBand;
			float4 _ParticleALReactiveEmissionRamp;
			float _ParticleALSizeModulation;
			float _ParticleALSizeBand;
			float4 _ParticleALSizeRamp;
			float _ParticleALRotationModulation;
			float _ParticleALRotationBand;
			float _ParticleALRotationType;
			float _ParticleALRotationSpeed;
			float _ParticleALNoiseModulation;
			float _ParticleALNoiseBand;
			float4 _ParticleALNoiseRamp;
			float _ParticleALAlphaModulation;
			float _ParticleALAlphaBand;
			float4 _ParticleALAlphaRamp;
			float _ParticleALSpriteSheetFrameControl;
			float _ParticleALSpriteSheetBand;
			#endif
			int _GlobalMaskVertexColorLinearSpace;
			float _StereoEnabled;
			float _PolarUV;
			float2 _PolarCenter;
			float _PolarRadialScale;
			float _PolarLengthScale;
			float _PolarSpiralPower;
			float _PanoUseBothEyes;
			float _UVModWorldPos0;
			float _UVModWorldPos1;
			float _UVModLocalPos0;
			float _UVModLocalPos1;
			CBUFFER_END
			float _IgnoreFog;
			float _RenderingReduceClipDistance;
			int _FlipBackfaceNormals;
			float _AddBlendOp;
			float _Cull;
			SamplerState point_clamp_sampler;
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			#define STEREO_UV(uv) float3(uv, unity_StereoEyeIndex)
			#else
			#define STEREO_UV(uv) uv
			#endif
			#if POI_PIPE == POI_BIRP
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			Texture2DArray<float> _CameraDepthTexture;
			#else
			Texture2D<float> _CameraDepthTexture;
			#endif
			#endif
			#if POI_PIPE == POI_URP
			TEXTURE2D_X_FLOAT(_CameraDepthTexture);
			float4 _CameraDepthTexture_TexelSize;
			#endif
			float SampleScreenDepth(float2 uv)
			{
				uv.y = _ProjectionParams.x * 0.5 + 0.5 - uv.y * _ProjectionParams.x;
				return _CameraDepthTexture.SampleLevel(point_clamp_sampler, STEREO_UV(uv), 0).r;
			}
			bool DepthTextureExists()
			{
				float3 dTexDim = 0;
				#if POI_PIPE == POI_BIRP
				#ifdef UNITY_STEREO_INSTANCING_ENABLED
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y, dTexDim.z);
				#else
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y);
				#endif
				#endif
				#if POI_PIPE == POI_URP
				dTexDim.xy = _CameraDepthTexture_TexelSize.zw;
				#endif
				return dTexDim.x > 16;
			}
			UNITY_DECLARE_TEX2D(_MainTex);
			#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BumpMap;
			#endif
			#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _AlphaMask;
			#endif
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleSpawnMask;
			#endif
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleTexture;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleNoiseTex;
			#endif
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleLifetimeGradient;
			#endif
			float3 _LightDirection;
			float3 _LightPosition;
			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				#ifdef POI_PASS_MOTION_VECTORS
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
				float3 alembicMotionVector : TEXCOORD5;
				#endif
				#endif
				uint vertexId : SV_VertexID;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct tessellatedAppData
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				uint vertexId : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct VertexOut
			{
				float4 pos : SV_POSITION;
				float4 uv[2] : TEXCOORD0;
				float3 normal : TEXCOORD2;
				float4 tangent : TEXCOORD3;
				float4 worldPos : TEXCOORD4;
				float4 localPos : TEXCOORD5;
				float4 vertexColor : TEXCOORD6;
				float4 lightmapUV : TEXCOORD7;
				float2 fogData: TEXCOORD8;
				POI_SHADOW_COORDS(9)
				#ifdef POI_PASS_MOTION_VECTORS
				float4 positionCSNoJitter         : POSITION_CS_NO_JITTER;
				float4 previousPositionCSNoJitter : PREV_POSITION_CS_NO_JITTER;
				#endif
				nointerpolation float3 particleData : TEXCOORD13;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			float2 vertexUV(in VertexOut o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			float2 vertexUV(in appdata v, int index)
			{
				switch(index)
				{
					case 0:
					return v.uv0.xy;
					case 1:
					return v.uv1.xy;
					case 2:
					return v.uv2.xy;
					case 3:
					return v.uv3.xy;
					default:
					return v.uv0.xy;
				}
			}
			#ifdef POI_PASS_LILFUR
			float2 vertexUV(in PoiGeoToFragLilFur o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			#endif
			#ifdef POI_AUDIOLINK
			inline int poiALBandPass(int bandIdx)
			{
				bandIdx = clamp(bandIdx, 0, 3);
				return bandIdx == 0 ? ALPASS_AUDIOBASS : bandIdx == 1 ? ALPASS_AUDIOLOWMIDS : bandIdx == 2 ? ALPASS_AUDIOHIGHMIDS : ALPASS_AUDIOTREBLE;
			}
			#endif
			void applyReducedRenderClipDistance(inout VertexOut o)
			{
				if (o.pos.w < _ProjectionParams.y * 1.01 && o.pos.w > 0)
				{
					#if defined(UNITY_REVERSED_Z) // DirectX
					o.pos.z = o.pos.z * 0.0001 + o.pos.w * 0.999;
					#else // OpenGL
					o.pos.z = o.pos.z * 0.0001 - o.pos.w * 0.999;
					#endif
				}
			}
			#if POI_PIPE == POI_URP
			float4 GetShadowPositionHClip(float3 positionWS, float3 normalWS)
			{
				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
				float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
				float3 lightDirectionWS = _LightDirection;
				#endif
				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));
				positionCS = ApplyShadowClamping(positionCS);
				return positionCS;
			}
			#endif
			VertexOut vert(appdata v)
			{
				UNITY_SETUP_INSTANCE_ID(v);
				VertexOut o;
				PoiInitStruct(VertexOut, o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				#ifdef POI_TESSELLATED
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v);
				#endif
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				#ifdef POI_PASS_OUTLINE
				if (0.0 > 0.5)
				{
					return (VertexOut)POI_NAN;
				}
				#endif
				#ifdef POI_AUDIOLINK
				float vertexAudioLink[5];
				vertexAudioLink[0] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 0))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 0))[0];
				vertexAudioLink[1] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 1))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 1))[0];
				vertexAudioLink[2] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 2))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 2))[0];
				vertexAudioLink[3] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 3))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 3))[0];
				vertexAudioLink[4] = AudioLinkData(ALPASS_GENERALVU + float2(8, 0))[0];
				#endif
				#if POI_PIPE == POI_BIRP
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.tangent.xyz = UnityObjectToWorldDir(v.tangent);
				#elif  POI_PIPE == POI_URP
				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(v.normal, v.tangent);
				o.normal = vertexNormalInput.normalWS;
				o.tangent.xyz = vertexNormalInput.tangentWS;
				#endif
				o.tangent.w = v.tangent.w;
				o.vertexColor = v.color;
				o.uv[0] = float4(v.uv0.xy, v.uv1.xy);
				o.uv[1] = float4(v.uv2.xy, v.uv3.xy);
				#if defined(LIGHTMAP_ON)
				OUTPUT_LIGHTMAP_UV(v.uv1.xy, unity_LightmapST, o.lightmapUV.xy);
				#endif
				#ifdef DYNAMICLIGHTMAP_ON
				OUTPUT_LIGHTMAP_UV(v.uv2.xy, unity_LightmapST, o.lightmapUV.zw);
				#endif
				o.localPos = v.vertex;
				o.worldPos = mul(unity_ObjectToWorld, o.localPos);
				float3 localOffset = float3(0, 0, 0);
				float3 worldOffset = float3(0, 0, 0);
				o.localPos.rgb += localOffset;
				o.worldPos.rgb += worldOffset;
				o.pos = PoiObjectToClipPos(o.localPos.rgb);
				o.fogData.x = o.pos.z; // This is used for fog calculations, so we need to ensure it's in clip space
				#ifdef FOG_EXP2
				o.fogData.y = 1;
				#else
				o.fogData.y = 0;
				#endif
				#if !defined(POI_PASS_SHADOW)
				POI_TRANSFER_SHADOW(o, o.uv[0].xy);
				#else
				v.vertex.xyz = o.localPos.xyz;
				POI_TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
				#endif
				if (0.0)
				{
					applyReducedRenderClipDistance(o);
				}
				#ifdef POI_PASS_META
				o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
				#endif
				#ifdef POI_PASS_MOTION_VECTORS
				#if defined(APPLICATION_SPACE_WARP_MOTION)
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				o.pos = o.positionCSNoJitter;
				#else
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				#endif
				float4 prevPos = (unity_MotionVectorsParams.x == 1) ? float4(v.positionOld, 1) : o.localPos;
				#if _ADD_PRECOMPUTED_VELOCITY
				prevPos = prevPos - float4(v.alembicMotionVector, 0);
				#endif
				o.previousPositionCSNoJitter = mul(_PrevViewProjMatrix, mul(UNITY_PREV_MATRIX_M, prevPos));
				#endif
				#ifdef POI_PASS_LILFUR
				#endif
				return o;
			}
			#define MAX_PARTICLES_PER_TRIANGLE 3
			#define CM2_TO_M2 10000.0
			#define CM_TO_M 0.01
			#define PARTICLE_VERTICES 4
			struct ParticleData
			{
				float3 position;
				float size;
				float progress;
				float audioHeight;
				float audioPosition;
				float rotationSpeed;
				float audioRotationOffset;
				float2 particleSeed;
				float2 spawnUV;
				float3 spawnNormal;
				float3 noiseOffset;
				float3 moveDir;
				float motionVelocity;
			};
			float3 poiAnyPerpendicular(float3 v)
			{
				float3 a = (abs(v.x) < 0.5) ? float3(1, 0, 0) : float3(0, 1, 0);
				float3 p = cross(v, a);
				return (length(p) > 1e-6) ? normalize(p) : normalize(cross(v, float3(0, 0, 1)));
			}
			float3 poiRotateAroundAxis(float3 v, float3 axis, float angle)
			{
				float s, c; sincos(angle, s, c);
				return v * c + cross(axis, v) * s + axis * dot(axis, v) * (1 - c);
			}
			float3 poiSlerpUnitStable(float3 fromDir, float3 toDir, float t)
			{
				fromDir = normalize(fromDir);
				toDir = normalize(toDir);
				float d = clamp(dot(fromDir, toDir), -1.0, 1.0);
				if (d > 0.999)
				{
					return normalize(lerp(fromDir, toDir, t));
				}
				if (d < - 0.999)
				{
					float3 axis = poiAnyPerpendicular(fromDir);
					return normalize(poiRotateAroundAxis(fromDir, axis, UNITY_PI * t));
				}
				float omega = acos(d);
				float s = sin(omega);
				float w0 = sin((1.0 - t) * omega) / s;
				float w1 = sin(t * omega) / s;
				return normalize(fromDir * w0 + toDir * w1);
			}
			ParticleData GenerateParticle(int particleIndex, uint primID, float3 v0_world, float3 v1_world, float3 v2_world, float3 n0, float3 n1, float3 n2, float3 tangent, float3 bitangent, float2 uvA, float2 uvB, float2 uvC, bool audioLinkAvailable)
			{
				ParticleData particle;
				float2 seedBase = float2((primID + particleIndex) * 0.51, particleIndex * 1.123) + 0.069;
				float randomU = poiRand(seedBase);
				float randomV = poiRand(seedBase.yx);
				if (randomU + randomV > 1.0)
				{
					randomU = 1.0 - randomU; randomV = 1.0 - randomV;
				}
				float3 basePos = v0_world * (1.0 - randomU - randomV) + v1_world * randomU + v2_world * randomV;
				particle.spawnUV = uvA * (1.0 - randomU - randomV) + uvB * randomU + uvC * randomV;
				particle.spawnNormal = normalize(n0 * (1.0 - randomU - randomV) + n1 * randomU + n2 * randomV);
				float3 normal = normalize(n0 + n1 + n2);
				float4 rand1 = float4(poiRand3(seedBase), poiRand(seedBase + 11.0));
				float4 rand2 = float4(poiRand3(seedBase + 1.0), poiRand(seedBase + 12.0));
				float4 rand3 = float4(poiRand3(seedBase + 2.0), poiRand(seedBase + 13.0));
				float progress = frac((_Time.y / 2.0) + rand1.x);
				float3 worldDir = float4(0,1,0,0).xyz;
				float invLen = rsqrt(max(dot(worldDir, worldDir), 1e-8));
				worldDir *= invLen;
				float specificTravelDistance = lerp(float4(50,100,0,1000).x, float4(50,100,0,1000).y, rand1.w) * CM_TO_M;
				float dBW = clamp(dot(normal, worldDir), -1.0, 1.0);
				float angN = acos(dBW) / 3.14159265;
				float effStrength = saturate(0.0 / max(angN, 1e-4));
				float3 moveDir = poiSlerpUnitStable(normal, worldDir, effStrength);
				float motionVelocity = 0;
				if (0.0 >= 1) // Outward or Ping Pong
				{
					float effectiveProgress = progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(progress * UNITY_PI);
						motionVelocity = cos(progress * UNITY_PI);
					}
					else // Outward
					{
						motionVelocity = 1.0; // Always moving forward
					}
					float3 integratedPos = basePos;
					[unroll]
					for (int step = 0; step < 8; ++step)
					{
						float t = effectiveProgress * ((step + 0.5) / 8.0);
						float ramp = evalRamp4(saturate(t), float4(0,1,0,1));
						float blend = saturate(effStrength * ramp);
						float3 stepDir = poiSlerpUnitStable(normal, worldDir, blend);
						integratedPos += stepDir * (specificTravelDistance * (effectiveProgress / 8.0));
					}
					basePos = integratedPos;
				}
				float3 floatPos = basePos + moveDir * (lerp(float4(1,1.5,0,500).x, float4(1,1.5,0,500).y, rand2.z) * CM_TO_M);
				float3 noiseOffset = 0;
				#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
				float noiseStrength = lerp(float4(0,0,0,50).x, float4(0,0,0,50).y, rand3.x) * CM_TO_M;
				float noiseScrollSpeed = lerp(float4(1,1,0,0).x, float4(1,1,0,0).y, rand3.w);
				float2 lookupUV = (rand2.xy * float4(1,1,0,0).xy) + float4(1,1,0,0).zw;
				float2 dynamicPan = float4(0,0,0,0) + (_Time.x * noiseScrollSpeed);
				float3 noiseVal = _ParticleNoiseTex.SampleLevel(sampler_linear_repeat, lookupUV + dynamicPan, 0).rgb * 2.0 - 1.0;
				noiseOffset = (tangent * noiseVal.r + bitangent * noiseVal.g) * noiseStrength;
				#endif
				float audioLinkHeight = 0, frequencyPosition = 0, bandAssignment = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable)
				{
					if (2.0 == 0)
					{
						float waveformX = frac(randomU + randomV) * 128.0;
						frequencyPosition = waveformX / 128.0;
						float4 waveformData = AudioLinkLerpMultiline(float2(waveformX, 6));
						float audioLinkSample = waveformData.r;
						float4 waveformDataNext = AudioLinkLerpMultiline(float2(waveformX + 1, 6));
						audioLinkSample = lerp(audioLinkSample, waveformDataNext.r, 0.2);
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 1)
					{
						float dftX = frac(randomU + randomV) * 128.0;
						frequencyPosition = dftX / 128.0;
						float4 dftData = AudioLinkLerpMultiline(float2(dftX, 4));
						float audioLinkSample = dftData.r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 2)
					{
						int band = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 3)
					{
						int filteredBand = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = filteredBand / 3.0;
						float filteredX = frac(randomU + randomV) * 16.0;
						frequencyPosition = filteredX / 16.0;
						float audioLinkSample = AudioLinkLerp(float2(filteredX, 28 + filteredBand)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 4)
					{
						float autocorrX = frac(randomU + randomV) * 128.0;
						frequencyPosition = autocorrX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(autocorrX, 27)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 >= 5 && 2.0 <= 8)
					{
						int band = 2.0 - 5;
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					if (0.0 == 1)
					{
						float audioLinkNoise;
						if (1.0 == 5)
						{
							audioLinkNoise = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						}
						else
						{
							int noiseBand = clamp(1.0, 0, 4);
							audioLinkNoise = AudioLinkLerp(float2(0, noiseBand)).r;
						}
						float noiseMultiplier = evalRamp4(audioLinkNoise, float4(1,1,0,1));
						noiseOffset *= noiseMultiplier;
					}
				}
				#endif
				particle.position = floatPos + noiseOffset +moveDir * audioLinkHeight;
				particle.noiseOffset = noiseOffset;
				particle.moveDir = moveDir;
				particle.motionVelocity = motionVelocity;
				particle.rotationSpeed = lerp(float4(-3,3,-20,20).x, float4(-3,3,-20,20).y, rand1.z);
				particle.audioRotationOffset = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 0.0)
				{
					if (0.0 == 5)
					{
						float normalizedAudioHeight = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						particle.audioRotationOffset = normalizedAudioHeight * 2.0 * 360;
					}
					else
					{
						int rotationBand = clamp(0.0, 0, 4);
						particle.audioRotationOffset = AudioLinkGetChronoTime(0.0, rotationBand) * 2.0 * 360;
					}
				}
				#endif
				particle.size = lerp(float4(1.5,2,0.01,100).x, float4(1.5,2,0.01,100).y, rand3.y) * CM_TO_M;
				particle.size *= evalRamp4(saturate(progress), float4(1,1,0,1));
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 1.0)
				{
					float audioLinkSize;
					if (0.0 == 5)
					{
						audioLinkSize = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
					}
					else
					{
						int sizeBand = clamp(0.0, 0, 4);
						audioLinkSize = AudioLinkLerp(float2(0, sizeBand)).r;
					}
					float sizeAdd = evalRamp4(audioLinkSize, float4(0,0,0,1)) * CM_TO_M;
					particle.size = max(0.0001, particle.size + sizeAdd);
				}
				#endif
				particle.progress = progress;
				particle.audioHeight = audioLinkHeight;
				if (2.0 <= 1)
				{
					particle.audioPosition = frequencyPosition;
				}
				else
				{
					particle.audioPosition = bandAssignment;
				}
				particle.particleSeed = seedBase;
				return particle;
			}
			inline void AppendParticleVertex(VertexOut output, float3 worldPosition, float2 quadUV, float2 triCenterUV, int outSet, float3 normalVector, float3 tangentVector, float handedness, float3 camPos, inout TriangleStream<VertexOut> triStream)
			{
				output.worldPos = float4(worldPosition, 1);
				output.localPos = mul(unity_WorldToObject, float4(worldPosition, 1));
				output.pos = PoiWorldToClipPos(worldPosition);
				output.fogData.x = output.pos.z;
				#ifdef FOG_EXP2
				output.fogData.y = 1;
				#else
				output.fogData.y = 0;
				#endif
				POI_TRANSFER_SHADOW(output, output.uv[0].xy);
				output.normal = normalVector;
				output.tangent.xyz = tangentVector;
				output.tangent.w = handedness;
				output.uv[0] = float4(quadUV, quadUV);
				output.uv[1] = float4(quadUV, quadUV);
				if (outSet == 0)
				{
					output.uv[0].xy = triCenterUV;
				}
				else if (outSet == 1)
				{
					output.uv[0].zw = triCenterUV;
				}
				else if (outSet == 2)
				{
					output.uv[1].xy = triCenterUV;
				}
				else if (outSet == 3)
				{
					output.uv[1].zw = triCenterUV;
				}
				triStream.Append(output);
			}
			void RenderParticle(ParticleData particle, VertexOut input[3], inout TriangleStream<VertexOut> triStream)
			{
				float3 camPos = getCameraPosition();
				float3 toCamera = normalize(camPos - particle.position + float3(1e-6, 0, 0));
				float theta = atan2(toCamera.z, toCamera.x);
				float phi = asin(toCamera.y);
				float cosTheta, sinTheta, cosPhi, sinPhi;
				sincos(theta, sinTheta, cosTheta);
				sincos(phi, sinPhi, cosPhi);
				float3 camRight = float3(-sinTheta, 0, cosTheta);
				float3 camUp = float3(-sinPhi * cosTheta, cosPhi, -sinPhi * sinTheta);
				float3 billboardNormal = normalize(camPos - particle.position);
				float3 normalVector = normalize(lerp(billboardNormal, particle.spawnNormal, 0.0));
				float3 tangentVector = normalize(camRight - dot(camRight, normalVector) * normalVector);
				float3 bitangentVector = normalize(cross(normalVector, tangentVector));
				float3 camFacing = normalVector;
				float faceBlend = 0.0;
				float alignAngle = 0;
				if (faceBlend > 0.0001)
				{
					float3 baseMotionDir = particle.moveDir;
					float effectiveProgress = particle.progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(particle.progress * UNITY_PI);
					}
					float rampAtP = evalRamp4(saturate(effectiveProgress), float4(0,1,0,1));
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					baseMotionDir = poiSlerpUnitStable(triNormal, baseMotionDir, saturate(rampAtP));
					float2 dir2 = normalize(float2(dot(baseMotionDir, camRight), dot(baseMotionDir, camUp)) + 1e-6);
					alignAngle = atan2(dir2.y, dir2.x);
					if (0.0 == 2) // Ping Pong
					{
						if (particle.motionVelocity < - 0.001)
						{
							alignAngle += UNITY_PI;
						}
					}
					else if (particle.motionVelocity < - 0.001) // Other modes
					{
						alignAngle += UNITY_PI;
					}
				}
				float baseAngle = _Time.y * particle.rotationSpeed + radians(particle.audioRotationOffset);
				float finalAngle = baseAngle + alignAngle * faceBlend;
				float sinAngle, cosAngle;
				sincos(finalAngle, sinAngle, cosAngle);
				float2x2 rotMatrix = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
				float handedness = 1;
				if (dot(cross(tangentVector, bitangentVector), normalVector) < 0)
				{
					handedness = -1;
				}
				float halfSize = particle.size * 0.5f;
				VertexOut outputVertex = input[0];
				#ifdef POI_AUDIOLINK
				float normalizedAudioHeight = saturate(particle.audioHeight / max(1.0 * CM_TO_M, 0.001));
				#else
				float normalizedAudioHeight = 0;
				#endif
				float packedAudio = floor(normalizedAudioHeight * 65535.0) * 65536.0 + floor(particle.audioPosition * 65535.0);
				outputVertex.particleData = float3(-particle.progress - 1.0, packedAudio, poiRand(particle.particleSeed));
				float2 corner0 = mul(rotMatrix, float2(-1, -1) * halfSize);
				float2 corner1 = mul(rotMatrix, float2(1, -1) * halfSize);
				float2 corner2 = mul(rotMatrix, float2(-1, 1) * halfSize);
				float2 corner3 = mul(rotMatrix, float2(1, 1) * halfSize);
				float2 particleSpawnUV = particle.spawnUV;
				float3 worldPos;
				worldPos = particle.position + camRight * corner0.x + camUp * corner0.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner3.x + camUp * corner3.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
			}
			[maxvertexcount(21)]
			void geom(triangle VertexOut input[3], inout TriangleStream<VertexOut> triStream, uint primID : SV_PrimitiveID)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[0]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[1]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[2]);
				if (1.0)
				{
					[unroll]
					for (int vertexIndex = 0; vertexIndex < 3; vertexIndex++)
					{
						VertexOut vertex = input[vertexIndex];
						vertex.particleData = float3(0, 0, 0);
						triStream.Append(vertex);
					}
					triStream.RestartStrip();
				}
				if (0.15 <= 0)
				{
					return;
				}
				float3 v0_world = input[0].worldPos.xyz;
				float3 v1_world = input[1].worldPos.xyz;
				float3 v2_world = input[2].worldPos.xyz;
				float triangleArea = length(cross(v1_world - v0_world, v2_world - v0_world)) * 0.5;
				if (0.0 >= 1 && 0.0 > 0.0)
				{
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					float3 safeWorldDir = float4(0,1,0,0).xyz;
					float lenW = length(safeWorldDir);
					safeWorldDir = (lenW > 1e-4) ? (safeWorldDir / lenW) : float3(0, 1, 0);
					if (dot(triNormal, safeWorldDir) * .5 + .5 < 0.0)
					{
						return;
					}
				}
				float distanceToCamera = length(getCameraPosition() - (v0_world + v1_world + v2_world) / 3.0);
				float desiredCount = (triangleArea * CM2_TO_M2) * 0.15;
				if (0.0 > 0)
				{
					desiredCount *= ((input[0].vertexColor + input[1].vertexColor + input[2].vertexColor) / 3.0)[0.0 - 1];
				}
				#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
				float4 avgUV = (input[0].uv[0.0 / 2] + input[1].uv[0.0 / 2] + input[2].uv[0.0 / 2]) / 3.0;
				float2 maskUV;
				if (0.0 % 2 == 0)
				{
					maskUV = avgUV.xy;
				}
				else
				{
					maskUV = avgUV.zw;
				}
				maskUV = maskUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw + _Time.y * float4(0,0,0,0);
				float maskValue = _ParticleSpawnMask.SampleLevel(sampler_linear_repeat, maskUV, 0)[0.0];
				if (0.0)
				{
					desiredCount *= 1.0 - maskValue;
				}
				else
				{
					desiredCount *= maskValue;
				}
				#endif
				if (1.0)
				{
					float distanceInterpolation = saturate((distanceToCamera - float4(3,8,0,0).x) / (float4(3,8,0,0).y - float4(3,8,0,0).x));
					desiredCount *= lerp(float4(1,0,0,0).x, float4(1,0,0,0).y, distanceInterpolation);
				}
				int finalSpawnCount = min(floor(desiredCount + poiRand(float2(primID, primID) + 0.069)), MAX_PARTICLES_PER_TRIANGLE);
				if (finalSpawnCount == 0)
				{
					return;
				}
				float3 normal = normalize(input[0].normal + input[1].normal + input[2].normal);
				float4 avgTangent = (input[0].tangent + input[1].tangent + input[2].tangent) / 3.0;
				float3 tangent;
				if (length(avgTangent.xyz) > 0.0001)
				{
					tangent = normalize(avgTangent.xyz);
				}
				else
				{
					tangent = float3(1, 0, 0);
				}
				float3 bitangent = cross(normal, tangent) * avgTangent.w;
				#ifdef POI_AUDIOLINK
				bool audioLinkAvailable = AudioLinkIsAvailable();
				#else
				bool audioLinkAvailable = false;
				#endif
				[unroll(3)]
				for (int i = 0; i < finalSpawnCount && i < 3; ++i)
				{
					int spawnUvSet = (int)clamp(0.0, 0, 3);
					float4 uvA4 = input[0].uv[spawnUvSet / 2];
					float4 uvB4 = input[1].uv[spawnUvSet / 2];
					float4 uvC4 = input[2].uv[spawnUvSet / 2];
					float2 uvA = (spawnUvSet % 2 == 0) ? uvA4.xy : uvA4.zw;
					float2 uvB = (spawnUvSet % 2 == 0) ? uvB4.xy : uvB4.zw;
					float2 uvC = (spawnUvSet % 2 == 0) ? uvC4.xy : uvC4.zw;
					ParticleData p = GenerateParticle(i, primID, v0_world, v1_world, v2_world, input[0].normal, input[1].normal, input[2].normal, tangent, bitangent, uvA, uvB, uvC, audioLinkAvailable);
					RenderParticle(p, input, triStream);
				}
			}
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			#define POI2D_SAMPLER_STOCHASTIC(tex, texSampler, uv, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, uv) : POI2D_SAMPLER(tex, texSampler, uv))
			#define POI2D_SAMPLER_PAN_STOCHASTIC(tex, texSampler, uv, pan, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan)) : POI2D_SAMPLER_PAN(tex, texSampler, uv, pan))
			#define POI2D_SAMPLER_PANGRAD_STOCHASTIC(tex, texSampler, uv, pan, dx, dy, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan), dx, dy) : POI2D_SAMPLER_PANGRAD(tex, texSampler, uv, pan, dx, dy))
			#endif
			#if !defined(_STOCHASTICMODE_NONE)
			float2 StochasticHash2D2D(float2 s)
			{
				return frac(sin(glsl_mod(float2(dot(s, float2(127.1, 311.7)), dot(s, float2(269.5, 183.3))), 3.14159)) * 43758.5453);
			}
			#endif
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			float3x3 DeliotHeitzStochasticUVBW(float2 uv)
			{
				const float2x2 stochasticSkewedGrid = float2x2(1.0, -0.57735027, 0.0, 1.15470054);
				float2 skewUV = mul(stochasticSkewedGrid, uv * 3.4641 * 1.0);
				float2 vxID = floor(skewUV);
				float3 bary = float3(frac(skewUV), 0);
				bary.z = 1.0 - bary.x - bary.y;
				float3x3 pos = float3x3(
				float3(vxID, bary.z),
				float3(vxID + float2(0, 1), bary.y),
				float3(vxID + float2(1, 0), bary.x)
				);
				float3x3 neg = float3x3(
				float3(vxID + float2(1, 1), -bary.z),
				float3(vxID + float2(1, 0), 1.0 - bary.y),
				float3(vxID + float2(0, 1), 1.0 - bary.x)
				);
				return (bary.z > 0) ? pos : neg;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv, float2 dx, float2 dy)
			{
				float3x3 UVBW = DeliotHeitzStochasticUVBW(uv);
				return mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[0].xy), dx, dy), UVBW[0].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[1].xy), dx, dy), UVBW[1].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[2].xy), dx, dy), UVBW[2].z) ;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv)
			{
				float2 dx = ddx(uv), dy = ddy(uv);
				return DeliotHeitzSampleTexture(tex, texSampler, uv, dx, dy);
			}
			#endif // defined(_STOCHASTICMODE_DELIOT_HEITZ)
			void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiMods poiMods)
			{
				poiFragData.alpha = saturate(poiFragData.alpha + 0.0);
				if (0.0 > 0)
				{
					poiFragData.alpha = maskBlend(poiFragData.alpha, poiMods.globalMask[0.0 - 1], 2.0);
				}
			}
			void poiGeoParticle(VertexOut i, inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
				if (i.particleData.x < 0)
				{
					float progress = -i.particleData.x - 1.0;
					float packedAudio = i.particleData.y;
					float audioLinkHeight = floor(packedAudio / 65536.0) / 65535.0;
					float audioPosition = fmod(packedAudio, 65536.0) / 65535.0;
					float particleSeed = i.particleData.z;
					float frameIndex = 0;
					if (0.0)
					{
						float totalFrames = (0.0 > 0) ? 0.0 : (1.0 * 1.0);
						if (0.0 == 0)
						{
							frameIndex = floor(particleSeed * totalFrames);
						}
						else if (0.0 == 1)
						{
							frameIndex = floor(progress * totalFrames);
						}
						else if (0.0 == 2)
						{
							float timeOffset = 0;
							if (0.0)
							{
								timeOffset = particleSeed * totalFrames;
							}
							frameIndex = floor(fmod(_Time.y * 10.0 + timeOffset, totalFrames));
						}
						#ifdef POI_AUDIOLINK
						if (AudioLinkIsAvailable() && 0.0)
						{
							int spriteBand = clamp(0.0, 0, 3);
							frameIndex = floor(poiMods.audioLink[spriteBand] * totalFrames);
						}
						#endif
						frameIndex = clamp(frameIndex, 0, totalFrames - 1);
					}
					#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
					float3 lifetimeColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(progress, 0.5), 0).rgb;
					#else
					float3 lifetimeColor = float3(1, 1, 1);
					#endif
					float4 randFrag = poiRand4(float2(particleSeed, particleSeed * 1.37));
					float2 alphaRange = float4(1,1,0,0).xy;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable() && 0.0)
					{
						float alphaValue;
						if (0.0 == 5)
						{
							alphaValue = audioLinkHeight;
						}
						else
						{
							int alphaBand = clamp(0.0, 0, 4);
							alphaValue = poiMods.audioLink[alphaBand];
						}
						float alphaAdd = evalRamp4(alphaValue, float4(0,0,0,1));
						alphaRange = saturate(alphaRange + alphaAdd);
					}
					#endif
					float lifetimeAlpha = lerp(alphaRange.x, alphaRange.y, randFrag.y);
					float3 finalColor = float3(1, 1, 1);
					float finalAlpha = 1;
					float emissionBoost = 0;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable())
					{
						#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
						if (2.0 != 2)
						{
							float gradientSample = progress;
							if (2.0 == 0)
							gradientSample = audioPosition;
							else if (2.0 == 1)
							gradientSample = audioLinkHeight;
							float4 alGradientColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(gradientSample, 0.5), 0);
							lifetimeColor = alGradientColor.rgb;
						}
						#endif
						if (1.0)
						{
							float emissionValue;
							if (0.0 == 5)
							{
								emissionValue = audioLinkHeight;
							}
							else
							{
								int emissionBand = clamp(0.0, 0, 4);
								emissionValue = poiMods.audioLink[emissionBand];
							}
							emissionBoost += evalRamp4(emissionValue, float4(0,0,0,1));
						}
					}
					#endif
					#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
					float2 lookupUV = poiMesh.uv[0].xy;
					if (0.0)
					{
						float invCols = 1.0 / 1.0;
						float invRows = 1.0 / 1.0;
						float2 frameSize = float2(invCols, invRows);
						float column = fmod(frameIndex, 1.0);
						float row = floor(frameIndex * invCols);
						row = 1.0 - 1 - row;
						lookupUV = (lookupUV * frameSize) + float2(column, row) * frameSize;
						if (0.0 > 0)
						{
							float2 texelInset = (0.0) * frameSize / max(float4(1,1,0,0).xy, 1e-6);
							lookupUV = lerp(lookupUV, (float2(column + 1, row + 1) * frameSize), texelInset);
						}
					}
					lookupUV = lookupUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw;
					float4 particleTex = _ParticleTexture.SampleLevel(sampler_linear_repeat, lookupUV, 0);
					finalColor = particleTex.rgb * lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = particleTex.a * lifetimeAlpha * float4(1,1,1,1).a;
					#else
					finalColor = lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = lifetimeAlpha * float4(1,1,1,1).a;
					#endif
					finalAlpha *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 originalColor = poiFragData.baseColor;
					float3 originalEmission = poiFragData.emission;
					poiFragData.baseColor = customBlend(originalColor, finalColor, 0.0, 1.0);
					poiFragData.alpha *= saturate(finalAlpha);
					float emissStrength = lerp(float4(0,0,0,0).x, float4(0,0,0,0).y, randFrag.x) + emissionBoost;
					emissStrength *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 particleEmission = finalColor * emissStrength;
					if (0.0 == 0)
					{
						poiFragData.emission = particleEmission;
					}
					else
					{
						poiFragData.emission = originalEmission + particleEmission;
					}
				}
			}
			void ApplyGlobalMaskModifiers(in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
			}
			float2 calculatePolarCoordinate(in PoiMesh poiMesh)
			{
				float2 delta = poiMesh.uv[0.0] - float4(0.5,0.5,0,0);
				float radius = length(delta) * 2 * 1.0;
				float angle = atan2(delta.x, delta.y);
				float phi = angle / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				angle = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				angle *= 1.0;
				return float2(radius, angle + distance(poiMesh.uv[0.0], float4(0.5,0.5,0,0)) * 0.0);
			}
			float2 MonoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(1.0, 1.0 / UNITY_PI);
				return float2(1.0, 1.0) - sphereCoords;
			}
			float2 StereoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(0.5, 1.0 / UNITY_PI);
				sphereCoords = float2(0.5, 1.0) - sphereCoords;
				return (sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
			}
			float2 calculateWorldUV(in PoiMesh poiMesh)
			{
				return float2(0.0 != 3 ? poiMesh.worldPos[ 0.0] : 0.0f, 2.0 != 3 ? poiMesh.worldPos[2.0] : 0.0f);
			}
			float2 calculatelocalUV(in PoiMesh poiMesh)
			{
				float localUVs[8];
				localUVs[0] = poiMesh.localPos.x;
				localUVs[1] = poiMesh.localPos.y;
				localUVs[2] = poiMesh.localPos.z;
				localUVs[3] = 0;
				localUVs[4] = poiMesh.vertexColor.r;
				localUVs[5] = poiMesh.vertexColor.g;
				localUVs[6] = poiMesh.vertexColor.b;
				localUVs[7] = poiMesh.vertexColor.a;
				return float2(localUVs[0.0],localUVs[1.0]);
			}
			float2 calculatePanosphereUV(in PoiMesh poiMesh)
			{
				float3 viewDirection = normalize(lerp(getCameraPosition().xyz, _WorldSpaceCameraPos.xyz, 1.0) - poiMesh.worldPos.xyz) * - 1;
				return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), 0.0);
			}
			float4 frag(VertexOut i, uint facing : SV_IsFrontFace) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				PoiSHAr = unity_SHAr;
				PoiSHAg = unity_SHAg;
				PoiSHAb = unity_SHAb;
				PoiSHBr = unity_SHBr;
				PoiSHBg = unity_SHBg;
				PoiSHBb = unity_SHBb;
				PoiSHC =  unity_SHC;
				PoiMesh poiMesh;
				PoiInitStruct(PoiMesh, poiMesh);
				PoiLight poiLight;
				PoiInitStruct(PoiLight, poiLight);
				PoiCam poiCam;
				PoiInitStruct(PoiCam, poiCam);
				PoiMods poiMods;
				PoiInitStruct(PoiMods, poiMods);
				#if POI_PIPE == POI_URP
				PoiLightOut poiLightOut;
				PoiInitStruct(PoiLightOut, poiLightOut);
				#endif
				poiMods.globalEmission = 1;
				PoiFragData poiFragData;
				poiFragData.smoothness = 1;
				poiFragData.smoothness2 = 1;
				poiFragData.metallic = 1;
				poiFragData.specularMask = 1;
				poiFragData.reflectionMask = 1;
				poiFragData.emission = 0;
				poiFragData.baseColor = float3(0, 0, 0);
				poiFragData.finalColor = float3(0, 0, 0);
				poiFragData.alpha = 1;
				poiFragData.toggleVertexLights = 0;
				#ifdef POI_UDIMDISCARD
				applyUDIMDiscard(i, facing);
				#endif
				poiMesh.objectPosition = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
				poiMesh.objNormal = mul((float3x3)unity_WorldToObject, i.normal);
				poiMesh.normals[0] = i.normal;
				poiMesh.tangent[0] = i.tangent.xyz;
				poiMesh.binormal[0] = cross(i.normal, i.tangent.xyz) * (i.tangent.w * unity_WorldTransformParams.w);
				poiMesh.worldPos = i.worldPos.xyz;
				poiMesh.localPos = i.localPos.xyz;
				poiMesh.vertexColor = i.vertexColor;
				poiMesh.isFrontFace = facing;
				poiMesh.dx = ddx(poiMesh.uv[0]);
				poiMesh.dy = ddy(poiMesh.uv[0]);
				poiMesh.isRightHand = i.tangent.w > 0.0;
				#ifndef POI_PASS_OUTLINE
				if (!poiMesh.isFrontFace && 1)
				{
					poiMesh.normals[0] *= -1;
					poiMesh.tangent[0] *= -1;
					poiMesh.binormal[0] *= -1;
				}
				#endif
				poiCam.viewDir = !IsOrthographicCamera() ?
				#if defined(USING_STEREO_MATRICES)
				normalize((unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5 - i.worldPos.xyz) :
				#else
				normalize(_WorldSpaceCameraPos - i.worldPos.xyz) :
				#endif
				normalize(UNITY_MATRIX_I_V._m02_m12_m22);
				float3 tanToWorld0 = float3(poiMesh.tangent[0].x, poiMesh.binormal[0].x, poiMesh.normals[0].x);
				float3 tanToWorld1 = float3(poiMesh.tangent[0].y, poiMesh.binormal[0].y, poiMesh.normals[0].y);
				float3 tanToWorld2 = float3(poiMesh.tangent[0].z, poiMesh.binormal[0].z, poiMesh.normals[0].z);
				float3 ase_tanViewDir = tanToWorld0 * poiCam.viewDir.x + tanToWorld1 * poiCam.viewDir.y + tanToWorld2 * poiCam.viewDir.z;
				poiCam.tangentViewDir = normalize(ase_tanViewDir);
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
				poiMesh.lightmapUV = i.lightmapUV;
				#endif
				poiMesh.parallaxUV = poiCam.tangentViewDir.xy / max(poiCam.tangentViewDir.z, 0.0001);
				poiMesh.uv[0] = i.uv[0].xy;
				poiMesh.uv[1] = i.uv[0].zw;
				poiMesh.uv[2] = i.uv[1].xy;
				poiMesh.uv[3] = i.uv[1].zw;
				poiMesh.uv[4] = poiMesh.uv[0];
				poiMesh.uv[5] = poiMesh.uv[0];
				poiMesh.uv[6] = poiMesh.uv[0];
				poiMesh.uv[7] = poiMesh.uv[0];
				poiMesh.uv[8] = poiMesh.uv[0];
				poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
				poiMesh.uv[5] = calculateWorldUV(poiMesh);
				poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
				poiMesh.uv[8] = calculatelocalUV(poiMesh);
				float3 worldViewUp = normalize(float3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, float3(0, 1, 0)));
				float3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
				poiMesh.uv[9] = float2(dot(worldViewRight, poiMesh.normals[0]), dot(worldViewUp, poiMesh.normals[0])) * 0.5 + 0.5;
				poiMods.globalMask[0] = 1;
				poiMods.globalMask[1] = 1;
				poiMods.globalMask[2] = 1;
				poiMods.globalMask[3] = 1;
				poiMods.globalMask[4] = 1;
				poiMods.globalMask[5] = 1;
				poiMods.globalMask[6] = 1;
				poiMods.globalMask[7] = 1;
				poiMods.globalMask[8] = 1;
				poiMods.globalMask[9] = 1;
				poiMods.globalMask[10] = 1;
				poiMods.globalMask[11] = 1;
				poiMods.globalMask[12] = 1;
				poiMods.globalMask[13] = 1;
				poiMods.globalMask[14] = 1;
				poiMods.globalMask[15] = 1;
				ApplyGlobalMaskModifiers(poiMesh, poiMods, poiCam);
				#if POI_PIPE == POI_URP
				InputData inputData;
				PoiInitStruct(InputData, inputData);
				inputData.positionWS = poiMesh.worldPos;
				inputData.normalWS = poiMesh.normals[1];
				inputData.viewDirectionWS = poiCam.viewDir;
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(i.pos);
				#endif
				float2 mainUV = poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0));
				if (0.0)
				{
					mainUV = sharpSample(float4(0.03125,0.03125,32,32), mainUV);
				}
				float4 mainTexture = POI2D_SAMPLER_PAN_STOCHASTIC(_MainTex, _MainTex, mainUV, float4(0,0,0,0), 0.0);
				mainTexture.a = max(mainTexture.a, 0.0);
				#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
				poiMesh.tangentSpaceNormal = PoiUnpackNormalScale(POI2D_SAMPLER_PAN_STOCHASTIC(_BumpMap, _MainTex, poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0)), float4(0,0,0,0), 0.0), 1.0);
				#else
				poiMesh.tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				#endif
				float3 tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				poiMesh.normals[0] = normalize(
				tangentSpaceNormal.x * poiMesh.tangent[0] +
				tangentSpaceNormal.y * poiMesh.binormal[0] +
				tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.normals[1] = normalize(
				poiMesh.tangentSpaceNormal.x * poiMesh.tangent[0] +
				poiMesh.tangentSpaceNormal.y * poiMesh.binormal[0] +
				poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.tangent[1] = cross(poiMesh.binormal[0], -poiMesh.normals[1]);
				poiMesh.binormal[1] = cross(-poiMesh.normals[1], poiMesh.tangent[0]);
				poiCam.forwardDir = getCameraForward();
				#if defined(USING_STEREO_MATRICES)
				poiCam.worldPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
				#else
				poiCam.worldPos = _WorldSpaceCameraPos;
				#endif
				poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
				poiCam.vertexReflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[0]);
				poiCam.clipPos = i.pos;
				poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
				poiCam.posScreenSpace = poiTransformClipSpacetoScreenSpaceFrag(poiCam.clipPos);
				#ifdef UNITY_SINGLE_PASS_STEREO
				poiCam.posScreenSpace.x = poiCam.posScreenSpace.x * 0.5;
				#endif
				poiCam.screenUV = poiCam.posScreenSpace.xy / poiCam.posScreenSpace.w;
				poiCam.posScreenPixels = calcPixelScreenUVs(poiCam.posScreenSpace);
				poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
				poiCam.worldDirection.xyz = poiMesh.worldPos.xyz - poiCam.worldPos;
				poiCam.worldDirection.w = dot(i.pos, CalculateFrustumCorrection());
				poiFragData.baseColor = mainTexture.rgb;
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.baseColor *= poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
				poiFragData.alpha = mainTexture.a * float4(1,1,1,1).a;
				#else
				if(_TwoPassOverrideFirstPassColor)
				{
					poiFragData.baseColor *= poiThemeColor(poiMods, _TwoPassColor.rgb, _TwoPassColorThemeIndex);
					poiFragData.alpha = mainTexture.a * _TwoPassColor.a;
				}
				#endif
				if (2.0)
				{
					#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
					float alphaMask = POI2D_SAMPLER_PAN(_AlphaMask, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0).xy).r;
					#else
					float alphaMask = 1;
					#endif
					alphaMask = saturate(alphaMask * 1.0 + (0.0 ? 0.0 * - 1 : 0.0));
					if (0.0) alphaMask = 1 - alphaMask;
					if (2.0 == 1) poiFragData.alpha = alphaMask;
					if (2.0 == 2) poiFragData.alpha = poiFragData.alpha * alphaMask;
					if (2.0 == 3) poiFragData.alpha = saturate(poiFragData.alpha + alphaMask);
					if (2.0 == 4) poiFragData.alpha = saturate(poiFragData.alpha - alphaMask);
				}
				applyAlphaOptions(poiFragData, poiMesh, poiCam, poiMods);
				if (0.0 > 0)
				{
					applyToGlobalMask(poiMods, 0.0 - 1, 0.0, i.particleData.x < 0 ? 1.0 : 0.0);
				}
				if (i.particleData.x < 0)
				{
					poiFragData.baseColor = lerp(poiFragData.baseColor, float4(1,1,1,1), 1.0);
				}
				poiGeoParticle(i, poiFragData, poiMesh, poiMods, poiCam);
				poiFragData.finalColor = poiFragData.baseColor;
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.alpha = 0.0 ? 1 : poiFragData.alpha;
				#else
				poiFragData.alpha = _AlphaForceOpaque2 ? 1 : poiFragData.alpha;
				#endif
				if (2.0 == POI_MODE_OPAQUE)
				{
					poiFragData.alpha = 1;
				}
				clip(poiFragData.alpha - 0.0);
				applyUnityFog(poiFragData.finalColor, i.fogData);
				return float4(poiFragData.finalColor, poiFragData.alpha) + POI_SAFE_RGB0;
			}
			ENDHLSL
		}
		Pass
		{
			Name "DepthOnly"
			Tags { "LightMode" = "DepthOnly" }
			Stencil
			{
				Ref [_StencilRef]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilCompareFunction]
				Pass [_StencilPassOp]
				Fail [_StencilFailOp]
				ZFail [_StencilZFailOp]
			}
			ZWrite [_ZWrite]
			Cull Off
			AlphaToMask Off
			ZTest [_ZTest]
			Offset [_OffsetFactor], [_OffsetUnits]
			BlendOp [_BlendOp], [_BlendOpAlpha]
			Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
			HLSLPROGRAM
 #define _STOCHASTICMODE_DELIOT_HEITZ 
 #define OPTIMIZER_ENABLED 
			#pragma target 5.0
			#define POI_PASS_DEPTH_ONLY
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#if POI_PIPE == POI_URP
			#define FOG_LINEAR 0
			#define FOG_EXP 0
			#define FOG_EXP2 0
			#endif
			#pragma multi_compile_instancing
			#pragma skip_variants DECALS_OFF DECALS_3RT DECALS_4RT DECAL_SURFACE_GRADIENT _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3 _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH _DECAL_LAYERS
			#pragma skip_variants _MAIN_LIGHT_SHADOWS_SCREEN _SCREEN_SPACE_OCCLUSION _USE_FAST_SRGB_LINEAR_CONVERSION _LIGHT_LAYERS
			#if !defined(POI_WORLD)
			#pragma skip_variants _ADDITIONAL_LIGHT_SHADOWS _ADDITIONAL_LIGHTS_VERTEX LIGHTMAP_ON DYNAMICLIGHTMAP_ON LIGHTMAP_SHADOW_MIXING SHADOWS_SHADOWMASK DIRLIGHTMAP_COMBINED _MIXED_LIGHTING_SUBTRACTIVE
			#endif
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag
			CBUFFER_START(UnityPerMaterial)
			float _GrabMode;
			float _Mode;
			#ifndef _STOCHASTICMODE_NONE
			#ifdef _STOCHASTICMODE_DELIOT_HEITZ
			float _StochasticDeliotHeitzDensity;
			#endif
			#endif
			float4 _Color;
			float _ColorThemeIndex;
			float _MainPixelMode;
			float4 _MainTex_ST;
			float4 _MainTex_TexelSize;
			float2 _MainTexPan;
			float _MainTexUV;
			float _MainTexStochastic;
			float _MainIgnoreTexAlpha;
			float4 _BumpMap_ST;
			float2 _BumpMapPan;
			float _BumpMapUV;
			float _BumpScale;
			float _BumpMapStochastic;
			float4 _AlphaMask_ST;
			float2 _AlphaMaskPan;
			float _AlphaMaskUV;
			float _AlphaMaskInvert;
			float _MainAlphaMaskMode;
			float _AlphaMaskBlendStrength;
			float _AlphaMaskValue;
			float _Cutoff;
			float _AlphaForceOpaque;
			float _AlphaMod;
			float _AlphaPremultiply;
			float _AlphaBoostFA;
			float _AlphaGlobalMask;
			float _AlphaGlobalMaskBlendType;
			float _ParticleRandomSeedOffset;
			float _ParticleApplyGlobalMaskIndex;
			float _ParticleApplyGlobalMaskBlendType;
			float4 _ParticleBaseColorOverride;
			float _ParticleOverrideBaseColor;
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleSpawnMask_ST;
			float2 _ParticleSpawnMaskPan;
			float _ParticleSpawnMaskUV;
			float _ParticleSpawnMaskChannel;
			float _ParticleSpawnMaskInvert;
			#endif
			float _ParticleSpawnMaskVertexColor;
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleTexture_ST;
			float2 _ParticleTexturePan;
			float _ParticleTextureUV;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleNoiseTex_ST;
			float2 _ParticleNoiseTexPan;
			float _ParticleNoiseTexUV;
			#endif
			float4 _ParticleSizeRamp;
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleLifetimeGradient_ST;
			#endif
			float4 _ParticleAlphaRamp;
			float4 _ParticleEmissionRamp;
			float _ParticleColorBlendMode;
			float _ParticleColorBlendAlpha;
			float _ParticleEmissionBlendMode;
			float4 _ParticleColor;
			float _ParticleColorThemeIndex;
			float4 _ParticleEmissionStrength;
			float4 _ParticleAlpha;
			float _ParticleSpriteSheetEnabled;
			float _ParticleSpriteSheetColumns;
			float _ParticleSpriteSheetRows;
			float _ParticleSpriteSheetFrameSelection;
			float _ParticleSpriteSheetFPS;
			float _ParticleSpriteSheetRandomStart;
			float _ParticleSpriteSheetTotalFrames;
			float _ParticleSpriteSheetInset;
			float _ParticleSpriteSheetFrameBias;
			float _ParticleRenderBaseMesh;
			float _ParticleDensity;
			float4 _ParticleSize;
			float4 _ParticleFloatDistance;
			float4 _ParticleNoiseStrength;
			float4 _ParticleNoiseScrollSpeed;
			float4 _ParticleRotationSpeed;
			float _ParticleMotionMode;
			float4 _ParticleTravelDistance;
			float _ParticleCycleDuration;
			float _ParticleSpawnReductionEnabled;
			float4 _ParticleSpawnDistances;
			float4 _ParticleSpawnReduction;
			float _ParticlePosUVSource;
			float _ParticlePosUVDestination;
			float4 _ParticleWorldDirection;
			float _ParticleDirectionStrength;
			float _ParticleDirectionStrengthCurve;
			float _ParticleSpawnDirectionCull;
			float4 _ParticleDirectionRamp;
			float _ParticleFaceDirection;
			float _ParticleInheritNormal;
			float _ParticleALType;
			#ifdef POI_AUDIOLINK
			float _ParticleALWaveformScale;
			float _ParticleALWaveformSmoothing;
			float _ParticleALGradientSource;
			float _ParticleALReactiveEmission;
			float _ParticleALReactiveEmissionBand;
			float4 _ParticleALReactiveEmissionRamp;
			float _ParticleALSizeModulation;
			float _ParticleALSizeBand;
			float4 _ParticleALSizeRamp;
			float _ParticleALRotationModulation;
			float _ParticleALRotationBand;
			float _ParticleALRotationType;
			float _ParticleALRotationSpeed;
			float _ParticleALNoiseModulation;
			float _ParticleALNoiseBand;
			float4 _ParticleALNoiseRamp;
			float _ParticleALAlphaModulation;
			float _ParticleALAlphaBand;
			float4 _ParticleALAlphaRamp;
			float _ParticleALSpriteSheetFrameControl;
			float _ParticleALSpriteSheetBand;
			#endif
			int _GlobalMaskVertexColorLinearSpace;
			float _StereoEnabled;
			float _PolarUV;
			float2 _PolarCenter;
			float _PolarRadialScale;
			float _PolarLengthScale;
			float _PolarSpiralPower;
			float _PanoUseBothEyes;
			float _UVModWorldPos0;
			float _UVModWorldPos1;
			float _UVModLocalPos0;
			float _UVModLocalPos1;
			CBUFFER_END
			float _IgnoreFog;
			float _RenderingReduceClipDistance;
			int _FlipBackfaceNormals;
			float _AddBlendOp;
			float _Cull;
			SamplerState point_clamp_sampler;
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			#define STEREO_UV(uv) float3(uv, unity_StereoEyeIndex)
			#else
			#define STEREO_UV(uv) uv
			#endif
			#if POI_PIPE == POI_BIRP
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			Texture2DArray<float> _CameraDepthTexture;
			#else
			Texture2D<float> _CameraDepthTexture;
			#endif
			#endif
			#if POI_PIPE == POI_URP
			TEXTURE2D_X_FLOAT(_CameraDepthTexture);
			float4 _CameraDepthTexture_TexelSize;
			#endif
			float SampleScreenDepth(float2 uv)
			{
				uv.y = _ProjectionParams.x * 0.5 + 0.5 - uv.y * _ProjectionParams.x;
				return _CameraDepthTexture.SampleLevel(point_clamp_sampler, STEREO_UV(uv), 0).r;
			}
			bool DepthTextureExists()
			{
				float3 dTexDim = 0;
				#if POI_PIPE == POI_BIRP
				#ifdef UNITY_STEREO_INSTANCING_ENABLED
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y, dTexDim.z);
				#else
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y);
				#endif
				#endif
				#if POI_PIPE == POI_URP
				dTexDim.xy = _CameraDepthTexture_TexelSize.zw;
				#endif
				return dTexDim.x > 16;
			}
			UNITY_DECLARE_TEX2D(_MainTex);
			#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BumpMap;
			#endif
			#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _AlphaMask;
			#endif
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleSpawnMask;
			#endif
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleTexture;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleNoiseTex;
			#endif
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleLifetimeGradient;
			#endif
			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				#ifdef POI_PASS_MOTION_VECTORS
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
				float3 alembicMotionVector : TEXCOORD5;
				#endif
				#endif
				uint vertexId : SV_VertexID;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct tessellatedAppData
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				uint vertexId : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct VertexOut
			{
				float4 pos : SV_POSITION;
				float4 uv[2] : TEXCOORD0;
				float3 normal : TEXCOORD2;
				float4 tangent : TEXCOORD3;
				float4 worldPos : TEXCOORD4;
				float4 localPos : TEXCOORD5;
				float4 vertexColor : TEXCOORD6;
				float4 lightmapUV : TEXCOORD7;
				float2 fogData: TEXCOORD8;
				POI_SHADOW_COORDS(9)
				#ifdef POI_PASS_MOTION_VECTORS
				float4 positionCSNoJitter         : POSITION_CS_NO_JITTER;
				float4 previousPositionCSNoJitter : PREV_POSITION_CS_NO_JITTER;
				#endif
				nointerpolation float3 particleData : TEXCOORD13;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			float2 vertexUV(in VertexOut o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			float2 vertexUV(in appdata v, int index)
			{
				switch(index)
				{
					case 0:
					return v.uv0.xy;
					case 1:
					return v.uv1.xy;
					case 2:
					return v.uv2.xy;
					case 3:
					return v.uv3.xy;
					default:
					return v.uv0.xy;
				}
			}
			#ifdef POI_PASS_LILFUR
			float2 vertexUV(in PoiGeoToFragLilFur o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			#endif
			#ifdef POI_AUDIOLINK
			inline int poiALBandPass(int bandIdx)
			{
				bandIdx = clamp(bandIdx, 0, 3);
				return bandIdx == 0 ? ALPASS_AUDIOBASS : bandIdx == 1 ? ALPASS_AUDIOLOWMIDS : bandIdx == 2 ? ALPASS_AUDIOHIGHMIDS : ALPASS_AUDIOTREBLE;
			}
			#endif
			void applyReducedRenderClipDistance(inout VertexOut o)
			{
				if (o.pos.w < _ProjectionParams.y * 1.01 && o.pos.w > 0)
				{
					#if defined(UNITY_REVERSED_Z) // DirectX
					o.pos.z = o.pos.z * 0.0001 + o.pos.w * 0.999;
					#else // OpenGL
					o.pos.z = o.pos.z * 0.0001 - o.pos.w * 0.999;
					#endif
				}
			}
			VertexOut vert(appdata v)
			{
				UNITY_SETUP_INSTANCE_ID(v);
				VertexOut o;
				PoiInitStruct(VertexOut, o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				#ifdef POI_TESSELLATED
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v);
				#endif
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				#ifdef POI_PASS_OUTLINE
				if (0.0 > 0.5)
				{
					return (VertexOut)POI_NAN;
				}
				#endif
				#ifdef POI_AUDIOLINK
				float vertexAudioLink[5];
				vertexAudioLink[0] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 0))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 0))[0];
				vertexAudioLink[1] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 1))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 1))[0];
				vertexAudioLink[2] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 2))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 2))[0];
				vertexAudioLink[3] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 3))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 3))[0];
				vertexAudioLink[4] = AudioLinkData(ALPASS_GENERALVU + float2(8, 0))[0];
				#endif
				#if POI_PIPE == POI_BIRP
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.tangent.xyz = UnityObjectToWorldDir(v.tangent);
				#elif  POI_PIPE == POI_URP
				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(v.normal, v.tangent);
				o.normal = vertexNormalInput.normalWS;
				o.tangent.xyz = vertexNormalInput.tangentWS;
				#endif
				o.tangent.w = v.tangent.w;
				o.vertexColor = v.color;
				o.uv[0] = float4(v.uv0.xy, v.uv1.xy);
				o.uv[1] = float4(v.uv2.xy, v.uv3.xy);
				#if defined(LIGHTMAP_ON)
				OUTPUT_LIGHTMAP_UV(v.uv1.xy, unity_LightmapST, o.lightmapUV.xy);
				#endif
				#ifdef DYNAMICLIGHTMAP_ON
				OUTPUT_LIGHTMAP_UV(v.uv2.xy, unity_LightmapST, o.lightmapUV.zw);
				#endif
				o.localPos = v.vertex;
				o.worldPos = mul(unity_ObjectToWorld, o.localPos);
				float3 localOffset = float3(0, 0, 0);
				float3 worldOffset = float3(0, 0, 0);
				o.localPos.rgb += localOffset;
				o.worldPos.rgb += worldOffset;
				o.pos = PoiObjectToClipPos(o.localPos.rgb);
				o.fogData.x = o.pos.z; // This is used for fog calculations, so we need to ensure it's in clip space
				#ifdef FOG_EXP2
				o.fogData.y = 1;
				#else
				o.fogData.y = 0;
				#endif
				#if !defined(POI_PASS_SHADOW)
				POI_TRANSFER_SHADOW(o, o.uv[0].xy);
				#else
				v.vertex.xyz = o.localPos.xyz;
				POI_TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
				#endif
				if (0.0)
				{
					applyReducedRenderClipDistance(o);
				}
				#ifdef POI_PASS_META
				o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
				#endif
				#ifdef POI_PASS_MOTION_VECTORS
				#if defined(APPLICATION_SPACE_WARP_MOTION)
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				o.pos = o.positionCSNoJitter;
				#else
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				#endif
				float4 prevPos = (unity_MotionVectorsParams.x == 1) ? float4(v.positionOld, 1) : o.localPos;
				#if _ADD_PRECOMPUTED_VELOCITY
				prevPos = prevPos - float4(v.alembicMotionVector, 0);
				#endif
				o.previousPositionCSNoJitter = mul(_PrevViewProjMatrix, mul(UNITY_PREV_MATRIX_M, prevPos));
				#endif
				#ifdef POI_PASS_LILFUR
				#endif
				return o;
			}
			#define MAX_PARTICLES_PER_TRIANGLE 3
			#define CM2_TO_M2 10000.0
			#define CM_TO_M 0.01
			#define PARTICLE_VERTICES 4
			struct ParticleData
			{
				float3 position;
				float size;
				float progress;
				float audioHeight;
				float audioPosition;
				float rotationSpeed;
				float audioRotationOffset;
				float2 particleSeed;
				float2 spawnUV;
				float3 spawnNormal;
				float3 noiseOffset;
				float3 moveDir;
				float motionVelocity;
			};
			float3 poiAnyPerpendicular(float3 v)
			{
				float3 a = (abs(v.x) < 0.5) ? float3(1, 0, 0) : float3(0, 1, 0);
				float3 p = cross(v, a);
				return (length(p) > 1e-6) ? normalize(p) : normalize(cross(v, float3(0, 0, 1)));
			}
			float3 poiRotateAroundAxis(float3 v, float3 axis, float angle)
			{
				float s, c; sincos(angle, s, c);
				return v * c + cross(axis, v) * s + axis * dot(axis, v) * (1 - c);
			}
			float3 poiSlerpUnitStable(float3 fromDir, float3 toDir, float t)
			{
				fromDir = normalize(fromDir);
				toDir = normalize(toDir);
				float d = clamp(dot(fromDir, toDir), -1.0, 1.0);
				if (d > 0.999)
				{
					return normalize(lerp(fromDir, toDir, t));
				}
				if (d < - 0.999)
				{
					float3 axis = poiAnyPerpendicular(fromDir);
					return normalize(poiRotateAroundAxis(fromDir, axis, UNITY_PI * t));
				}
				float omega = acos(d);
				float s = sin(omega);
				float w0 = sin((1.0 - t) * omega) / s;
				float w1 = sin(t * omega) / s;
				return normalize(fromDir * w0 + toDir * w1);
			}
			ParticleData GenerateParticle(int particleIndex, uint primID, float3 v0_world, float3 v1_world, float3 v2_world, float3 n0, float3 n1, float3 n2, float3 tangent, float3 bitangent, float2 uvA, float2 uvB, float2 uvC, bool audioLinkAvailable)
			{
				ParticleData particle;
				float2 seedBase = float2((primID + particleIndex) * 0.51, particleIndex * 1.123) + 0.069;
				float randomU = poiRand(seedBase);
				float randomV = poiRand(seedBase.yx);
				if (randomU + randomV > 1.0)
				{
					randomU = 1.0 - randomU; randomV = 1.0 - randomV;
				}
				float3 basePos = v0_world * (1.0 - randomU - randomV) + v1_world * randomU + v2_world * randomV;
				particle.spawnUV = uvA * (1.0 - randomU - randomV) + uvB * randomU + uvC * randomV;
				particle.spawnNormal = normalize(n0 * (1.0 - randomU - randomV) + n1 * randomU + n2 * randomV);
				float3 normal = normalize(n0 + n1 + n2);
				float4 rand1 = float4(poiRand3(seedBase), poiRand(seedBase + 11.0));
				float4 rand2 = float4(poiRand3(seedBase + 1.0), poiRand(seedBase + 12.0));
				float4 rand3 = float4(poiRand3(seedBase + 2.0), poiRand(seedBase + 13.0));
				float progress = frac((_Time.y / 2.0) + rand1.x);
				float3 worldDir = float4(0,1,0,0).xyz;
				float invLen = rsqrt(max(dot(worldDir, worldDir), 1e-8));
				worldDir *= invLen;
				float specificTravelDistance = lerp(float4(50,100,0,1000).x, float4(50,100,0,1000).y, rand1.w) * CM_TO_M;
				float dBW = clamp(dot(normal, worldDir), -1.0, 1.0);
				float angN = acos(dBW) / 3.14159265;
				float effStrength = saturate(0.0 / max(angN, 1e-4));
				float3 moveDir = poiSlerpUnitStable(normal, worldDir, effStrength);
				float motionVelocity = 0;
				if (0.0 >= 1) // Outward or Ping Pong
				{
					float effectiveProgress = progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(progress * UNITY_PI);
						motionVelocity = cos(progress * UNITY_PI);
					}
					else // Outward
					{
						motionVelocity = 1.0; // Always moving forward
					}
					float3 integratedPos = basePos;
					[unroll]
					for (int step = 0; step < 8; ++step)
					{
						float t = effectiveProgress * ((step + 0.5) / 8.0);
						float ramp = evalRamp4(saturate(t), float4(0,1,0,1));
						float blend = saturate(effStrength * ramp);
						float3 stepDir = poiSlerpUnitStable(normal, worldDir, blend);
						integratedPos += stepDir * (specificTravelDistance * (effectiveProgress / 8.0));
					}
					basePos = integratedPos;
				}
				float3 floatPos = basePos + moveDir * (lerp(float4(1,1.5,0,500).x, float4(1,1.5,0,500).y, rand2.z) * CM_TO_M);
				float3 noiseOffset = 0;
				#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
				float noiseStrength = lerp(float4(0,0,0,50).x, float4(0,0,0,50).y, rand3.x) * CM_TO_M;
				float noiseScrollSpeed = lerp(float4(1,1,0,0).x, float4(1,1,0,0).y, rand3.w);
				float2 lookupUV = (rand2.xy * float4(1,1,0,0).xy) + float4(1,1,0,0).zw;
				float2 dynamicPan = float4(0,0,0,0) + (_Time.x * noiseScrollSpeed);
				float3 noiseVal = _ParticleNoiseTex.SampleLevel(sampler_linear_repeat, lookupUV + dynamicPan, 0).rgb * 2.0 - 1.0;
				noiseOffset = (tangent * noiseVal.r + bitangent * noiseVal.g) * noiseStrength;
				#endif
				float audioLinkHeight = 0, frequencyPosition = 0, bandAssignment = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable)
				{
					if (2.0 == 0)
					{
						float waveformX = frac(randomU + randomV) * 128.0;
						frequencyPosition = waveformX / 128.0;
						float4 waveformData = AudioLinkLerpMultiline(float2(waveformX, 6));
						float audioLinkSample = waveformData.r;
						float4 waveformDataNext = AudioLinkLerpMultiline(float2(waveformX + 1, 6));
						audioLinkSample = lerp(audioLinkSample, waveformDataNext.r, 0.2);
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 1)
					{
						float dftX = frac(randomU + randomV) * 128.0;
						frequencyPosition = dftX / 128.0;
						float4 dftData = AudioLinkLerpMultiline(float2(dftX, 4));
						float audioLinkSample = dftData.r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 2)
					{
						int band = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 3)
					{
						int filteredBand = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = filteredBand / 3.0;
						float filteredX = frac(randomU + randomV) * 16.0;
						frequencyPosition = filteredX / 16.0;
						float audioLinkSample = AudioLinkLerp(float2(filteredX, 28 + filteredBand)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 4)
					{
						float autocorrX = frac(randomU + randomV) * 128.0;
						frequencyPosition = autocorrX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(autocorrX, 27)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 >= 5 && 2.0 <= 8)
					{
						int band = 2.0 - 5;
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					if (0.0 == 1)
					{
						float audioLinkNoise;
						if (1.0 == 5)
						{
							audioLinkNoise = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						}
						else
						{
							int noiseBand = clamp(1.0, 0, 4);
							audioLinkNoise = AudioLinkLerp(float2(0, noiseBand)).r;
						}
						float noiseMultiplier = evalRamp4(audioLinkNoise, float4(1,1,0,1));
						noiseOffset *= noiseMultiplier;
					}
				}
				#endif
				particle.position = floatPos + noiseOffset +moveDir * audioLinkHeight;
				particle.noiseOffset = noiseOffset;
				particle.moveDir = moveDir;
				particle.motionVelocity = motionVelocity;
				particle.rotationSpeed = lerp(float4(-3,3,-20,20).x, float4(-3,3,-20,20).y, rand1.z);
				particle.audioRotationOffset = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 0.0)
				{
					if (0.0 == 5)
					{
						float normalizedAudioHeight = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						particle.audioRotationOffset = normalizedAudioHeight * 2.0 * 360;
					}
					else
					{
						int rotationBand = clamp(0.0, 0, 4);
						particle.audioRotationOffset = AudioLinkGetChronoTime(0.0, rotationBand) * 2.0 * 360;
					}
				}
				#endif
				particle.size = lerp(float4(1.5,2,0.01,100).x, float4(1.5,2,0.01,100).y, rand3.y) * CM_TO_M;
				particle.size *= evalRamp4(saturate(progress), float4(1,1,0,1));
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 1.0)
				{
					float audioLinkSize;
					if (0.0 == 5)
					{
						audioLinkSize = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
					}
					else
					{
						int sizeBand = clamp(0.0, 0, 4);
						audioLinkSize = AudioLinkLerp(float2(0, sizeBand)).r;
					}
					float sizeAdd = evalRamp4(audioLinkSize, float4(0,0,0,1)) * CM_TO_M;
					particle.size = max(0.0001, particle.size + sizeAdd);
				}
				#endif
				particle.progress = progress;
				particle.audioHeight = audioLinkHeight;
				if (2.0 <= 1)
				{
					particle.audioPosition = frequencyPosition;
				}
				else
				{
					particle.audioPosition = bandAssignment;
				}
				particle.particleSeed = seedBase;
				return particle;
			}
			inline void AppendParticleVertex(VertexOut output, float3 worldPosition, float2 quadUV, float2 triCenterUV, int outSet, float3 normalVector, float3 tangentVector, float handedness, float3 camPos, inout TriangleStream<VertexOut> triStream)
			{
				output.worldPos = float4(worldPosition, 1);
				output.localPos = mul(unity_WorldToObject, float4(worldPosition, 1));
				output.pos = PoiWorldToClipPos(worldPosition);
				output.fogData.x = output.pos.z;
				#ifdef FOG_EXP2
				output.fogData.y = 1;
				#else
				output.fogData.y = 0;
				#endif
				POI_TRANSFER_SHADOW(output, output.uv[0].xy);
				output.normal = normalVector;
				output.tangent.xyz = tangentVector;
				output.tangent.w = handedness;
				output.uv[0] = float4(quadUV, quadUV);
				output.uv[1] = float4(quadUV, quadUV);
				if (outSet == 0)
				{
					output.uv[0].xy = triCenterUV;
				}
				else if (outSet == 1)
				{
					output.uv[0].zw = triCenterUV;
				}
				else if (outSet == 2)
				{
					output.uv[1].xy = triCenterUV;
				}
				else if (outSet == 3)
				{
					output.uv[1].zw = triCenterUV;
				}
				triStream.Append(output);
			}
			void RenderParticle(ParticleData particle, VertexOut input[3], inout TriangleStream<VertexOut> triStream)
			{
				float3 camPos = getCameraPosition();
				float3 toCamera = normalize(camPos - particle.position + float3(1e-6, 0, 0));
				float theta = atan2(toCamera.z, toCamera.x);
				float phi = asin(toCamera.y);
				float cosTheta, sinTheta, cosPhi, sinPhi;
				sincos(theta, sinTheta, cosTheta);
				sincos(phi, sinPhi, cosPhi);
				float3 camRight = float3(-sinTheta, 0, cosTheta);
				float3 camUp = float3(-sinPhi * cosTheta, cosPhi, -sinPhi * sinTheta);
				float3 billboardNormal = normalize(camPos - particle.position);
				float3 normalVector = normalize(lerp(billboardNormal, particle.spawnNormal, 0.0));
				float3 tangentVector = normalize(camRight - dot(camRight, normalVector) * normalVector);
				float3 bitangentVector = normalize(cross(normalVector, tangentVector));
				float3 camFacing = normalVector;
				float faceBlend = 0.0;
				float alignAngle = 0;
				if (faceBlend > 0.0001)
				{
					float3 baseMotionDir = particle.moveDir;
					float effectiveProgress = particle.progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(particle.progress * UNITY_PI);
					}
					float rampAtP = evalRamp4(saturate(effectiveProgress), float4(0,1,0,1));
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					baseMotionDir = poiSlerpUnitStable(triNormal, baseMotionDir, saturate(rampAtP));
					float2 dir2 = normalize(float2(dot(baseMotionDir, camRight), dot(baseMotionDir, camUp)) + 1e-6);
					alignAngle = atan2(dir2.y, dir2.x);
					if (0.0 == 2) // Ping Pong
					{
						if (particle.motionVelocity < - 0.001)
						{
							alignAngle += UNITY_PI;
						}
					}
					else if (particle.motionVelocity < - 0.001) // Other modes
					{
						alignAngle += UNITY_PI;
					}
				}
				float baseAngle = _Time.y * particle.rotationSpeed + radians(particle.audioRotationOffset);
				float finalAngle = baseAngle + alignAngle * faceBlend;
				float sinAngle, cosAngle;
				sincos(finalAngle, sinAngle, cosAngle);
				float2x2 rotMatrix = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
				float handedness = 1;
				if (dot(cross(tangentVector, bitangentVector), normalVector) < 0)
				{
					handedness = -1;
				}
				float halfSize = particle.size * 0.5f;
				VertexOut outputVertex = input[0];
				#ifdef POI_AUDIOLINK
				float normalizedAudioHeight = saturate(particle.audioHeight / max(1.0 * CM_TO_M, 0.001));
				#else
				float normalizedAudioHeight = 0;
				#endif
				float packedAudio = floor(normalizedAudioHeight * 65535.0) * 65536.0 + floor(particle.audioPosition * 65535.0);
				outputVertex.particleData = float3(-particle.progress - 1.0, packedAudio, poiRand(particle.particleSeed));
				float2 corner0 = mul(rotMatrix, float2(-1, -1) * halfSize);
				float2 corner1 = mul(rotMatrix, float2(1, -1) * halfSize);
				float2 corner2 = mul(rotMatrix, float2(-1, 1) * halfSize);
				float2 corner3 = mul(rotMatrix, float2(1, 1) * halfSize);
				float2 particleSpawnUV = particle.spawnUV;
				float3 worldPos;
				worldPos = particle.position + camRight * corner0.x + camUp * corner0.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner3.x + camUp * corner3.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
			}
			[maxvertexcount(21)]
			void geom(triangle VertexOut input[3], inout TriangleStream<VertexOut> triStream, uint primID : SV_PrimitiveID)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[0]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[1]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[2]);
				if (1.0)
				{
					[unroll]
					for (int vertexIndex = 0; vertexIndex < 3; vertexIndex++)
					{
						VertexOut vertex = input[vertexIndex];
						vertex.particleData = float3(0, 0, 0);
						triStream.Append(vertex);
					}
					triStream.RestartStrip();
				}
				if (0.15 <= 0)
				{
					return;
				}
				float3 v0_world = input[0].worldPos.xyz;
				float3 v1_world = input[1].worldPos.xyz;
				float3 v2_world = input[2].worldPos.xyz;
				float triangleArea = length(cross(v1_world - v0_world, v2_world - v0_world)) * 0.5;
				if (0.0 >= 1 && 0.0 > 0.0)
				{
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					float3 safeWorldDir = float4(0,1,0,0).xyz;
					float lenW = length(safeWorldDir);
					safeWorldDir = (lenW > 1e-4) ? (safeWorldDir / lenW) : float3(0, 1, 0);
					if (dot(triNormal, safeWorldDir) * .5 + .5 < 0.0)
					{
						return;
					}
				}
				float distanceToCamera = length(getCameraPosition() - (v0_world + v1_world + v2_world) / 3.0);
				float desiredCount = (triangleArea * CM2_TO_M2) * 0.15;
				if (0.0 > 0)
				{
					desiredCount *= ((input[0].vertexColor + input[1].vertexColor + input[2].vertexColor) / 3.0)[0.0 - 1];
				}
				#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
				float4 avgUV = (input[0].uv[0.0 / 2] + input[1].uv[0.0 / 2] + input[2].uv[0.0 / 2]) / 3.0;
				float2 maskUV;
				if (0.0 % 2 == 0)
				{
					maskUV = avgUV.xy;
				}
				else
				{
					maskUV = avgUV.zw;
				}
				maskUV = maskUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw + _Time.y * float4(0,0,0,0);
				float maskValue = _ParticleSpawnMask.SampleLevel(sampler_linear_repeat, maskUV, 0)[0.0];
				if (0.0)
				{
					desiredCount *= 1.0 - maskValue;
				}
				else
				{
					desiredCount *= maskValue;
				}
				#endif
				if (1.0)
				{
					float distanceInterpolation = saturate((distanceToCamera - float4(3,8,0,0).x) / (float4(3,8,0,0).y - float4(3,8,0,0).x));
					desiredCount *= lerp(float4(1,0,0,0).x, float4(1,0,0,0).y, distanceInterpolation);
				}
				int finalSpawnCount = min(floor(desiredCount + poiRand(float2(primID, primID) + 0.069)), MAX_PARTICLES_PER_TRIANGLE);
				if (finalSpawnCount == 0)
				{
					return;
				}
				float3 normal = normalize(input[0].normal + input[1].normal + input[2].normal);
				float4 avgTangent = (input[0].tangent + input[1].tangent + input[2].tangent) / 3.0;
				float3 tangent;
				if (length(avgTangent.xyz) > 0.0001)
				{
					tangent = normalize(avgTangent.xyz);
				}
				else
				{
					tangent = float3(1, 0, 0);
				}
				float3 bitangent = cross(normal, tangent) * avgTangent.w;
				#ifdef POI_AUDIOLINK
				bool audioLinkAvailable = AudioLinkIsAvailable();
				#else
				bool audioLinkAvailable = false;
				#endif
				[unroll(3)]
				for (int i = 0; i < finalSpawnCount && i < 3; ++i)
				{
					int spawnUvSet = (int)clamp(0.0, 0, 3);
					float4 uvA4 = input[0].uv[spawnUvSet / 2];
					float4 uvB4 = input[1].uv[spawnUvSet / 2];
					float4 uvC4 = input[2].uv[spawnUvSet / 2];
					float2 uvA = (spawnUvSet % 2 == 0) ? uvA4.xy : uvA4.zw;
					float2 uvB = (spawnUvSet % 2 == 0) ? uvB4.xy : uvB4.zw;
					float2 uvC = (spawnUvSet % 2 == 0) ? uvC4.xy : uvC4.zw;
					ParticleData p = GenerateParticle(i, primID, v0_world, v1_world, v2_world, input[0].normal, input[1].normal, input[2].normal, tangent, bitangent, uvA, uvB, uvC, audioLinkAvailable);
					RenderParticle(p, input, triStream);
				}
			}
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			#define POI2D_SAMPLER_STOCHASTIC(tex, texSampler, uv, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, uv) : POI2D_SAMPLER(tex, texSampler, uv))
			#define POI2D_SAMPLER_PAN_STOCHASTIC(tex, texSampler, uv, pan, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan)) : POI2D_SAMPLER_PAN(tex, texSampler, uv, pan))
			#define POI2D_SAMPLER_PANGRAD_STOCHASTIC(tex, texSampler, uv, pan, dx, dy, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan), dx, dy) : POI2D_SAMPLER_PANGRAD(tex, texSampler, uv, pan, dx, dy))
			#endif
			#if !defined(_STOCHASTICMODE_NONE)
			float2 StochasticHash2D2D(float2 s)
			{
				return frac(sin(glsl_mod(float2(dot(s, float2(127.1, 311.7)), dot(s, float2(269.5, 183.3))), 3.14159)) * 43758.5453);
			}
			#endif
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			float3x3 DeliotHeitzStochasticUVBW(float2 uv)
			{
				const float2x2 stochasticSkewedGrid = float2x2(1.0, -0.57735027, 0.0, 1.15470054);
				float2 skewUV = mul(stochasticSkewedGrid, uv * 3.4641 * 1.0);
				float2 vxID = floor(skewUV);
				float3 bary = float3(frac(skewUV), 0);
				bary.z = 1.0 - bary.x - bary.y;
				float3x3 pos = float3x3(
				float3(vxID, bary.z),
				float3(vxID + float2(0, 1), bary.y),
				float3(vxID + float2(1, 0), bary.x)
				);
				float3x3 neg = float3x3(
				float3(vxID + float2(1, 1), -bary.z),
				float3(vxID + float2(1, 0), 1.0 - bary.y),
				float3(vxID + float2(0, 1), 1.0 - bary.x)
				);
				return (bary.z > 0) ? pos : neg;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv, float2 dx, float2 dy)
			{
				float3x3 UVBW = DeliotHeitzStochasticUVBW(uv);
				return mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[0].xy), dx, dy), UVBW[0].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[1].xy), dx, dy), UVBW[1].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[2].xy), dx, dy), UVBW[2].z) ;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv)
			{
				float2 dx = ddx(uv), dy = ddy(uv);
				return DeliotHeitzSampleTexture(tex, texSampler, uv, dx, dy);
			}
			#endif // defined(_STOCHASTICMODE_DELIOT_HEITZ)
			void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiMods poiMods)
			{
				poiFragData.alpha = saturate(poiFragData.alpha + 0.0);
				if (0.0 > 0)
				{
					poiFragData.alpha = maskBlend(poiFragData.alpha, poiMods.globalMask[0.0 - 1], 2.0);
				}
			}
			void poiGeoParticle(VertexOut i, inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
				if (i.particleData.x < 0)
				{
					float progress = -i.particleData.x - 1.0;
					float packedAudio = i.particleData.y;
					float audioLinkHeight = floor(packedAudio / 65536.0) / 65535.0;
					float audioPosition = fmod(packedAudio, 65536.0) / 65535.0;
					float particleSeed = i.particleData.z;
					float frameIndex = 0;
					if (0.0)
					{
						float totalFrames = (0.0 > 0) ? 0.0 : (1.0 * 1.0);
						if (0.0 == 0)
						{
							frameIndex = floor(particleSeed * totalFrames);
						}
						else if (0.0 == 1)
						{
							frameIndex = floor(progress * totalFrames);
						}
						else if (0.0 == 2)
						{
							float timeOffset = 0;
							if (0.0)
							{
								timeOffset = particleSeed * totalFrames;
							}
							frameIndex = floor(fmod(_Time.y * 10.0 + timeOffset, totalFrames));
						}
						#ifdef POI_AUDIOLINK
						if (AudioLinkIsAvailable() && 0.0)
						{
							int spriteBand = clamp(0.0, 0, 3);
							frameIndex = floor(poiMods.audioLink[spriteBand] * totalFrames);
						}
						#endif
						frameIndex = clamp(frameIndex, 0, totalFrames - 1);
					}
					#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
					float3 lifetimeColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(progress, 0.5), 0).rgb;
					#else
					float3 lifetimeColor = float3(1, 1, 1);
					#endif
					float4 randFrag = poiRand4(float2(particleSeed, particleSeed * 1.37));
					float2 alphaRange = float4(1,1,0,0).xy;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable() && 0.0)
					{
						float alphaValue;
						if (0.0 == 5)
						{
							alphaValue = audioLinkHeight;
						}
						else
						{
							int alphaBand = clamp(0.0, 0, 4);
							alphaValue = poiMods.audioLink[alphaBand];
						}
						float alphaAdd = evalRamp4(alphaValue, float4(0,0,0,1));
						alphaRange = saturate(alphaRange + alphaAdd);
					}
					#endif
					float lifetimeAlpha = lerp(alphaRange.x, alphaRange.y, randFrag.y);
					float3 finalColor = float3(1, 1, 1);
					float finalAlpha = 1;
					float emissionBoost = 0;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable())
					{
						#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
						if (2.0 != 2)
						{
							float gradientSample = progress;
							if (2.0 == 0)
							gradientSample = audioPosition;
							else if (2.0 == 1)
							gradientSample = audioLinkHeight;
							float4 alGradientColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(gradientSample, 0.5), 0);
							lifetimeColor = alGradientColor.rgb;
						}
						#endif
						if (1.0)
						{
							float emissionValue;
							if (0.0 == 5)
							{
								emissionValue = audioLinkHeight;
							}
							else
							{
								int emissionBand = clamp(0.0, 0, 4);
								emissionValue = poiMods.audioLink[emissionBand];
							}
							emissionBoost += evalRamp4(emissionValue, float4(0,0,0,1));
						}
					}
					#endif
					#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
					float2 lookupUV = poiMesh.uv[0].xy;
					if (0.0)
					{
						float invCols = 1.0 / 1.0;
						float invRows = 1.0 / 1.0;
						float2 frameSize = float2(invCols, invRows);
						float column = fmod(frameIndex, 1.0);
						float row = floor(frameIndex * invCols);
						row = 1.0 - 1 - row;
						lookupUV = (lookupUV * frameSize) + float2(column, row) * frameSize;
						if (0.0 > 0)
						{
							float2 texelInset = (0.0) * frameSize / max(float4(1,1,0,0).xy, 1e-6);
							lookupUV = lerp(lookupUV, (float2(column + 1, row + 1) * frameSize), texelInset);
						}
					}
					lookupUV = lookupUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw;
					float4 particleTex = _ParticleTexture.SampleLevel(sampler_linear_repeat, lookupUV, 0);
					finalColor = particleTex.rgb * lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = particleTex.a * lifetimeAlpha * float4(1,1,1,1).a;
					#else
					finalColor = lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = lifetimeAlpha * float4(1,1,1,1).a;
					#endif
					finalAlpha *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 originalColor = poiFragData.baseColor;
					float3 originalEmission = poiFragData.emission;
					poiFragData.baseColor = customBlend(originalColor, finalColor, 0.0, 1.0);
					poiFragData.alpha *= saturate(finalAlpha);
					float emissStrength = lerp(float4(0,0,0,0).x, float4(0,0,0,0).y, randFrag.x) + emissionBoost;
					emissStrength *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 particleEmission = finalColor * emissStrength;
					if (0.0 == 0)
					{
						poiFragData.emission = particleEmission;
					}
					else
					{
						poiFragData.emission = originalEmission + particleEmission;
					}
				}
			}
			void ApplyGlobalMaskModifiers(in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
			}
			float2 calculatePolarCoordinate(in PoiMesh poiMesh)
			{
				float2 delta = poiMesh.uv[0.0] - float4(0.5,0.5,0,0);
				float radius = length(delta) * 2 * 1.0;
				float angle = atan2(delta.x, delta.y);
				float phi = angle / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				angle = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				angle *= 1.0;
				return float2(radius, angle + distance(poiMesh.uv[0.0], float4(0.5,0.5,0,0)) * 0.0);
			}
			float2 MonoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(1.0, 1.0 / UNITY_PI);
				return float2(1.0, 1.0) - sphereCoords;
			}
			float2 StereoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(0.5, 1.0 / UNITY_PI);
				sphereCoords = float2(0.5, 1.0) - sphereCoords;
				return (sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
			}
			float2 calculateWorldUV(in PoiMesh poiMesh)
			{
				return float2(0.0 != 3 ? poiMesh.worldPos[ 0.0] : 0.0f, 2.0 != 3 ? poiMesh.worldPos[2.0] : 0.0f);
			}
			float2 calculatelocalUV(in PoiMesh poiMesh)
			{
				float localUVs[8];
				localUVs[0] = poiMesh.localPos.x;
				localUVs[1] = poiMesh.localPos.y;
				localUVs[2] = poiMesh.localPos.z;
				localUVs[3] = 0;
				localUVs[4] = poiMesh.vertexColor.r;
				localUVs[5] = poiMesh.vertexColor.g;
				localUVs[6] = poiMesh.vertexColor.b;
				localUVs[7] = poiMesh.vertexColor.a;
				return float2(localUVs[0.0],localUVs[1.0]);
			}
			float2 calculatePanosphereUV(in PoiMesh poiMesh)
			{
				float3 viewDirection = normalize(lerp(getCameraPosition().xyz, _WorldSpaceCameraPos.xyz, 1.0) - poiMesh.worldPos.xyz) * - 1;
				return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), 0.0);
			}
			#if POI_PIPE == POI_BIRP
			float4 frag( VertexOut i, uint facing : SV_IsFrontFace ) : SV_Target
			#else
			void frag( VertexOut i, uint facing : SV_IsFrontFace, out half outDepth: SV_Target0 )
			#endif
			{
				#if POI_PIPE == POI_BIRP
				clip(_RenderingEarlyZEnabled - 1.0);
				#endif
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				PoiSHAr = unity_SHAr;
				PoiSHAg = unity_SHAg;
				PoiSHAb = unity_SHAb;
				PoiSHBr = unity_SHBr;
				PoiSHBg = unity_SHBg;
				PoiSHBb = unity_SHBb;
				PoiSHC =  unity_SHC;
				PoiMesh poiMesh;
				PoiInitStruct(PoiMesh, poiMesh);
				PoiLight poiLight;
				PoiInitStruct(PoiLight, poiLight);
				PoiCam poiCam;
				PoiInitStruct(PoiCam, poiCam);
				PoiMods poiMods;
				PoiInitStruct(PoiMods, poiMods);
				#if POI_PIPE == POI_URP
				PoiLightOut poiLightOut;
				PoiInitStruct(PoiLightOut, poiLightOut);
				#endif
				poiMods.globalEmission = 1;
				PoiFragData poiFragData;
				poiFragData.smoothness = 1;
				poiFragData.smoothness2 = 1;
				poiFragData.metallic = 1;
				poiFragData.specularMask = 1;
				poiFragData.reflectionMask = 1;
				poiFragData.emission = 0;
				poiFragData.baseColor = float3(0, 0, 0);
				poiFragData.finalColor = float3(0, 0, 0);
				poiFragData.alpha = 1;
				poiFragData.toggleVertexLights = 0;
				#ifdef POI_UDIMDISCARD
				applyUDIMDiscard(i, facing);
				#endif
				poiMesh.objectPosition = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
				poiMesh.objNormal = mul((float3x3)unity_WorldToObject, i.normal);
				poiMesh.normals[0] = i.normal;
				poiMesh.tangent[0] = i.tangent.xyz;
				poiMesh.binormal[0] = cross(i.normal, i.tangent.xyz) * (i.tangent.w * unity_WorldTransformParams.w);
				poiMesh.worldPos = i.worldPos.xyz;
				poiMesh.localPos = i.localPos.xyz;
				poiMesh.vertexColor = i.vertexColor;
				poiMesh.isFrontFace = facing;
				poiMesh.dx = ddx(poiMesh.uv[0]);
				poiMesh.dy = ddy(poiMesh.uv[0]);
				poiMesh.isRightHand = i.tangent.w > 0.0;
				#ifndef POI_PASS_OUTLINE
				if (!poiMesh.isFrontFace && 1)
				{
					poiMesh.normals[0] *= -1;
					poiMesh.tangent[0] *= -1;
					poiMesh.binormal[0] *= -1;
				}
				#endif
				poiCam.viewDir = !IsOrthographicCamera() ?
				#if defined(USING_STEREO_MATRICES)
				normalize((unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5 - i.worldPos.xyz) :
				#else
				normalize(_WorldSpaceCameraPos - i.worldPos.xyz) :
				#endif
				normalize(UNITY_MATRIX_I_V._m02_m12_m22);
				float3 tanToWorld0 = float3(poiMesh.tangent[0].x, poiMesh.binormal[0].x, poiMesh.normals[0].x);
				float3 tanToWorld1 = float3(poiMesh.tangent[0].y, poiMesh.binormal[0].y, poiMesh.normals[0].y);
				float3 tanToWorld2 = float3(poiMesh.tangent[0].z, poiMesh.binormal[0].z, poiMesh.normals[0].z);
				float3 ase_tanViewDir = tanToWorld0 * poiCam.viewDir.x + tanToWorld1 * poiCam.viewDir.y + tanToWorld2 * poiCam.viewDir.z;
				poiCam.tangentViewDir = normalize(ase_tanViewDir);
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
				poiMesh.lightmapUV = i.lightmapUV;
				#endif
				poiMesh.parallaxUV = poiCam.tangentViewDir.xy / max(poiCam.tangentViewDir.z, 0.0001);
				poiMesh.uv[0] = i.uv[0].xy;
				poiMesh.uv[1] = i.uv[0].zw;
				poiMesh.uv[2] = i.uv[1].xy;
				poiMesh.uv[3] = i.uv[1].zw;
				poiMesh.uv[4] = poiMesh.uv[0];
				poiMesh.uv[5] = poiMesh.uv[0];
				poiMesh.uv[6] = poiMesh.uv[0];
				poiMesh.uv[7] = poiMesh.uv[0];
				poiMesh.uv[8] = poiMesh.uv[0];
				poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
				poiMesh.uv[5] = calculateWorldUV(poiMesh);
				poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
				poiMesh.uv[8] = calculatelocalUV(poiMesh);
				float3 worldViewUp = normalize(float3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, float3(0, 1, 0)));
				float3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
				poiMesh.uv[9] = float2(dot(worldViewRight, poiMesh.normals[0]), dot(worldViewUp, poiMesh.normals[0])) * 0.5 + 0.5;
				poiMods.globalMask[0] = 1;
				poiMods.globalMask[1] = 1;
				poiMods.globalMask[2] = 1;
				poiMods.globalMask[3] = 1;
				poiMods.globalMask[4] = 1;
				poiMods.globalMask[5] = 1;
				poiMods.globalMask[6] = 1;
				poiMods.globalMask[7] = 1;
				poiMods.globalMask[8] = 1;
				poiMods.globalMask[9] = 1;
				poiMods.globalMask[10] = 1;
				poiMods.globalMask[11] = 1;
				poiMods.globalMask[12] = 1;
				poiMods.globalMask[13] = 1;
				poiMods.globalMask[14] = 1;
				poiMods.globalMask[15] = 1;
				ApplyGlobalMaskModifiers(poiMesh, poiMods, poiCam);
				#if POI_PIPE == POI_URP
				InputData inputData;
				PoiInitStruct(InputData, inputData);
				inputData.positionWS = poiMesh.worldPos;
				inputData.normalWS = poiMesh.normals[1];
				inputData.viewDirectionWS = poiCam.viewDir;
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(i.pos);
				#endif
				float2 mainUV = poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0));
				if (0.0)
				{
					mainUV = sharpSample(float4(0.03125,0.03125,32,32), mainUV);
				}
				float4 mainTexture = POI2D_SAMPLER_PAN_STOCHASTIC(_MainTex, _MainTex, mainUV, float4(0,0,0,0), 0.0);
				mainTexture.a = max(mainTexture.a, 0.0);
				#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
				poiMesh.tangentSpaceNormal = PoiUnpackNormalScale(POI2D_SAMPLER_PAN_STOCHASTIC(_BumpMap, _MainTex, poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0)), float4(0,0,0,0), 0.0), 1.0);
				#else
				poiMesh.tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				#endif
				float3 tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				poiMesh.normals[0] = normalize(
				tangentSpaceNormal.x * poiMesh.tangent[0] +
				tangentSpaceNormal.y * poiMesh.binormal[0] +
				tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.normals[1] = normalize(
				poiMesh.tangentSpaceNormal.x * poiMesh.tangent[0] +
				poiMesh.tangentSpaceNormal.y * poiMesh.binormal[0] +
				poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.tangent[1] = cross(poiMesh.binormal[0], -poiMesh.normals[1]);
				poiMesh.binormal[1] = cross(-poiMesh.normals[1], poiMesh.tangent[0]);
				poiCam.forwardDir = getCameraForward();
				#if defined(USING_STEREO_MATRICES)
				poiCam.worldPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
				#else
				poiCam.worldPos = _WorldSpaceCameraPos;
				#endif
				poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
				poiCam.vertexReflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[0]);
				poiCam.clipPos = i.pos;
				poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
				poiCam.posScreenSpace = poiTransformClipSpacetoScreenSpaceFrag(poiCam.clipPos);
				#ifdef UNITY_SINGLE_PASS_STEREO
				poiCam.posScreenSpace.x = poiCam.posScreenSpace.x * 0.5;
				#endif
				poiCam.screenUV = poiCam.posScreenSpace.xy / poiCam.posScreenSpace.w;
				poiCam.posScreenPixels = calcPixelScreenUVs(poiCam.posScreenSpace);
				poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
				poiCam.worldDirection.xyz = poiMesh.worldPos.xyz - poiCam.worldPos;
				poiCam.worldDirection.w = dot(i.pos, CalculateFrustumCorrection());
				poiFragData.baseColor = mainTexture.rgb;
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.baseColor *= poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
				poiFragData.alpha = mainTexture.a * float4(1,1,1,1).a;
				#else
				if(_TwoPassOverrideFirstPassColor)
				{
					poiFragData.baseColor *= poiThemeColor(poiMods, _TwoPassColor.rgb, _TwoPassColorThemeIndex);
					poiFragData.alpha = mainTexture.a * _TwoPassColor.a;
				}
				#endif
				if (2.0)
				{
					#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
					float alphaMask = POI2D_SAMPLER_PAN(_AlphaMask, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0).xy).r;
					#else
					float alphaMask = 1;
					#endif
					alphaMask = saturate(alphaMask * 1.0 + (0.0 ? 0.0 * - 1 : 0.0));
					if (0.0) alphaMask = 1 - alphaMask;
					if (2.0 == 1) poiFragData.alpha = alphaMask;
					if (2.0 == 2) poiFragData.alpha = poiFragData.alpha * alphaMask;
					if (2.0 == 3) poiFragData.alpha = saturate(poiFragData.alpha + alphaMask);
					if (2.0 == 4) poiFragData.alpha = saturate(poiFragData.alpha - alphaMask);
				}
				applyAlphaOptions(poiFragData, poiMesh, poiCam, poiMods);
				if (0.0 > 0)
				{
					applyToGlobalMask(poiMods, 0.0 - 1, 0.0, i.particleData.x < 0 ? 1.0 : 0.0);
				}
				if (i.particleData.x < 0)
				{
					poiFragData.baseColor = lerp(poiFragData.baseColor, float4(1,1,1,1), 1.0);
				}
				poiGeoParticle(i, poiFragData, poiMesh, poiMods, poiCam);
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.alpha = 0.0 ? 1 : poiFragData.alpha;
				#else
				poiFragData.alpha = _AlphaForceOpaque2 ? 1 : poiFragData.alpha;
				#endif
				clip(poiFragData.alpha - 0.0);
				#if POI_PIPE == POI_URP
				outDepth = i.pos.z + POI_SAFE_RGB0.r;
				#endif
				#if POI_PIPE == POI_BIRP
				return float4(1, 1, 1, 1);
				#else
				return;
				#endif
			}
			ENDHLSL
		}
		Pass
		{
			Name "DepthNormals"
			Tags { "LightMode" = "DepthNormals" }
			Stencil
			{
				Ref [_StencilRef]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilCompareFunction]
				Pass [_StencilPassOp]
				Fail [_StencilFailOp]
				ZFail [_StencilZFailOp]
			}
			ZWrite [_ZWrite]
			Cull Off
			AlphaToMask Off
			ZTest [_ZTest]
			Offset [_OffsetFactor], [_OffsetUnits]
			BlendOp [_BlendOp], [_BlendOpAlpha]
			Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
			HLSLPROGRAM
 #define _STOCHASTICMODE_DELIOT_HEITZ 
 #define OPTIMIZER_ENABLED 
			#pragma target 5.0
			#define POI_PASS_DEPTH_NORMALS
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#if POI_PIPE == POI_URP
			#define FOG_LINEAR 0
			#define FOG_EXP 0
			#define FOG_EXP2 0
			#endif
			#pragma multi_compile_instancing
			#pragma skip_variants DECALS_OFF DECALS_3RT DECALS_4RT DECAL_SURFACE_GRADIENT _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3 _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH _DECAL_LAYERS
			#pragma skip_variants _MAIN_LIGHT_SHADOWS_SCREEN _SCREEN_SPACE_OCCLUSION _USE_FAST_SRGB_LINEAR_CONVERSION _LIGHT_LAYERS
			#if !defined(POI_WORLD)
			#pragma skip_variants _ADDITIONAL_LIGHT_SHADOWS _ADDITIONAL_LIGHTS_VERTEX LIGHTMAP_ON DYNAMICLIGHTMAP_ON LIGHTMAP_SHADOW_MIXING SHADOWS_SHADOWMASK DIRLIGHTMAP_COMBINED _MIXED_LIGHTING_SUBTRACTIVE
			#endif
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag
			CBUFFER_START(UnityPerMaterial)
			float _GrabMode;
			float _Mode;
			#ifndef _STOCHASTICMODE_NONE
			#ifdef _STOCHASTICMODE_DELIOT_HEITZ
			float _StochasticDeliotHeitzDensity;
			#endif
			#endif
			float4 _Color;
			float _ColorThemeIndex;
			float _MainPixelMode;
			float4 _MainTex_ST;
			float4 _MainTex_TexelSize;
			float2 _MainTexPan;
			float _MainTexUV;
			float _MainTexStochastic;
			float _MainIgnoreTexAlpha;
			float4 _BumpMap_ST;
			float2 _BumpMapPan;
			float _BumpMapUV;
			float _BumpScale;
			float _BumpMapStochastic;
			float4 _AlphaMask_ST;
			float2 _AlphaMaskPan;
			float _AlphaMaskUV;
			float _AlphaMaskInvert;
			float _MainAlphaMaskMode;
			float _AlphaMaskBlendStrength;
			float _AlphaMaskValue;
			float _Cutoff;
			float _AlphaForceOpaque;
			float _AlphaMod;
			float _AlphaPremultiply;
			float _AlphaBoostFA;
			float _AlphaGlobalMask;
			float _AlphaGlobalMaskBlendType;
			float _ParticleRandomSeedOffset;
			float _ParticleApplyGlobalMaskIndex;
			float _ParticleApplyGlobalMaskBlendType;
			float4 _ParticleBaseColorOverride;
			float _ParticleOverrideBaseColor;
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleSpawnMask_ST;
			float2 _ParticleSpawnMaskPan;
			float _ParticleSpawnMaskUV;
			float _ParticleSpawnMaskChannel;
			float _ParticleSpawnMaskInvert;
			#endif
			float _ParticleSpawnMaskVertexColor;
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleTexture_ST;
			float2 _ParticleTexturePan;
			float _ParticleTextureUV;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleNoiseTex_ST;
			float2 _ParticleNoiseTexPan;
			float _ParticleNoiseTexUV;
			#endif
			float4 _ParticleSizeRamp;
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			float4 _ParticleLifetimeGradient_ST;
			#endif
			float4 _ParticleAlphaRamp;
			float4 _ParticleEmissionRamp;
			float _ParticleColorBlendMode;
			float _ParticleColorBlendAlpha;
			float _ParticleEmissionBlendMode;
			float4 _ParticleColor;
			float _ParticleColorThemeIndex;
			float4 _ParticleEmissionStrength;
			float4 _ParticleAlpha;
			float _ParticleSpriteSheetEnabled;
			float _ParticleSpriteSheetColumns;
			float _ParticleSpriteSheetRows;
			float _ParticleSpriteSheetFrameSelection;
			float _ParticleSpriteSheetFPS;
			float _ParticleSpriteSheetRandomStart;
			float _ParticleSpriteSheetTotalFrames;
			float _ParticleSpriteSheetInset;
			float _ParticleSpriteSheetFrameBias;
			float _ParticleRenderBaseMesh;
			float _ParticleDensity;
			float4 _ParticleSize;
			float4 _ParticleFloatDistance;
			float4 _ParticleNoiseStrength;
			float4 _ParticleNoiseScrollSpeed;
			float4 _ParticleRotationSpeed;
			float _ParticleMotionMode;
			float4 _ParticleTravelDistance;
			float _ParticleCycleDuration;
			float _ParticleSpawnReductionEnabled;
			float4 _ParticleSpawnDistances;
			float4 _ParticleSpawnReduction;
			float _ParticlePosUVSource;
			float _ParticlePosUVDestination;
			float4 _ParticleWorldDirection;
			float _ParticleDirectionStrength;
			float _ParticleDirectionStrengthCurve;
			float _ParticleSpawnDirectionCull;
			float4 _ParticleDirectionRamp;
			float _ParticleFaceDirection;
			float _ParticleInheritNormal;
			float _ParticleALType;
			#ifdef POI_AUDIOLINK
			float _ParticleALWaveformScale;
			float _ParticleALWaveformSmoothing;
			float _ParticleALGradientSource;
			float _ParticleALReactiveEmission;
			float _ParticleALReactiveEmissionBand;
			float4 _ParticleALReactiveEmissionRamp;
			float _ParticleALSizeModulation;
			float _ParticleALSizeBand;
			float4 _ParticleALSizeRamp;
			float _ParticleALRotationModulation;
			float _ParticleALRotationBand;
			float _ParticleALRotationType;
			float _ParticleALRotationSpeed;
			float _ParticleALNoiseModulation;
			float _ParticleALNoiseBand;
			float4 _ParticleALNoiseRamp;
			float _ParticleALAlphaModulation;
			float _ParticleALAlphaBand;
			float4 _ParticleALAlphaRamp;
			float _ParticleALSpriteSheetFrameControl;
			float _ParticleALSpriteSheetBand;
			#endif
			int _GlobalMaskVertexColorLinearSpace;
			float _StereoEnabled;
			float _PolarUV;
			float2 _PolarCenter;
			float _PolarRadialScale;
			float _PolarLengthScale;
			float _PolarSpiralPower;
			float _PanoUseBothEyes;
			float _UVModWorldPos0;
			float _UVModWorldPos1;
			float _UVModLocalPos0;
			float _UVModLocalPos1;
			CBUFFER_END
			float _IgnoreFog;
			float _RenderingReduceClipDistance;
			int _FlipBackfaceNormals;
			float _AddBlendOp;
			float _Cull;
			SamplerState point_clamp_sampler;
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			#define STEREO_UV(uv) float3(uv, unity_StereoEyeIndex)
			#else
			#define STEREO_UV(uv) uv
			#endif
			#if POI_PIPE == POI_BIRP
			#ifdef UNITY_STEREO_INSTANCING_ENABLED
			Texture2DArray<float> _CameraDepthTexture;
			#else
			Texture2D<float> _CameraDepthTexture;
			#endif
			#endif
			#if POI_PIPE == POI_URP
			TEXTURE2D_X_FLOAT(_CameraDepthTexture);
			float4 _CameraDepthTexture_TexelSize;
			#endif
			float SampleScreenDepth(float2 uv)
			{
				uv.y = _ProjectionParams.x * 0.5 + 0.5 - uv.y * _ProjectionParams.x;
				return _CameraDepthTexture.SampleLevel(point_clamp_sampler, STEREO_UV(uv), 0).r;
			}
			bool DepthTextureExists()
			{
				float3 dTexDim = 0;
				#if POI_PIPE == POI_BIRP
				#ifdef UNITY_STEREO_INSTANCING_ENABLED
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y, dTexDim.z);
				#else
				_CameraDepthTexture.GetDimensions(dTexDim.x, dTexDim.y);
				#endif
				#endif
				#if POI_PIPE == POI_URP
				dTexDim.xy = _CameraDepthTexture_TexelSize.zw;
				#endif
				return dTexDim.x > 16;
			}
			UNITY_DECLARE_TEX2D(_MainTex);
			#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BumpMap;
			#endif
			#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _AlphaMask;
			#endif
			#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleSpawnMask;
			#endif
			#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleTexture;
			#endif
			#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleNoiseTex;
			#endif
			#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
			Texture2D _ParticleLifetimeGradient;
			#endif
			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				#ifdef POI_PASS_MOTION_VECTORS
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
				float3 alembicMotionVector : TEXCOORD5;
				#endif
				#endif
				uint vertexId : SV_VertexID;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct tessellatedAppData
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				uint vertexId : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct VertexOut
			{
				float4 pos : SV_POSITION;
				float4 uv[2] : TEXCOORD0;
				float3 normal : TEXCOORD2;
				float4 tangent : TEXCOORD3;
				float4 worldPos : TEXCOORD4;
				float4 localPos : TEXCOORD5;
				float4 vertexColor : TEXCOORD6;
				float4 lightmapUV : TEXCOORD7;
				float2 fogData: TEXCOORD8;
				POI_SHADOW_COORDS(9)
				#ifdef POI_PASS_MOTION_VECTORS
				float4 positionCSNoJitter         : POSITION_CS_NO_JITTER;
				float4 previousPositionCSNoJitter : PREV_POSITION_CS_NO_JITTER;
				#endif
				nointerpolation float3 particleData : TEXCOORD13;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			float2 vertexUV(in VertexOut o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			float2 vertexUV(in appdata v, int index)
			{
				switch(index)
				{
					case 0:
					return v.uv0.xy;
					case 1:
					return v.uv1.xy;
					case 2:
					return v.uv2.xy;
					case 3:
					return v.uv3.xy;
					default:
					return v.uv0.xy;
				}
			}
			#ifdef POI_PASS_LILFUR
			float2 vertexUV(in PoiGeoToFragLilFur o, int index)
			{
				switch(index)
				{
					case 0:
					return o.uv[0].xy;
					case 1:
					return o.uv[0].zw;
					case 2:
					return o.uv[1].xy;
					case 3:
					return o.uv[1].zw;
					default:
					return o.uv[0].xy;
				}
			}
			#endif
			#ifdef POI_AUDIOLINK
			inline int poiALBandPass(int bandIdx)
			{
				bandIdx = clamp(bandIdx, 0, 3);
				return bandIdx == 0 ? ALPASS_AUDIOBASS : bandIdx == 1 ? ALPASS_AUDIOLOWMIDS : bandIdx == 2 ? ALPASS_AUDIOHIGHMIDS : ALPASS_AUDIOTREBLE;
			}
			#endif
			void applyReducedRenderClipDistance(inout VertexOut o)
			{
				if (o.pos.w < _ProjectionParams.y * 1.01 && o.pos.w > 0)
				{
					#if defined(UNITY_REVERSED_Z) // DirectX
					o.pos.z = o.pos.z * 0.0001 + o.pos.w * 0.999;
					#else // OpenGL
					o.pos.z = o.pos.z * 0.0001 - o.pos.w * 0.999;
					#endif
				}
			}
			VertexOut vert(appdata v)
			{
				UNITY_SETUP_INSTANCE_ID(v);
				VertexOut o;
				PoiInitStruct(VertexOut, o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				#ifdef POI_TESSELLATED
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v);
				#endif
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				#ifdef POI_PASS_OUTLINE
				if (0.0 > 0.5)
				{
					return (VertexOut)POI_NAN;
				}
				#endif
				#ifdef POI_AUDIOLINK
				float vertexAudioLink[5];
				vertexAudioLink[0] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 0))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 0))[0];
				vertexAudioLink[1] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 1))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 1))[0];
				vertexAudioLink[2] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 2))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 2))[0];
				vertexAudioLink[3] = 0.0 == 0 ? AudioLinkData(ALPASS_AUDIOLINK + float2(0, 3))[0] : AudioLinkData(ALPASS_FILTEREDAUDIOLINK + float2((1 - 0.0) * 15.95, 3))[0];
				vertexAudioLink[4] = AudioLinkData(ALPASS_GENERALVU + float2(8, 0))[0];
				#endif
				#if POI_PIPE == POI_BIRP
				o.normal = UnityObjectToWorldNormal(v.normal);
				o.tangent.xyz = UnityObjectToWorldDir(v.tangent);
				#elif  POI_PIPE == POI_URP
				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(v.normal, v.tangent);
				o.normal = vertexNormalInput.normalWS;
				o.tangent.xyz = vertexNormalInput.tangentWS;
				#endif
				o.tangent.w = v.tangent.w;
				o.vertexColor = v.color;
				o.uv[0] = float4(v.uv0.xy, v.uv1.xy);
				o.uv[1] = float4(v.uv2.xy, v.uv3.xy);
				#if defined(LIGHTMAP_ON)
				OUTPUT_LIGHTMAP_UV(v.uv1.xy, unity_LightmapST, o.lightmapUV.xy);
				#endif
				#ifdef DYNAMICLIGHTMAP_ON
				OUTPUT_LIGHTMAP_UV(v.uv2.xy, unity_LightmapST, o.lightmapUV.zw);
				#endif
				o.localPos = v.vertex;
				o.worldPos = mul(unity_ObjectToWorld, o.localPos);
				float3 localOffset = float3(0, 0, 0);
				float3 worldOffset = float3(0, 0, 0);
				o.localPos.rgb += localOffset;
				o.worldPos.rgb += worldOffset;
				o.pos = PoiObjectToClipPos(o.localPos.rgb);
				o.fogData.x = o.pos.z; // This is used for fog calculations, so we need to ensure it's in clip space
				#ifdef FOG_EXP2
				o.fogData.y = 1;
				#else
				o.fogData.y = 0;
				#endif
				#if !defined(POI_PASS_SHADOW)
				POI_TRANSFER_SHADOW(o, o.uv[0].xy);
				#else
				v.vertex.xyz = o.localPos.xyz;
				POI_TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
				#endif
				if (0.0)
				{
					applyReducedRenderClipDistance(o);
				}
				#ifdef POI_PASS_META
				o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
				#endif
				#ifdef POI_PASS_MOTION_VECTORS
				#if defined(APPLICATION_SPACE_WARP_MOTION)
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				o.pos = o.positionCSNoJitter;
				#else
				o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, o.localPos));
				#endif
				float4 prevPos = (unity_MotionVectorsParams.x == 1) ? float4(v.positionOld, 1) : o.localPos;
				#if _ADD_PRECOMPUTED_VELOCITY
				prevPos = prevPos - float4(v.alembicMotionVector, 0);
				#endif
				o.previousPositionCSNoJitter = mul(_PrevViewProjMatrix, mul(UNITY_PREV_MATRIX_M, prevPos));
				#endif
				#ifdef POI_PASS_LILFUR
				#endif
				return o;
			}
			#define MAX_PARTICLES_PER_TRIANGLE 3
			#define CM2_TO_M2 10000.0
			#define CM_TO_M 0.01
			#define PARTICLE_VERTICES 4
			struct ParticleData
			{
				float3 position;
				float size;
				float progress;
				float audioHeight;
				float audioPosition;
				float rotationSpeed;
				float audioRotationOffset;
				float2 particleSeed;
				float2 spawnUV;
				float3 spawnNormal;
				float3 noiseOffset;
				float3 moveDir;
				float motionVelocity;
			};
			float3 poiAnyPerpendicular(float3 v)
			{
				float3 a = (abs(v.x) < 0.5) ? float3(1, 0, 0) : float3(0, 1, 0);
				float3 p = cross(v, a);
				return (length(p) > 1e-6) ? normalize(p) : normalize(cross(v, float3(0, 0, 1)));
			}
			float3 poiRotateAroundAxis(float3 v, float3 axis, float angle)
			{
				float s, c; sincos(angle, s, c);
				return v * c + cross(axis, v) * s + axis * dot(axis, v) * (1 - c);
			}
			float3 poiSlerpUnitStable(float3 fromDir, float3 toDir, float t)
			{
				fromDir = normalize(fromDir);
				toDir = normalize(toDir);
				float d = clamp(dot(fromDir, toDir), -1.0, 1.0);
				if (d > 0.999)
				{
					return normalize(lerp(fromDir, toDir, t));
				}
				if (d < - 0.999)
				{
					float3 axis = poiAnyPerpendicular(fromDir);
					return normalize(poiRotateAroundAxis(fromDir, axis, UNITY_PI * t));
				}
				float omega = acos(d);
				float s = sin(omega);
				float w0 = sin((1.0 - t) * omega) / s;
				float w1 = sin(t * omega) / s;
				return normalize(fromDir * w0 + toDir * w1);
			}
			ParticleData GenerateParticle(int particleIndex, uint primID, float3 v0_world, float3 v1_world, float3 v2_world, float3 n0, float3 n1, float3 n2, float3 tangent, float3 bitangent, float2 uvA, float2 uvB, float2 uvC, bool audioLinkAvailable)
			{
				ParticleData particle;
				float2 seedBase = float2((primID + particleIndex) * 0.51, particleIndex * 1.123) + 0.069;
				float randomU = poiRand(seedBase);
				float randomV = poiRand(seedBase.yx);
				if (randomU + randomV > 1.0)
				{
					randomU = 1.0 - randomU; randomV = 1.0 - randomV;
				}
				float3 basePos = v0_world * (1.0 - randomU - randomV) + v1_world * randomU + v2_world * randomV;
				particle.spawnUV = uvA * (1.0 - randomU - randomV) + uvB * randomU + uvC * randomV;
				particle.spawnNormal = normalize(n0 * (1.0 - randomU - randomV) + n1 * randomU + n2 * randomV);
				float3 normal = normalize(n0 + n1 + n2);
				float4 rand1 = float4(poiRand3(seedBase), poiRand(seedBase + 11.0));
				float4 rand2 = float4(poiRand3(seedBase + 1.0), poiRand(seedBase + 12.0));
				float4 rand3 = float4(poiRand3(seedBase + 2.0), poiRand(seedBase + 13.0));
				float progress = frac((_Time.y / 2.0) + rand1.x);
				float3 worldDir = float4(0,1,0,0).xyz;
				float invLen = rsqrt(max(dot(worldDir, worldDir), 1e-8));
				worldDir *= invLen;
				float specificTravelDistance = lerp(float4(50,100,0,1000).x, float4(50,100,0,1000).y, rand1.w) * CM_TO_M;
				float dBW = clamp(dot(normal, worldDir), -1.0, 1.0);
				float angN = acos(dBW) / 3.14159265;
				float effStrength = saturate(0.0 / max(angN, 1e-4));
				float3 moveDir = poiSlerpUnitStable(normal, worldDir, effStrength);
				float motionVelocity = 0;
				if (0.0 >= 1) // Outward or Ping Pong
				{
					float effectiveProgress = progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(progress * UNITY_PI);
						motionVelocity = cos(progress * UNITY_PI);
					}
					else // Outward
					{
						motionVelocity = 1.0; // Always moving forward
					}
					float3 integratedPos = basePos;
					[unroll]
					for (int step = 0; step < 8; ++step)
					{
						float t = effectiveProgress * ((step + 0.5) / 8.0);
						float ramp = evalRamp4(saturate(t), float4(0,1,0,1));
						float blend = saturate(effStrength * ramp);
						float3 stepDir = poiSlerpUnitStable(normal, worldDir, blend);
						integratedPos += stepDir * (specificTravelDistance * (effectiveProgress / 8.0));
					}
					basePos = integratedPos;
				}
				float3 floatPos = basePos + moveDir * (lerp(float4(1,1.5,0,500).x, float4(1,1.5,0,500).y, rand2.z) * CM_TO_M);
				float3 noiseOffset = 0;
				#if defined(PROP_PARTICLENOISETEX) || !defined(OPTIMIZER_ENABLED)
				float noiseStrength = lerp(float4(0,0,0,50).x, float4(0,0,0,50).y, rand3.x) * CM_TO_M;
				float noiseScrollSpeed = lerp(float4(1,1,0,0).x, float4(1,1,0,0).y, rand3.w);
				float2 lookupUV = (rand2.xy * float4(1,1,0,0).xy) + float4(1,1,0,0).zw;
				float2 dynamicPan = float4(0,0,0,0) + (_Time.x * noiseScrollSpeed);
				float3 noiseVal = _ParticleNoiseTex.SampleLevel(sampler_linear_repeat, lookupUV + dynamicPan, 0).rgb * 2.0 - 1.0;
				noiseOffset = (tangent * noiseVal.r + bitangent * noiseVal.g) * noiseStrength;
				#endif
				float audioLinkHeight = 0, frequencyPosition = 0, bandAssignment = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable)
				{
					if (2.0 == 0)
					{
						float waveformX = frac(randomU + randomV) * 128.0;
						frequencyPosition = waveformX / 128.0;
						float4 waveformData = AudioLinkLerpMultiline(float2(waveformX, 6));
						float audioLinkSample = waveformData.r;
						float4 waveformDataNext = AudioLinkLerpMultiline(float2(waveformX + 1, 6));
						audioLinkSample = lerp(audioLinkSample, waveformDataNext.r, 0.2);
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 1)
					{
						float dftX = frac(randomU + randomV) * 128.0;
						frequencyPosition = dftX / 128.0;
						float4 dftData = AudioLinkLerpMultiline(float2(dftX, 4));
						float audioLinkSample = dftData.r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 2)
					{
						int band = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 3)
					{
						int filteredBand = clamp(floor(poiRand(seedBase + 0.7) * 4.0), 0, 3);
						bandAssignment = filteredBand / 3.0;
						float filteredX = frac(randomU + randomV) * 16.0;
						frequencyPosition = filteredX / 16.0;
						float audioLinkSample = AudioLinkLerp(float2(filteredX, 28 + filteredBand)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 == 4)
					{
						float autocorrX = frac(randomU + randomV) * 128.0;
						frequencyPosition = autocorrX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(autocorrX, 27)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					else if (2.0 >= 5 && 2.0 <= 8)
					{
						int band = 2.0 - 5;
						bandAssignment = band / 3.0;
						float bandX = frac(randomU + randomV) * 128.0;
						frequencyPosition = bandX / 128.0;
						float audioLinkSample = AudioLinkLerp(float2(bandX, band)).r;
						audioLinkHeight = audioLinkSample * 1.0 * CM_TO_M;
					}
					if (0.0 == 1)
					{
						float audioLinkNoise;
						if (1.0 == 5)
						{
							audioLinkNoise = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						}
						else
						{
							int noiseBand = clamp(1.0, 0, 4);
							audioLinkNoise = AudioLinkLerp(float2(0, noiseBand)).r;
						}
						float noiseMultiplier = evalRamp4(audioLinkNoise, float4(1,1,0,1));
						noiseOffset *= noiseMultiplier;
					}
				}
				#endif
				particle.position = floatPos + noiseOffset +moveDir * audioLinkHeight;
				particle.noiseOffset = noiseOffset;
				particle.moveDir = moveDir;
				particle.motionVelocity = motionVelocity;
				particle.rotationSpeed = lerp(float4(-3,3,-20,20).x, float4(-3,3,-20,20).y, rand1.z);
				particle.audioRotationOffset = 0;
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 0.0)
				{
					if (0.0 == 5)
					{
						float normalizedAudioHeight = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
						particle.audioRotationOffset = normalizedAudioHeight * 2.0 * 360;
					}
					else
					{
						int rotationBand = clamp(0.0, 0, 4);
						particle.audioRotationOffset = AudioLinkGetChronoTime(0.0, rotationBand) * 2.0 * 360;
					}
				}
				#endif
				particle.size = lerp(float4(1.5,2,0.01,100).x, float4(1.5,2,0.01,100).y, rand3.y) * CM_TO_M;
				particle.size *= evalRamp4(saturate(progress), float4(1,1,0,1));
				#ifdef POI_AUDIOLINK
				if (audioLinkAvailable && 1.0)
				{
					float audioLinkSize;
					if (0.0 == 5)
					{
						audioLinkSize = audioLinkHeight / max(1.0 * CM_TO_M, 0.001);
					}
					else
					{
						int sizeBand = clamp(0.0, 0, 4);
						audioLinkSize = AudioLinkLerp(float2(0, sizeBand)).r;
					}
					float sizeAdd = evalRamp4(audioLinkSize, float4(0,0,0,1)) * CM_TO_M;
					particle.size = max(0.0001, particle.size + sizeAdd);
				}
				#endif
				particle.progress = progress;
				particle.audioHeight = audioLinkHeight;
				if (2.0 <= 1)
				{
					particle.audioPosition = frequencyPosition;
				}
				else
				{
					particle.audioPosition = bandAssignment;
				}
				particle.particleSeed = seedBase;
				return particle;
			}
			inline void AppendParticleVertex(VertexOut output, float3 worldPosition, float2 quadUV, float2 triCenterUV, int outSet, float3 normalVector, float3 tangentVector, float handedness, float3 camPos, inout TriangleStream<VertexOut> triStream)
			{
				output.worldPos = float4(worldPosition, 1);
				output.localPos = mul(unity_WorldToObject, float4(worldPosition, 1));
				output.pos = PoiWorldToClipPos(worldPosition);
				output.fogData.x = output.pos.z;
				#ifdef FOG_EXP2
				output.fogData.y = 1;
				#else
				output.fogData.y = 0;
				#endif
				POI_TRANSFER_SHADOW(output, output.uv[0].xy);
				output.normal = normalVector;
				output.tangent.xyz = tangentVector;
				output.tangent.w = handedness;
				output.uv[0] = float4(quadUV, quadUV);
				output.uv[1] = float4(quadUV, quadUV);
				if (outSet == 0)
				{
					output.uv[0].xy = triCenterUV;
				}
				else if (outSet == 1)
				{
					output.uv[0].zw = triCenterUV;
				}
				else if (outSet == 2)
				{
					output.uv[1].xy = triCenterUV;
				}
				else if (outSet == 3)
				{
					output.uv[1].zw = triCenterUV;
				}
				triStream.Append(output);
			}
			void RenderParticle(ParticleData particle, VertexOut input[3], inout TriangleStream<VertexOut> triStream)
			{
				float3 camPos = getCameraPosition();
				float3 toCamera = normalize(camPos - particle.position + float3(1e-6, 0, 0));
				float theta = atan2(toCamera.z, toCamera.x);
				float phi = asin(toCamera.y);
				float cosTheta, sinTheta, cosPhi, sinPhi;
				sincos(theta, sinTheta, cosTheta);
				sincos(phi, sinPhi, cosPhi);
				float3 camRight = float3(-sinTheta, 0, cosTheta);
				float3 camUp = float3(-sinPhi * cosTheta, cosPhi, -sinPhi * sinTheta);
				float3 billboardNormal = normalize(camPos - particle.position);
				float3 normalVector = normalize(lerp(billboardNormal, particle.spawnNormal, 0.0));
				float3 tangentVector = normalize(camRight - dot(camRight, normalVector) * normalVector);
				float3 bitangentVector = normalize(cross(normalVector, tangentVector));
				float3 camFacing = normalVector;
				float faceBlend = 0.0;
				float alignAngle = 0;
				if (faceBlend > 0.0001)
				{
					float3 baseMotionDir = particle.moveDir;
					float effectiveProgress = particle.progress;
					if (0.0 == 2) // Ping Pong
					{
						effectiveProgress = sin(particle.progress * UNITY_PI);
					}
					float rampAtP = evalRamp4(saturate(effectiveProgress), float4(0,1,0,1));
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					baseMotionDir = poiSlerpUnitStable(triNormal, baseMotionDir, saturate(rampAtP));
					float2 dir2 = normalize(float2(dot(baseMotionDir, camRight), dot(baseMotionDir, camUp)) + 1e-6);
					alignAngle = atan2(dir2.y, dir2.x);
					if (0.0 == 2) // Ping Pong
					{
						if (particle.motionVelocity < - 0.001)
						{
							alignAngle += UNITY_PI;
						}
					}
					else if (particle.motionVelocity < - 0.001) // Other modes
					{
						alignAngle += UNITY_PI;
					}
				}
				float baseAngle = _Time.y * particle.rotationSpeed + radians(particle.audioRotationOffset);
				float finalAngle = baseAngle + alignAngle * faceBlend;
				float sinAngle, cosAngle;
				sincos(finalAngle, sinAngle, cosAngle);
				float2x2 rotMatrix = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
				float handedness = 1;
				if (dot(cross(tangentVector, bitangentVector), normalVector) < 0)
				{
					handedness = -1;
				}
				float halfSize = particle.size * 0.5f;
				VertexOut outputVertex = input[0];
				#ifdef POI_AUDIOLINK
				float normalizedAudioHeight = saturate(particle.audioHeight / max(1.0 * CM_TO_M, 0.001));
				#else
				float normalizedAudioHeight = 0;
				#endif
				float packedAudio = floor(normalizedAudioHeight * 65535.0) * 65536.0 + floor(particle.audioPosition * 65535.0);
				outputVertex.particleData = float3(-particle.progress - 1.0, packedAudio, poiRand(particle.particleSeed));
				float2 corner0 = mul(rotMatrix, float2(-1, -1) * halfSize);
				float2 corner1 = mul(rotMatrix, float2(1, -1) * halfSize);
				float2 corner2 = mul(rotMatrix, float2(-1, 1) * halfSize);
				float2 corner3 = mul(rotMatrix, float2(1, 1) * halfSize);
				float2 particleSpawnUV = particle.spawnUV;
				float3 worldPos;
				worldPos = particle.position + camRight * corner0.x + camUp * corner0.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
				worldPos = particle.position + camRight * corner2.x + camUp * corner2.y;
				AppendParticleVertex(outputVertex, worldPos, float2(0, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner3.x + camUp * corner3.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 1), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				worldPos = particle.position + camRight * corner1.x + camUp * corner1.y;
				AppendParticleVertex(outputVertex, worldPos, float2(1, 0), particleSpawnUV, 4.0, normalVector, tangentVector, handedness, camPos, triStream);
				triStream.RestartStrip();
			}
			[maxvertexcount(21)]
			void geom(triangle VertexOut input[3], inout TriangleStream<VertexOut> triStream, uint primID : SV_PrimitiveID)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[0]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[1]);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input[2]);
				if (1.0)
				{
					[unroll]
					for (int vertexIndex = 0; vertexIndex < 3; vertexIndex++)
					{
						VertexOut vertex = input[vertexIndex];
						vertex.particleData = float3(0, 0, 0);
						triStream.Append(vertex);
					}
					triStream.RestartStrip();
				}
				if (0.15 <= 0)
				{
					return;
				}
				float3 v0_world = input[0].worldPos.xyz;
				float3 v1_world = input[1].worldPos.xyz;
				float3 v2_world = input[2].worldPos.xyz;
				float triangleArea = length(cross(v1_world - v0_world, v2_world - v0_world)) * 0.5;
				if (0.0 >= 1 && 0.0 > 0.0)
				{
					float3 triNormal = normalize(input[0].normal + input[1].normal + input[2].normal);
					float3 safeWorldDir = float4(0,1,0,0).xyz;
					float lenW = length(safeWorldDir);
					safeWorldDir = (lenW > 1e-4) ? (safeWorldDir / lenW) : float3(0, 1, 0);
					if (dot(triNormal, safeWorldDir) * .5 + .5 < 0.0)
					{
						return;
					}
				}
				float distanceToCamera = length(getCameraPosition() - (v0_world + v1_world + v2_world) / 3.0);
				float desiredCount = (triangleArea * CM2_TO_M2) * 0.15;
				if (0.0 > 0)
				{
					desiredCount *= ((input[0].vertexColor + input[1].vertexColor + input[2].vertexColor) / 3.0)[0.0 - 1];
				}
				#if defined(PROP_PARTICLESPAWNMASK) || !defined(OPTIMIZER_ENABLED)
				float4 avgUV = (input[0].uv[0.0 / 2] + input[1].uv[0.0 / 2] + input[2].uv[0.0 / 2]) / 3.0;
				float2 maskUV;
				if (0.0 % 2 == 0)
				{
					maskUV = avgUV.xy;
				}
				else
				{
					maskUV = avgUV.zw;
				}
				maskUV = maskUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw + _Time.y * float4(0,0,0,0);
				float maskValue = _ParticleSpawnMask.SampleLevel(sampler_linear_repeat, maskUV, 0)[0.0];
				if (0.0)
				{
					desiredCount *= 1.0 - maskValue;
				}
				else
				{
					desiredCount *= maskValue;
				}
				#endif
				if (1.0)
				{
					float distanceInterpolation = saturate((distanceToCamera - float4(3,8,0,0).x) / (float4(3,8,0,0).y - float4(3,8,0,0).x));
					desiredCount *= lerp(float4(1,0,0,0).x, float4(1,0,0,0).y, distanceInterpolation);
				}
				int finalSpawnCount = min(floor(desiredCount + poiRand(float2(primID, primID) + 0.069)), MAX_PARTICLES_PER_TRIANGLE);
				if (finalSpawnCount == 0)
				{
					return;
				}
				float3 normal = normalize(input[0].normal + input[1].normal + input[2].normal);
				float4 avgTangent = (input[0].tangent + input[1].tangent + input[2].tangent) / 3.0;
				float3 tangent;
				if (length(avgTangent.xyz) > 0.0001)
				{
					tangent = normalize(avgTangent.xyz);
				}
				else
				{
					tangent = float3(1, 0, 0);
				}
				float3 bitangent = cross(normal, tangent) * avgTangent.w;
				#ifdef POI_AUDIOLINK
				bool audioLinkAvailable = AudioLinkIsAvailable();
				#else
				bool audioLinkAvailable = false;
				#endif
				[unroll(3)]
				for (int i = 0; i < finalSpawnCount && i < 3; ++i)
				{
					int spawnUvSet = (int)clamp(0.0, 0, 3);
					float4 uvA4 = input[0].uv[spawnUvSet / 2];
					float4 uvB4 = input[1].uv[spawnUvSet / 2];
					float4 uvC4 = input[2].uv[spawnUvSet / 2];
					float2 uvA = (spawnUvSet % 2 == 0) ? uvA4.xy : uvA4.zw;
					float2 uvB = (spawnUvSet % 2 == 0) ? uvB4.xy : uvB4.zw;
					float2 uvC = (spawnUvSet % 2 == 0) ? uvC4.xy : uvC4.zw;
					ParticleData p = GenerateParticle(i, primID, v0_world, v1_world, v2_world, input[0].normal, input[1].normal, input[2].normal, tangent, bitangent, uvA, uvB, uvC, audioLinkAvailable);
					RenderParticle(p, input, triStream);
				}
			}
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			#define POI2D_SAMPLER_STOCHASTIC(tex, texSampler, uv, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, uv) : POI2D_SAMPLER(tex, texSampler, uv))
			#define POI2D_SAMPLER_PAN_STOCHASTIC(tex, texSampler, uv, pan, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan)) : POI2D_SAMPLER_PAN(tex, texSampler, uv, pan))
			#define POI2D_SAMPLER_PANGRAD_STOCHASTIC(tex, texSampler, uv, pan, dx, dy, useStochastic) (useStochastic ? DeliotHeitzSampleTexture(tex, sampler##texSampler, POI_PAN_UV(uv, pan), dx, dy) : POI2D_SAMPLER_PANGRAD(tex, texSampler, uv, pan, dx, dy))
			#endif
			#if !defined(_STOCHASTICMODE_NONE)
			float2 StochasticHash2D2D(float2 s)
			{
				return frac(sin(glsl_mod(float2(dot(s, float2(127.1, 311.7)), dot(s, float2(269.5, 183.3))), 3.14159)) * 43758.5453);
			}
			#endif
			#if defined(_STOCHASTICMODE_DELIOT_HEITZ)
			float3x3 DeliotHeitzStochasticUVBW(float2 uv)
			{
				const float2x2 stochasticSkewedGrid = float2x2(1.0, -0.57735027, 0.0, 1.15470054);
				float2 skewUV = mul(stochasticSkewedGrid, uv * 3.4641 * 1.0);
				float2 vxID = floor(skewUV);
				float3 bary = float3(frac(skewUV), 0);
				bary.z = 1.0 - bary.x - bary.y;
				float3x3 pos = float3x3(
				float3(vxID, bary.z),
				float3(vxID + float2(0, 1), bary.y),
				float3(vxID + float2(1, 0), bary.x)
				);
				float3x3 neg = float3x3(
				float3(vxID + float2(1, 1), -bary.z),
				float3(vxID + float2(1, 0), 1.0 - bary.y),
				float3(vxID + float2(0, 1), 1.0 - bary.x)
				);
				return (bary.z > 0) ? pos : neg;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv, float2 dx, float2 dy)
			{
				float3x3 UVBW = DeliotHeitzStochasticUVBW(uv);
				return mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[0].xy), dx, dy), UVBW[0].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[1].xy), dx, dy), UVBW[1].z) +
				mul(tex.SampleGrad(texSampler, uv + StochasticHash2D2D(UVBW[2].xy), dx, dy), UVBW[2].z) ;
			}
			float4 DeliotHeitzSampleTexture(Texture2D tex, SamplerState texSampler, float2 uv)
			{
				float2 dx = ddx(uv), dy = ddy(uv);
				return DeliotHeitzSampleTexture(tex, texSampler, uv, dx, dy);
			}
			#endif // defined(_STOCHASTICMODE_DELIOT_HEITZ)
			void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiMods poiMods)
			{
				poiFragData.alpha = saturate(poiFragData.alpha + 0.0);
				if (0.0 > 0)
				{
					poiFragData.alpha = maskBlend(poiFragData.alpha, poiMods.globalMask[0.0 - 1], 2.0);
				}
			}
			void poiGeoParticle(VertexOut i, inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
				if (i.particleData.x < 0)
				{
					float progress = -i.particleData.x - 1.0;
					float packedAudio = i.particleData.y;
					float audioLinkHeight = floor(packedAudio / 65536.0) / 65535.0;
					float audioPosition = fmod(packedAudio, 65536.0) / 65535.0;
					float particleSeed = i.particleData.z;
					float frameIndex = 0;
					if (0.0)
					{
						float totalFrames = (0.0 > 0) ? 0.0 : (1.0 * 1.0);
						if (0.0 == 0)
						{
							frameIndex = floor(particleSeed * totalFrames);
						}
						else if (0.0 == 1)
						{
							frameIndex = floor(progress * totalFrames);
						}
						else if (0.0 == 2)
						{
							float timeOffset = 0;
							if (0.0)
							{
								timeOffset = particleSeed * totalFrames;
							}
							frameIndex = floor(fmod(_Time.y * 10.0 + timeOffset, totalFrames));
						}
						#ifdef POI_AUDIOLINK
						if (AudioLinkIsAvailable() && 0.0)
						{
							int spriteBand = clamp(0.0, 0, 3);
							frameIndex = floor(poiMods.audioLink[spriteBand] * totalFrames);
						}
						#endif
						frameIndex = clamp(frameIndex, 0, totalFrames - 1);
					}
					#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
					float3 lifetimeColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(progress, 0.5), 0).rgb;
					#else
					float3 lifetimeColor = float3(1, 1, 1);
					#endif
					float4 randFrag = poiRand4(float2(particleSeed, particleSeed * 1.37));
					float2 alphaRange = float4(1,1,0,0).xy;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable() && 0.0)
					{
						float alphaValue;
						if (0.0 == 5)
						{
							alphaValue = audioLinkHeight;
						}
						else
						{
							int alphaBand = clamp(0.0, 0, 4);
							alphaValue = poiMods.audioLink[alphaBand];
						}
						float alphaAdd = evalRamp4(alphaValue, float4(0,0,0,1));
						alphaRange = saturate(alphaRange + alphaAdd);
					}
					#endif
					float lifetimeAlpha = lerp(alphaRange.x, alphaRange.y, randFrag.y);
					float3 finalColor = float3(1, 1, 1);
					float finalAlpha = 1;
					float emissionBoost = 0;
					#ifdef POI_AUDIOLINK
					if (AudioLinkIsAvailable())
					{
						#if defined(PROP_PARTICLELIFETIMEGRADIENT) || !defined(OPTIMIZER_ENABLED)
						if (2.0 != 2)
						{
							float gradientSample = progress;
							if (2.0 == 0)
							gradientSample = audioPosition;
							else if (2.0 == 1)
							gradientSample = audioLinkHeight;
							float4 alGradientColor = _ParticleLifetimeGradient.SampleLevel(sampler_linear_clamp, float2(gradientSample, 0.5), 0);
							lifetimeColor = alGradientColor.rgb;
						}
						#endif
						if (1.0)
						{
							float emissionValue;
							if (0.0 == 5)
							{
								emissionValue = audioLinkHeight;
							}
							else
							{
								int emissionBand = clamp(0.0, 0, 4);
								emissionValue = poiMods.audioLink[emissionBand];
							}
							emissionBoost += evalRamp4(emissionValue, float4(0,0,0,1));
						}
					}
					#endif
					#if defined(PROP_PARTICLETEXTURE) || !defined(OPTIMIZER_ENABLED)
					float2 lookupUV = poiMesh.uv[0].xy;
					if (0.0)
					{
						float invCols = 1.0 / 1.0;
						float invRows = 1.0 / 1.0;
						float2 frameSize = float2(invCols, invRows);
						float column = fmod(frameIndex, 1.0);
						float row = floor(frameIndex * invCols);
						row = 1.0 - 1 - row;
						lookupUV = (lookupUV * frameSize) + float2(column, row) * frameSize;
						if (0.0 > 0)
						{
							float2 texelInset = (0.0) * frameSize / max(float4(1,1,0,0).xy, 1e-6);
							lookupUV = lerp(lookupUV, (float2(column + 1, row + 1) * frameSize), texelInset);
						}
					}
					lookupUV = lookupUV * float4(1,1,0,0).xy + float4(1,1,0,0).zw;
					float4 particleTex = _ParticleTexture.SampleLevel(sampler_linear_repeat, lookupUV, 0);
					finalColor = particleTex.rgb * lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = particleTex.a * lifetimeAlpha * float4(1,1,1,1).a;
					#else
					finalColor = lifetimeColor.rgb * poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
					finalAlpha = lifetimeAlpha * float4(1,1,1,1).a;
					#endif
					finalAlpha *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 originalColor = poiFragData.baseColor;
					float3 originalEmission = poiFragData.emission;
					poiFragData.baseColor = customBlend(originalColor, finalColor, 0.0, 1.0);
					poiFragData.alpha *= saturate(finalAlpha);
					float emissStrength = lerp(float4(0,0,0,0).x, float4(0,0,0,0).y, randFrag.x) + emissionBoost;
					emissStrength *= evalRamp4(saturate(progress), float4(1,1,0,1));
					float3 particleEmission = finalColor * emissStrength;
					if (0.0 == 0)
					{
						poiFragData.emission = particleEmission;
					}
					else
					{
						poiFragData.emission = originalEmission + particleEmission;
					}
				}
			}
			void ApplyGlobalMaskModifiers(in PoiMesh poiMesh, inout PoiMods poiMods, in PoiCam poiCam)
			{
			}
			float2 calculatePolarCoordinate(in PoiMesh poiMesh)
			{
				float2 delta = poiMesh.uv[0.0] - float4(0.5,0.5,0,0);
				float radius = length(delta) * 2 * 1.0;
				float angle = atan2(delta.x, delta.y);
				float phi = angle / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				angle = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				angle *= 1.0;
				return float2(radius, angle + distance(poiMesh.uv[0.0], float4(0.5,0.5,0,0)) * 0.0);
			}
			float2 MonoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(1.0, 1.0 / UNITY_PI);
				return float2(1.0, 1.0) - sphereCoords;
			}
			float2 StereoPanoProjection(float3 coords)
			{
				float3 normalizedCoords = normalize(coords);
				float latitude = acos(normalizedCoords.y);
				float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
				float phi = longitude / (UNITY_PI * 2.0);
				float phi_frac = frac(phi);
				longitude = fwidth(phi) - 0.0001 < fwidth(phi_frac) ? phi : phi_frac;
				longitude *= 2;
				float2 sphereCoords = float2(longitude, latitude) * float2(0.5, 1.0 / UNITY_PI);
				sphereCoords = float2(0.5, 1.0) - sphereCoords;
				return (sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
			}
			float2 calculateWorldUV(in PoiMesh poiMesh)
			{
				return float2(0.0 != 3 ? poiMesh.worldPos[ 0.0] : 0.0f, 2.0 != 3 ? poiMesh.worldPos[2.0] : 0.0f);
			}
			float2 calculatelocalUV(in PoiMesh poiMesh)
			{
				float localUVs[8];
				localUVs[0] = poiMesh.localPos.x;
				localUVs[1] = poiMesh.localPos.y;
				localUVs[2] = poiMesh.localPos.z;
				localUVs[3] = 0;
				localUVs[4] = poiMesh.vertexColor.r;
				localUVs[5] = poiMesh.vertexColor.g;
				localUVs[6] = poiMesh.vertexColor.b;
				localUVs[7] = poiMesh.vertexColor.a;
				return float2(localUVs[0.0],localUVs[1.0]);
			}
			float2 calculatePanosphereUV(in PoiMesh poiMesh)
			{
				float3 viewDirection = normalize(lerp(getCameraPosition().xyz, _WorldSpaceCameraPos.xyz, 1.0) - poiMesh.worldPos.xyz) * - 1;
				return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), 0.0);
			}
			#if POI_PIPE == POI_BIRP
			float4
			#else
			void
			#endif
			frag( VertexOut i, uint facing : SV_IsFrontFace
			#if POI_PIPE == POI_URP
			,out half4 outNormalWS : SV_Target0
			#endif
			)
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				PoiSHAr = unity_SHAr;
				PoiSHAg = unity_SHAg;
				PoiSHAb = unity_SHAb;
				PoiSHBr = unity_SHBr;
				PoiSHBg = unity_SHBg;
				PoiSHBb = unity_SHBb;
				PoiSHC =  unity_SHC;
				PoiMesh poiMesh;
				PoiInitStruct(PoiMesh, poiMesh);
				PoiLight poiLight;
				PoiInitStruct(PoiLight, poiLight);
				PoiCam poiCam;
				PoiInitStruct(PoiCam, poiCam);
				PoiMods poiMods;
				PoiInitStruct(PoiMods, poiMods);
				#if POI_PIPE == POI_URP
				PoiLightOut poiLightOut;
				PoiInitStruct(PoiLightOut, poiLightOut);
				#endif
				poiMods.globalEmission = 1;
				PoiFragData poiFragData;
				poiFragData.smoothness = 1;
				poiFragData.smoothness2 = 1;
				poiFragData.metallic = 1;
				poiFragData.specularMask = 1;
				poiFragData.reflectionMask = 1;
				poiFragData.emission = 0;
				poiFragData.baseColor = float3(0, 0, 0);
				poiFragData.finalColor = float3(0, 0, 0);
				poiFragData.alpha = 1;
				poiFragData.toggleVertexLights = 0;
				#ifdef POI_UDIMDISCARD
				applyUDIMDiscard(i, facing);
				#endif
				poiMesh.objectPosition = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
				poiMesh.objNormal = mul((float3x3)unity_WorldToObject, i.normal);
				poiMesh.normals[0] = i.normal;
				poiMesh.tangent[0] = i.tangent.xyz;
				poiMesh.binormal[0] = cross(i.normal, i.tangent.xyz) * (i.tangent.w * unity_WorldTransformParams.w);
				poiMesh.worldPos = i.worldPos.xyz;
				poiMesh.localPos = i.localPos.xyz;
				poiMesh.vertexColor = i.vertexColor;
				poiMesh.isFrontFace = facing;
				poiMesh.dx = ddx(poiMesh.uv[0]);
				poiMesh.dy = ddy(poiMesh.uv[0]);
				poiMesh.isRightHand = i.tangent.w > 0.0;
				#ifndef POI_PASS_OUTLINE
				if (!poiMesh.isFrontFace && 1)
				{
					poiMesh.normals[0] *= -1;
					poiMesh.tangent[0] *= -1;
					poiMesh.binormal[0] *= -1;
				}
				#endif
				poiCam.viewDir = !IsOrthographicCamera() ?
				#if defined(USING_STEREO_MATRICES)
				normalize((unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5 - i.worldPos.xyz) :
				#else
				normalize(_WorldSpaceCameraPos - i.worldPos.xyz) :
				#endif
				normalize(UNITY_MATRIX_I_V._m02_m12_m22);
				float3 tanToWorld0 = float3(poiMesh.tangent[0].x, poiMesh.binormal[0].x, poiMesh.normals[0].x);
				float3 tanToWorld1 = float3(poiMesh.tangent[0].y, poiMesh.binormal[0].y, poiMesh.normals[0].y);
				float3 tanToWorld2 = float3(poiMesh.tangent[0].z, poiMesh.binormal[0].z, poiMesh.normals[0].z);
				float3 ase_tanViewDir = tanToWorld0 * poiCam.viewDir.x + tanToWorld1 * poiCam.viewDir.y + tanToWorld2 * poiCam.viewDir.z;
				poiCam.tangentViewDir = normalize(ase_tanViewDir);
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
				poiMesh.lightmapUV = i.lightmapUV;
				#endif
				poiMesh.parallaxUV = poiCam.tangentViewDir.xy / max(poiCam.tangentViewDir.z, 0.0001);
				poiMesh.uv[0] = i.uv[0].xy;
				poiMesh.uv[1] = i.uv[0].zw;
				poiMesh.uv[2] = i.uv[1].xy;
				poiMesh.uv[3] = i.uv[1].zw;
				poiMesh.uv[4] = poiMesh.uv[0];
				poiMesh.uv[5] = poiMesh.uv[0];
				poiMesh.uv[6] = poiMesh.uv[0];
				poiMesh.uv[7] = poiMesh.uv[0];
				poiMesh.uv[8] = poiMesh.uv[0];
				poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
				poiMesh.uv[5] = calculateWorldUV(poiMesh);
				poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
				poiMesh.uv[8] = calculatelocalUV(poiMesh);
				float3 worldViewUp = normalize(float3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, float3(0, 1, 0)));
				float3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
				poiMesh.uv[9] = float2(dot(worldViewRight, poiMesh.normals[0]), dot(worldViewUp, poiMesh.normals[0])) * 0.5 + 0.5;
				poiMods.globalMask[0] = 1;
				poiMods.globalMask[1] = 1;
				poiMods.globalMask[2] = 1;
				poiMods.globalMask[3] = 1;
				poiMods.globalMask[4] = 1;
				poiMods.globalMask[5] = 1;
				poiMods.globalMask[6] = 1;
				poiMods.globalMask[7] = 1;
				poiMods.globalMask[8] = 1;
				poiMods.globalMask[9] = 1;
				poiMods.globalMask[10] = 1;
				poiMods.globalMask[11] = 1;
				poiMods.globalMask[12] = 1;
				poiMods.globalMask[13] = 1;
				poiMods.globalMask[14] = 1;
				poiMods.globalMask[15] = 1;
				ApplyGlobalMaskModifiers(poiMesh, poiMods, poiCam);
				#if POI_PIPE == POI_URP
				InputData inputData;
				PoiInitStruct(InputData, inputData);
				inputData.positionWS = poiMesh.worldPos;
				inputData.normalWS = poiMesh.normals[1];
				inputData.viewDirectionWS = poiCam.viewDir;
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(i.pos);
				#endif
				float2 mainUV = poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0));
				if (0.0)
				{
					mainUV = sharpSample(float4(0.03125,0.03125,32,32), mainUV);
				}
				float4 mainTexture = POI2D_SAMPLER_PAN_STOCHASTIC(_MainTex, _MainTex, mainUV, float4(0,0,0,0), 0.0);
				mainTexture.a = max(mainTexture.a, 0.0);
				#if defined(PROP_BUMPMAP) || !defined(OPTIMIZER_ENABLED)
				poiMesh.tangentSpaceNormal = PoiUnpackNormalScale(POI2D_SAMPLER_PAN_STOCHASTIC(_BumpMap, _MainTex, poiUV(poiMesh.uv[0.0].xy, float4(1,1,0,0)), float4(0,0,0,0), 0.0), 1.0);
				#else
				poiMesh.tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				#endif
				float3 tangentSpaceNormal = UnpackNormal(float4(0.5, 0.5, 1, 1));
				poiMesh.normals[0] = normalize(
				tangentSpaceNormal.x * poiMesh.tangent[0] +
				tangentSpaceNormal.y * poiMesh.binormal[0] +
				tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.normals[1] = normalize(
				poiMesh.tangentSpaceNormal.x * poiMesh.tangent[0] +
				poiMesh.tangentSpaceNormal.y * poiMesh.binormal[0] +
				poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
				);
				poiMesh.tangent[1] = cross(poiMesh.binormal[0], -poiMesh.normals[1]);
				poiMesh.binormal[1] = cross(-poiMesh.normals[1], poiMesh.tangent[0]);
				poiCam.forwardDir = getCameraForward();
				#if defined(USING_STEREO_MATRICES)
				poiCam.worldPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
				#else
				poiCam.worldPos = _WorldSpaceCameraPos;
				#endif
				poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
				poiCam.vertexReflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[0]);
				poiCam.clipPos = i.pos;
				poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
				poiCam.posScreenSpace = poiTransformClipSpacetoScreenSpaceFrag(poiCam.clipPos);
				#ifdef UNITY_SINGLE_PASS_STEREO
				poiCam.posScreenSpace.x = poiCam.posScreenSpace.x * 0.5;
				#endif
				poiCam.screenUV = poiCam.posScreenSpace.xy / poiCam.posScreenSpace.w;
				poiCam.posScreenPixels = calcPixelScreenUVs(poiCam.posScreenSpace);
				poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
				poiCam.worldDirection.xyz = poiMesh.worldPos.xyz - poiCam.worldPos;
				poiCam.worldDirection.w = dot(i.pos, CalculateFrustumCorrection());
				poiFragData.baseColor = mainTexture.rgb;
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.baseColor *= poiThemeColor(poiMods, float4(1,1,1,1).rgb, 0.0);
				poiFragData.alpha = mainTexture.a * float4(1,1,1,1).a;
				#else
				if(_TwoPassOverrideFirstPassColor)
				{
					poiFragData.baseColor *= poiThemeColor(poiMods, _TwoPassColor.rgb, _TwoPassColorThemeIndex);
					poiFragData.alpha = mainTexture.a * _TwoPassColor.a;
				}
				#endif
				if (2.0)
				{
					#if defined(PROP_ALPHAMASK) || !defined(OPTIMIZER_ENABLED)
					float alphaMask = POI2D_SAMPLER_PAN(_AlphaMask, _MainTex, poiUV(poiMesh.uv[0.0], float4(1,1,0,0)), float4(0,0,0,0).xy).r;
					#else
					float alphaMask = 1;
					#endif
					alphaMask = saturate(alphaMask * 1.0 + (0.0 ? 0.0 * - 1 : 0.0));
					if (0.0) alphaMask = 1 - alphaMask;
					if (2.0 == 1) poiFragData.alpha = alphaMask;
					if (2.0 == 2) poiFragData.alpha = poiFragData.alpha * alphaMask;
					if (2.0 == 3) poiFragData.alpha = saturate(poiFragData.alpha + alphaMask);
					if (2.0 == 4) poiFragData.alpha = saturate(poiFragData.alpha - alphaMask);
				}
				applyAlphaOptions(poiFragData, poiMesh, poiCam, poiMods);
				if (0.0 > 0)
				{
					applyToGlobalMask(poiMods, 0.0 - 1, 0.0, i.particleData.x < 0 ? 1.0 : 0.0);
				}
				if (i.particleData.x < 0)
				{
					poiFragData.baseColor = lerp(poiFragData.baseColor, float4(1,1,1,1), 1.0);
				}
				poiGeoParticle(i, poiFragData, poiMesh, poiMods, poiCam);
				#if !defined(POI_PASS_BASETWO) && !defined(POI_PASS_ADDTWO)
				poiFragData.alpha = 0.0 ? 1 : poiFragData.alpha;
				#else
				poiFragData.alpha = _AlphaForceOpaque2 ? 1 : poiFragData.alpha;
				#endif
				if (2.0 == POI_MODE_OPAQUE)
				{
					poiFragData.alpha = 1;
				}
				clip(poiFragData.alpha - 0.0);
				#if POI_PIPE == POI_URP
				float3 normalWS = NormalizeNormalPerPixel(poiMesh.normals[0]);
				outNormalWS = half4(normalWS, 0.0) + POI_SAFE_RGB0;
				#else
				return float4(0, 1, 0, 1);
				#endif
			}
			ENDHLSL
		}
	}
	CustomEditor "Thry.ShaderEditor"
}
