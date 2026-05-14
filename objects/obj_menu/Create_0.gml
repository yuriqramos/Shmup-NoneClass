///@description Configurações iniciais

#region Variávels

// Array para as opções do menu
menu = ["Jogar", "Tutorial", "Sair"];

// Quantidade de itens no menu
menu_tamanho = array_length(menu);

// Variável da opção selecionada
atual = 0;

// Variável da margem
margem = 20;

#endregion

#region Métodos

controla_menu = function()
{	
	// Descendo pelo menu
	if(keyboard_check_pressed(vk_down) && atual < menu_tamanho - 1) 
	{
		// Aumenta a variável para mover a seleção
		atual++;
	
		// Toca o áudio do menu
		efeito_som(sfx_zap, .1);
	
		// Reincia a margem
		margem = 0;
	}
	
	// Subindo pelo menu
	if(keyboard_check_pressed(vk_up) && atual > 0) 
	{
		// Diminui a variável para mover a seleção
		atual--;
	
		// Toca o áudio
		efeito_som(sfx_zap, .1);
	
		// Reinicia a margem
		margem = 0;
	}

	// Faz um lerp para a margem se mover lentamente
	margem = lerp(margem, 20, .1);
	
	// Checa se o menu foi pressionado
	if(keyboard_check_pressed(vk_enter))
	{
		ativa_menu();
	}
}

desenha_menu = function()
{
	// Meio da tela
	var _meio_tela = display_get_gui_height() / 2;

	// Altura da fonte
	var _fonte_altura = string_height("I");

	// ALinhando o texto
	draw_set_valign(1);

	// Definindo a fonte
	draw_set_font(fnt_menu);

	// Desenhando as opções do menu com um laço for
	for(var i = 0; i < menu_tamanho; i++)
	{
		// Variável de cor de texto (o padrão é branco)
		var _cor = c_white;
	
		// Variável da margem
		var _margem_selec = 0;
	
		// Checa a opção que está ativa no momento
		if(i == atual) 
		{
			// Define a cor para vermelho
			_cor = c_red;
		
			// Define o espaço do texto
			_margem_selec = margem;
		}

		// Definindo a cor do texto
		draw_set_colour(_cor);
	
		// Desenhando o texto
		draw_text(20 + _margem_selec, _meio_tela / 1.5 + (i * _fonte_altura * 3), menu[i]);
	
		// Reiniciando a cor
		draw_set_color(-1);
	}

	// Resetando o alinhamento
	draw_set_valign(0);

	// Resetando a fonte
	draw_set_font(-1);
}

ativa_menu = function()
{
	// Opçoes do menu com switch
	switch(atual)
	{
		// Jogar
		case 0:
			
			// Criando a transição
			criando_transicao(sq_transicao_abrindo);
			
			// Mudando a sala de destino
			global.destino = rm_jogo;
			
		break; 
		
		// Tutorial
		case 1:
			
			// Criando a transição
			criando_transicao(sq_transicao_abrindo);
			
			// Mudando a sala de destino
			global.destino = rm_tutorial;
			
		break;
		
		// Sair
		case 2:
		
			game_end();
			
		break;
	}
}

#endregion