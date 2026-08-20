///@description Desenhando o rastro

// Mudando a forma com o computador processa as cores
gpu_set_blendmode(bm_add);

// Desenhando outra sprite de tiro por cima da original
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, cor, image_alpha);

// Resetando o blend mode
gpu_set_blendmode(bm_normal);
