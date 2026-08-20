///@description Criando o rastro

// Não roda com hitstop ativo
if(global.hitstop) exit;

// Diminui o alpha para sumir
image_alpha -= 0.1;

// Diminui o rastro do tiro 
image_xscale -= 0.1;
image_yscale -= 0.1;

// Limita o tamanho
image_xscale = clamp(image_xscale, 0, image_xscale);
image_yscale = clamp(image_yscale, 0, image_yscale);

// Se o rastro sumir totalmente, deleta ele
if(image_alpha <= 0) instance_destroy();