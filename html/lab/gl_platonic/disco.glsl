// disco.glsl
//#vertex
attribute vec3 aPosition;
attribute float aMul;
attribute float aPhase;
attribute vec3 aColor;

uniform mat4 uMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjection;
uniform mat3 uNormalMatrix;

uniform float uRadius;
uniform float uTime;

varying vec3 vColor;
varying float vT;

void main() {
	vColor = aColor;
	vT = sin(uTime * 0.005 + aPhase);
	float m = uRadius + aMul * (1.0 + vT);
	gl_Position = uProjection * uViewMatrix * vec4(aPosition * m, 1.0);
	gl_PointSize = 10.0;
}

//#fragment
precision highp float;
               
uniform vec3 uColor;
uniform float uAlpha;

varying vec3 vColor;
varying float vT;
           
void main() {
	gl_FragColor = vec4(vColor * 2.0, uAlpha * (1.0 - vT));
}