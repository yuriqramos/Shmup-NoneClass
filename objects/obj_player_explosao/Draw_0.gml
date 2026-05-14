///@description Desenhando o efeito da eplosão

// Se desenhando primeiro
draw_self();

// Desenhando o efeito de brilho
gpu_set_blendmode(bm_add);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.2, image_yscale * 1.2, image_angle, c_fuchsia, 1);

// Resetando o efeito
gpu_set_blendmode(bm_normal);