///@description Checa a animação para deletar o escudo

// Checa se a animação foi invertida E se acabou
if(image_index <= 1 && image_speed < 0)
{
	// Deleta o escudo
	instance_destroy();
}