// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

#if !defined(MY_SHADOWS_INCLUDED)
#define MY_SHADOWS_INCLUDED

#include "UnityCG.cginc"

struct VertexData {
    float4 position : POSITION;
    float3 normal : NORMAL;
};

float4 MyShadowVertexProgram (VertexData v) : SV_POSITION {
    //normal bias 
    float4 position = UnityClipSpaceShadowCasterPos(v.position.xyz, v.normal);
    //linear shadow bias
    return UnityApplyLinearShadowBias(position);
}

half4 MyShadowFragmentProgram () : SV_TARGET {
    return 0;
}

#endif