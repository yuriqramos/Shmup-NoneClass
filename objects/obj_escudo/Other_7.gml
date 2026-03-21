///@description Parando a animação

// Para a animação quando ela acabar
image_speed = 0;

// Define o sprite para aparecer (aparece o último sprite)
image_index = image_number - 1;

// Toca o timer para inverter a animação do escudo
alarm[0] = game_get_speed(gamespeed_fps) * 2;