float4x4 matWorld;
float4x4 matWorldViewProj;

struct VS_OUT
{
	float4 Pos : POSITION;
	float4 Norm : TEXCOORD0;
};

VS_OUT Shader_VS(float4 inPos : POSITION, float3 inNormal : NORMAL)
{
	VS_OUT Out = (VS_OUT)0;
	
	Out.Pos = mul(inPos, matWorldViewProj);
	Out.Norm = mul(float4(inNormal, 0.0), matWorld)*0.5+0.5;
	Out.Norm.w = 1.0;	
	return Out;
}

float4 Shader_PS(VS_OUT In) : COLOR
{
	return In.Norm;
}

technique tech_00
{
	pass pass_00
	{
		VertexShader = compile vs_2_0 Shader_VS();
		PixelShader = compile ps_2_0 Shader_PS();
	}
}
