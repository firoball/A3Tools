// VARIABLES

	float4x4 matWorldViewProj;
	float4 vecViewPort;
	float4 vecSkill1; // x: image width, y: image height, z,w: ang(camera.pan) & -tilt
	
	float a3_sky_res_flt;
	float a3_sky_tilt_speed_flt;
	float a3_sky_vert_scale_flt;
	float a3_sky_horizon_offset_flt;

// CONSTANTS

	static const float4x4 pMatrix = { 0.5,  0.0, 0, 0,
	                                  0.0, -0.5, 0, 0,
	                                  0.0,  0.0, 1, 0,
	                                  0.5,  0.5, 0, 1 };
	                                  
// VERTEX SHADER	                                 

	struct VS_OUT
	{
		float4 Pos :  POSITION;
		float4 Tex :  TEXCOORD0;
		float4 Coord: TEXCOORD1;
	};
	
	VS_OUT VS (float4 pos : POSITION, float4 tex : TEXCOORD0)
	{
		VS_OUT Out = (VS_OUT)0;
	
		Out.Pos = mul(pos, matWorldViewProj);
		Out.Tex = Out.Pos;
		
		Out.Coord = tex;
	
		return(Out);
	}
	
// PIXEL SHADER

	// Sky image
	texture mtlSkin1;
	sampler2D smpSky = sampler_state
	{
		texture = <mtlSkin1>;
		AddressU	= wrap;
		AddressV	= clamp;
	};
	
	float4 PS (VS_OUT In) : COLOR
	{
		float4 coord = In.Tex;
		coord /= coord.w; // pull into screen-space
		
		// horizon alignment
		coord.y -= (a3_sky_horizon_offset_flt * 0.5 * a3_sky_vert_scale_flt);
		
		// offset by camera angle
		coord.x -= vecSkill1.z;
		coord.y += vecSkill1.w * a3_sky_tilt_speed_flt;
		
		// stretch to be a cylinder
		coord.x /= 2;
		
		// screen resolution adjustment
		coord.y /= vecSkill1.y / (a3_sky_res_flt * (vecViewPort.y / vecViewPort.x));
		coord.y /= a3_sky_vert_scale_flt;
		
		
		// sample sky
		float4 sky = tex2D(smpSky, mul(coord, pMatrix));
		
		
		return(sky);
	}
	
// ENTRANCE POINT

	technique t
	{
		pass p
		{
			ZWriteEnable = true;
	
			VertexShader = compile vs_2_0 VS();
			PixelShader  = compile ps_2_0 PS();
		}
	}