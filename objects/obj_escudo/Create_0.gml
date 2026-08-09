///@description Configurações iniciais

// Aumentando o tamanho da sprite
image_xscale = 1.2  // Escala X
image_yscale = 1.2  // Escala Y

// Timer e tempo do escudo
escudo_tempo = game_get_speed(gamespeed_fps) * 2;  // 2 seg
escudo_timer = escudo_tempo;

// Variável para marcar se o som foi tocado
toquei_som = false;