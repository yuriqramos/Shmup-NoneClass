///@description Efeito do tiro

// Se desenhando
draw_self();

// Mudando a forma com o computador processa as cores
gpu_set_blendmode(bm_add);

// Desenhando outra sprite de tiro por cima da original
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, 
				image_angle, cor, 0.5);

// Resetando o blend mode
gpu_set_blendmode(bm_normal);
