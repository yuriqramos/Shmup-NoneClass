///@description Desenhando a UI

// Ativa e desativa o debug
if(global.debug)
{
	// Debug do level do tiro
	draw_text(x, y + 10, level_tiro);
}

// Variáveis com o tamanho do display
var _altura_display = display_get_gui_height() - 20;

// Variável para incrementar o loop
var _incremento = 1;

// Desenhando a vida do player com o laço repeat
repeat(vidas)
{
	// Desenha a vida
	draw_sprite_ext(spr_gui_vidas, 0, 25 * _incremento, _altura_display, 1, 1, 0, c_white, 1);
	
	// Incremento do loop para mudar a posição das vidas em X
	_incremento++;
}