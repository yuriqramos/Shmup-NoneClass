///@description Checa o movimento e os tiros

//Controlando o jogador
controla_player();

// Mudando o valor do level do meu tiro

// Aumenta o nível quando aperta para cima
if(keyboard_check_pressed(vk_up))
{
	// Se já estiver no nível máximo, deixa no mesmo nível
	if(level_tiro >= 3)
	{
		level_tiro = 3;
	}
	// Se não, só aumenta
	else
	{
		level_tiro++;
	}
}

// Diminui o nível quando aperta para baixo
if(keyboard_check_pressed(vk_down))
{
	// Se já estiver no nível mínimo, deixa no mesmo nível
	if(level_tiro <= 1)
	{
		level_tiro = 1;
	}
	// Se não, só diminui
	else
	{
		level_tiro--;
	}

}