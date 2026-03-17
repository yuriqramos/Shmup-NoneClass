///@description Desenhando a UI

// Ativa e desativa o debug
if(global.debug)
{
	// Debug do level do tiro
	draw_text(x, y + 10, level_tiro);
}

// Variável de tamanho da tela para a GUI
var _altura_tela = display_get_gui_height();

// Desenha os ícones de vida
desenha_icones(spr_gui_vidas, vidas, _altura_tela - 80);

// Desenha os ícones de escudo
desenha_icones(spr_gui_escudos, escudos, _altura_tela - 40);