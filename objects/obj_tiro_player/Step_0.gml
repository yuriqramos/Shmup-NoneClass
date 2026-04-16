///@description Se destroi quando sai da room

// Checando se saiu completamente da room
if(y <= -32)
{
	// Se destroi
	instance_destroy();
}

// Fazendo o tiro ficar menor
image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);

// Fazendo o tiro do player ganhar velocidade
vspeed = lerp(vspeed, -10, .1);