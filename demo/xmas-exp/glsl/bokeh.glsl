// bokeh shader source adapted from http://www.pasteall.org/10779
//#vertex
precision mediump float;


attribute vec2 aPosition;
attribute vec2 aUV;

varying vec2 vUV;

void main(void) {
    gl_Position = vec4(aPosition, 0.0, 1.0);
    vUV = aUV;  
}

//#fragment
precision highp float;

uniform sampler2D uTexture;
uniform sampler2D uDepthTexture;

uniform vec3 uScreenSize;

const float bias = 10.0;//0.01;  // aperture - bigger values for shallower depth of field

varying vec2 vUV;

void main() 
{

	
	vec4 depth = texture2D(uDepthTexture, vUV);
	float factor = 1.0 - depth.r;
	vec2 aspectcorrect = vec2(1.0, uScreenSize.z);
	float dofblur = factor * bias / uScreenSize.x;
	vec4 col = vec4(0.0);
	
	col += texture2D(uTexture, vUV);
	col += texture2D(uTexture, vUV + (vec2( 0.0,0.4 )*aspectcorrect) * dofblur);
	col += texture2D(uTexture, vUV + (vec2( 0.15,0.37 )*aspectcorrect) * dofblur);
	col += texture2D(uTexture, vUV + (vec2( 0.29,0.29 )*aspectcorrect) * dofblur);
	col += texture2D(uTexture, vUV + (vec2( -0.37,0.15 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( 0.4,0.0 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( 0.37,-0.15 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( 0.29,-0.29 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( -0.15,-0.37 )*aspectcorrect) * dofblur);
	col += texture2D(uTexture, vUV + (vec2( 0.0,-0.4 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( -0.15,0.37 )*aspectcorrect) * dofblur);
	col += texture2D(uTexture, vUV + (vec2( -0.29,0.29 )*aspectcorrect) * dofblur);
	col += texture2D(uTexture, vUV + (vec2( 0.37,0.15 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( -0.4,0.0 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( -0.37,-0.15 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( -0.29,-0.29 )*aspectcorrect) * dofblur);	
	col += texture2D(uTexture, vUV + (vec2( 0.15,-0.37 )*aspectcorrect) * dofblur);
	
	col += texture2D(uTexture, vUV + (vec2( 0.15,0.37 )*aspectcorrect) * dofblur*0.9);
	col += texture2D(uTexture, vUV + (vec2( -0.37,0.15 )*aspectcorrect) * dofblur*0.9);		
	col += texture2D(uTexture, vUV + (vec2( 0.37,-0.15 )*aspectcorrect) * dofblur*0.9);		
	col += texture2D(uTexture, vUV + (vec2( -0.15,-0.37 )*aspectcorrect) * dofblur*0.9);
	col += texture2D(uTexture, vUV + (vec2( -0.15,0.37 )*aspectcorrect) * dofblur*0.9);
	col += texture2D(uTexture, vUV + (vec2( 0.37,0.15 )*aspectcorrect) * dofblur*0.9);		
	col += texture2D(uTexture, vUV + (vec2( -0.37,-0.15 )*aspectcorrect) * dofblur*0.9);	
	col += texture2D(uTexture, vUV + (vec2( 0.15,-0.37 )*aspectcorrect) * dofblur*0.9);	
	
	// col += texture2D(uTexture, vUV + (vec2( 0.29,0.29 )*aspectcorrect) * dofblur*0.7);
	// col += texture2D(uTexture, vUV + (vec2( 0.4,0.0 )*aspectcorrect) * dofblur*0.7);	
	// col += texture2D(uTexture, vUV + (vec2( 0.29,-0.29 )*aspectcorrect) * dofblur*0.7);	
	// col += texture2D(uTexture, vUV + (vec2( 0.0,-0.4 )*aspectcorrect) * dofblur*0.7);	
	// col += texture2D(uTexture, vUV + (vec2( -0.29,0.29 )*aspectcorrect) * dofblur*0.7);
	// col += texture2D(uTexture, vUV + (vec2( -0.4,0.0 )*aspectcorrect) * dofblur*0.7);	
	// col += texture2D(uTexture, vUV + (vec2( -0.29,-0.29 )*aspectcorrect) * dofblur*0.7);	
	// col += texture2D(uTexture, vUV + (vec2( 0.0,0.4 )*aspectcorrect) * dofblur*0.7);
			 
	// col += texture2D(uTexture, vUV + (vec2( 0.29,0.29 )*aspectcorrect) * dofblur*0.4);
	// col += texture2D(uTexture, vUV + (vec2( 0.4,0.0 )*aspectcorrect) * dofblur*0.4);	
	// col += texture2D(uTexture, vUV + (vec2( 0.29,-0.29 )*aspectcorrect) * dofblur*0.4);	
	// col += texture2D(uTexture, vUV + (vec2( 0.0,-0.4 )*aspectcorrect) * dofblur*0.4);	
	// col += texture2D(uTexture, vUV + (vec2( -0.29,0.29 )*aspectcorrect) * dofblur*0.4);
	// col += texture2D(uTexture, vUV + (vec2( -0.4,0.0 )*aspectcorrect) * dofblur*0.4);	
	// col += texture2D(uTexture, vUV + (vec2( -0.29,-0.29 )*aspectcorrect) * dofblur*0.4);	
	// col += texture2D(uTexture, vUV + (vec2( 0.0,0.4 )*aspectcorrect) * dofblur*0.4);	
			
	gl_FragColor = col/25.0;//33.0;//41.0;
	gl_FragColor.a = 1.0;
}
