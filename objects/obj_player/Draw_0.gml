///@description Desenhando a UI e debug


draw_self();

// Ativa e desativa o debug
if(global.debug)
{
	// Debug do level do tiro
	draw_text(x, y + 10, level_tiro);
}