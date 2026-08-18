///@description Configurações iniciais

// Variável do tempo para atirar (1 seg)
tempo_tiro = 60;             // Tempo
timer_tiro = tempo_tiro;     // Timer 

// Descobrindo se eu fui criado em uma sequência
criado_em_sequencia = in_sequence;

// Método de tiro
atirando = function()
{
    // Checa se o inimigo está dentro da tela
    if(x < room_width && x > 0 && y > 0 && y < room_height)
    {
   	    // Cria a instância do tiro
   	    var _tiro = instance_create_layer(x, y, "tiros", obj_inimigo1_tiro);
        
        // Define a velv do tiro
        _tiro.velv = _tiro.vel;
        
        // Toca o efeito sonoro
	   efeito_som(sfx_laser2, .1);
    }
}

// Método do timer do tiro
timer_atirando = function()
{
    // Diminuindo o timer
    timer_tiro--;
    
    // Checa se o timer acabou
    if (timer_tiro <= 0)
    {
        // Chama o tiro
        atirando();
        
        // Redefine o timer (temmpo aleatorio entre 1 a 3 seg)
        timer_tiro = tempo_tiro * random_range(1, 3);
    }
}

// Método de morte e criação do powerup
morrendo = function()
{
	// Cria a explosão do jogador
	sendo_destruido(obj_inimigo_explosao);
	
	// Treme a tela
	tremendo_tela(5);
    
    // Hitstop
    hitstop_ativa(3);
	
	//Efeito sonoro
	efeito_som(sfx_explosion, 0.1);
	
	// Variável de chance de criar o powerup
	var _chance = random(100);
	
	// Cria o powerup se caso o jogador tiver a chance (10%¨de chance)
	if(_chance > 90)
	{
		// Cria o powerup
		instance_create_layer(x, y, "powerups", obj_powerup_tiro);
	}
}


// Toca o alarme pela primeira vez (em 2 seg)
//alarm[0] = tempo_alarme * 2;