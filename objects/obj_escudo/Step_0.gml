///@description Checa a animação para deletar o escudo

// Não roda se estiver no hitstop
if(global.hitstop) exit;

// Checa se a animação foi invertida E se acabou
if(image_index <= 1 && image_speed < 0)
{
	// Deleta o escudo
	instance_destroy();
}

//Tempo vai diminuindo
escudo_timer--;

// Se acabou o tempo, diminui o image_speed
if (escudo_timer <= 0)
{
    // Inverte a animação
    image_speed = -1;
    
    // Toca o som apenas uma vez
    // Se não tiver tocado, toca
    if(!toquei_som)
    {
        // Toca o som
        efeito_som(sfx_shieldDown);
        
        // Marca a flag como true para não tocar de novo
        toquei_som = true;
    }
}