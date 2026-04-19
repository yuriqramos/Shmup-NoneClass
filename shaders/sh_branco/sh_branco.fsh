//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Salva como a sprite é desenhada normalmente
	vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Muda a sprite para toda branca
	cor.rgb = vec3(1.0, 1.0, 1.0);
	
	// Define a cor do jogador
    gl_FragColor = cor;
}
