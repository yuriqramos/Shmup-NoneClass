///@description Sistema de movimentação do jogador

// Iniciando as ariávels

#region Variáveis

// Velocidade do jogador
vel_jogador = 3;

// Velocidade dos tiros
vel_tiros = -10

// Vidas
vidas = 3;

// Escudos
escudos = 3;

meu_escudo = noone;

// Espera dos tiros
espera_tiro = 10;

// Ttimer dos tiroseee
timer_tiro = 0;

// Tempo de invencibilidade
tempo_invencivel = game_get_speed(gamespeed_fps);

// Timer de invencibilidade
timer_invencivel = 0

// Level do meu tiro
level_tiro = 1;

#endregion

// Método de controle do jogador

#region Métodos

	#region Controles do jogador
	
	controla_player = function()
	{
		#region Definindo as teclas
	
		// Pegando as teclas
		var _cima, _baixo, _esqu, _dire, _atirar, _escudo;
	
		// Indo para cima (tecla W ou Cima)
		_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	
		// Indo para baixo (tecla S ou Baixo)
		_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	
		// Indo para esquerda (tecla A ou Esquerda)
		_esqu = keyboard_check(ord("A")) or keyboard_check(vk_left);
	
		// Indo para a direita (tecla D ou Direita)
		_dire = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
		// Atirando (tecla Espaço ou botão esquerdo do mouse)
		_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
		
		// Usando o escudo
		_escudo = keyboard_check_pressed(ord("E"));
	
		#endregion
	
		#region Movimentação horizontal
	
		// Velocidade horizontal
		var _velh = (_dire - _esqu) * vel_jogador;
	
		// Se movendo no X
		x += _velh;
	
		#endregion
	
		#region Movimentação vertical
	
		// Velocidade vertical
		var _velv = (_baixo - _cima) * vel_jogador;
	
		// Se movendo em Y
		y += _velv;
	
		#endregion
	
		#region Tiros do jogador
	
		// Diminuindo o timer dos tiros
		timer_tiro--;
	
		// Criando o tiro quando aperta a tecla e se o timer estiver zerado
		if (_atirar && timer_tiro <= 0)
		{	
			// Checando o nível do tiro
			if(level_tiro == 1)
			{
				// Criando o tiro no meio
				tiro_meio();
			}
			else if(level_tiro == 2)
			{
				// Criando o tiro nos lados
				tiros_lados();
			}
			else if(level_tiro == 3)
			{
				// Criando os 3 tiros
				tiros_maximo();
			}
		
			// Definindo o timer dos tiros com o tempo de espera
			timer_tiro = espera_tiro;
		}
	
		#endregion
	
		#region Limites de tela
	
		// Limitando a nave no eixo X para dentro da tela
		x = clamp(x, sprite_width / 2, room_width - (sprite_width / 2));
	
		// Limitando a nave no eixo Y para dentro da tela
		y = clamp(y, sprite_height / 2, room_height - (sprite_height / 2));
	
		#endregion
		
		#region Invincibilidade e escudo
		
		// Checa se apertou a tecla para usar o escudo
		if(_escudo)
		{
			// Cria o escudo
			usa_escudo();	
		}
		
		// Diminui o timer invencível
		timer_invencivel--;
		
		// Método que checa se o escudo está sendo usado
		com_escudo();
		
		#endregion
	}
	
	#endregion

	#region Criando os tiros
	
	tiro_meio = function()
	{
		// Criando o tiro no meio da nave
		var _tiro = instance_create_layer(x, y - 3, "tiros", obj_tiro_player);
		
		// Definindo a velocidade
		_tiro.vspeed = vel_tiros;
	}
	
	tiros_lados = function()
	{
		// Criando o tiro no lado esquerdo
		var _tiro_esqu = instance_create_layer(x - 7, y, "tiros", obj_tiro_player);
		
		// Definindo a velocidade do tiro da esquerda
		_tiro_esqu.vspeed = vel_tiros;
		
		// Criando o tiro no lado direito
		var _tiro_dire = instance_create_layer(x + 7, y, "tiros", obj_tiro_player);
		
		// Definindo a velocidade do tiro da esquerda
		_tiro_dire.vspeed = vel_tiros;
	}
	
	tiros_maximo = function()
	{
		// Criando o tiro do meio
		tiro_meio();
		
		// Criando os tiros do lado
		tiros_lados();
	}
	
	ganha_level_tiro = function()
	{
		// Checa se já está no level máximo
		if(level_tiro >= 3)
		{
			// Limita o level máximo
			level_tiro = 3;
		}
		else
		{
			// Aumenta o level
			level_tiro++;
		}
	}
	
	#endregion
	
	#region Desenhando os ícones
	
	// Função com três parâmetros, icone pega o sprite, qtd para a quantidade e pos_y para a posição no eixo y
	desenha_icones = function(_icone = spr_icone_vida, _qtd = vidas, _pos_y = 0)
	{	
		// Variável da altura da tela
		var _altura_tela = display_get_gui_height();
		
		// Variável de espaçamento entre os ícones
		var _espacamento = 1;
		
		// Desenhando os ícones com o laço repeat
		repeat(_qtd)
		{
			// Desenha os ícone
			draw_sprite_ext(_icone, 0, 40 * _espacamento, _pos_y, 1.5, 1.5, 0, c_white, 1);
	
			// Incremento do espaçamento para mudar a posição em X
			_espacamento++;
		}
	}
	
	#endregion
	
	#region Perde vida
	
	perde_vida = function()
	{
		// Se o jogador estiver invencível, sai da função
		if(timer_invencivel > 0) return; 
		
		// Tremendo a tela quando leva dano
		tremendo_tela(20);
		
		// Checa se o jogador ficou sem vidas
		if(vidas <= 0)
		{
			// Destrói o jogador
			instance_destroy();
			
			// Treme a tela mais forte
			tremendo_tela(50);
		}
		else
		{
			// Diminui a vida do jogador
			vidas--;
			
			// Começa o tempo de invencibilidade
			timer_invencivel = tempo_invencivel;
		}
	
	}
	
	#endregion
	
	#region Usa escudo
	
	usa_escudo = function()
	{
		// Checa se o jogador ainda tem escudos e não tiver escudo ativo
		if (escudos > 0 && meu_escudo == noone)
		{
			// Diminui a quantidade de escudos
			escudos--;
		
			// Cria o escudo
			meu_escudo = instance_create_layer(x, y, "escudo", obj_escudo);
		}
	}
	
	#endregion
	
	#region Com escudo
	
	com_escudo = function()
	{
		// Checa se o jogador tem um escudo
		if(instance_exists(meu_escudo))
		{
			// Faz o escudo seguir o jogador
			meu_escudo.x = x;
			meu_escudo.y = y;
	
			// Define o timer de invencibilidade
			timer_invencivel = tempo_invencivel;
		}
		else
		{
			// Define o escudo como vazio
			meu_escudo = noone;
		}
	}
	
	#endregion

#endregion