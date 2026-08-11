///@description Configurações iniciais

// Variável do timer
timer_hitstop = 0;

// Lista dos backgrounds
lista_backgrounds = pega_backgrounds();

// Módulo de timer do hitstop
hitstop_desfazendo = function()
{
    // Se o hitstop não estiver ativo, retorna
    if(!global.hitstop) return;
        
    // Timer vai diminuindo
    timer_hitstop--;
    
    // Parando a animação de todos os objetos
    with(all) image_speed = 0;
        
    // Se o timer zerar, desativa o hitstop
    if (timer_hitstop <= 0)
    {
        // Hitstop desativado
        global.hitstop = false;
        
        // Ativa a animação de todo mundo novamente
        with(all) image_speed = 1;    
    }
}