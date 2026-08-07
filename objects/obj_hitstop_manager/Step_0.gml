show_debug_message(global.hitstop);

// Se o hitstop está ativo, timer ativa
hitstop_desfazendo();

// Ativando o hitstop quando quiser
if(keyboard_check_pressed(vk_numpad5))
{
    global.hitstop = true;
    timer_hitstop = 60;
}