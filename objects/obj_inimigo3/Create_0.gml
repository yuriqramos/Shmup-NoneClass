///@description Configurações iniciais

// Variável de vida do inimigo
vida = 10;

// Variável de estado
estado = "chegando"

// variável de tempo do carregamento
tempo_carregando = game_get_speed(gamespeed_fps) * 3;

// Variável de timer do carregamento
timer_carregando = 0

// Máquina de estado
maquina_de_estado = function()
{
	// Switch que checa o valor
	switch(estado)
	{
		// Caso onde ele está chegando na tela
		case "chegando":
		{
			// Se ele não estiver na posição
			if(y < 160)
			{
				// Ele vai descendo pela tela
				vspeed = 1.2;
			}
			else
			{
				// Muda para o estado de carregando
				estado = "carregando";
			}
		}
		// Acabei o case, ele tem que parar
		break;
		
		case "carregando":
		{
			// Para a nave
			vspeed = 0;
			
			timer_carregando++;
			
			if(timer_carregando >= tempo_carregando)
			{
				estado = "atirando";
			}
		}
		
		break;
		
		case "atirando":
		{
			
		}
	}
	
}

// Função de morte do inimigo
morrendo = function ()
{
	// Perdendo vida
	vida--;
	
	// SE naõ tiver mais vida
	if(vida <= 0)
	{
		// Destruindo o inimigo
		sendo_destruido(obj_inimigo_explosao);
	}
}