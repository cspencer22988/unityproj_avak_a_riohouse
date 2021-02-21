Shader "Lockwood/VertexBend_Unlit_Alpha" {
	Properties {
		_MainTex ("Base (RGBA)", 2D) = "white" {}
		_WindDirection ("Wind Direction", Vector) = (1,1,1,1)
		_WindEdgeFlutterFreqScale ("Wind edge fultter freq scale", Float) = 0.5
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Transparent-1" "RenderType" = "Transparent" }
		Pass {
			LOD 100
			Tags { "QUEUE" = "Transparent-1" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			GpuProgramID 17915
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
	Fallback "Lockwood/Mobile/VertexBlend_2Tex"
}