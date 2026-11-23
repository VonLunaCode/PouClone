/// @description Reacción al toque, cosquillas, respiración y selector de emociones (depuración).
bob_t += 3;
// F1 muestra u oculta los botones de prueba; las teclas 1 a 6 cambian la emoción de fondo.
if (keyboard_check_pressed(vk_f1)) mostrar_selector = !mostrar_selector;
for (var _i = 0; _i < 6; _i++) {
    if (keyboard_check_pressed(ord("1") + _i)) cambiar_emocion(_i);
}
// La emoción pasajera vuelve a la de fondo al terminar.
if (emocion_temp_t > 0) {
    emocion_temp_t--;
    if (emocion_temp_t == 0) {
        emocion = global.pou_emocion;
        image_index = emocion;
    }
}
if (mouse_check_button_pressed(mb_left)) {
    if (mostrar_selector) {
        for (var _i = 0; _i < 6; _i++) {
            var _bx = 40 + (_i mod 3) * 220;
            var _by = 850 + floor(_i / 3) * 80;
            if (point_in_rectangle(mouse_x, mouse_y, _bx, _by, _bx + 200, _by + 64)) {
                cambiar_emocion(_i);
            }
        }
    }
    if (point_in_rectangle(mouse_x, mouse_y, x - 180 * base_scale, y + jump_y - 302 * base_scale, x + 180 * base_scale, y + jump_y)) {
        // Guarda el toque y descarta los de hace más de 2 segundos.
        var _ahora = current_time;
        array_push(toques, _ahora);
        while (array_length(toques) > 0 && _ahora - toques[0] > 2000) array_delete(toques, 0, 1);
        if (array_length(toques) >= 5) {
            // Cosquillas: 5 toques en 2 s y Pou se pone serio.
            audio_play_sound(snd_pou_rascar, 1, false);
            reaccionar_emocion(PouEmocion.Serio, 120);
            toques = [];
        } else {
            var _snd = reaction_sounds[irandom(array_length(reaction_sounds) - 1)];
            audio_play_sound(_snd, 1, false);
            reaccionar_emocion(PouEmocion.Feliz, 90);
        }
        squash_t = 1;
        jump_vy = -9;
    }
}
if (jump_vy != 0 || jump_y < 0) {
    jump_y += jump_vy;
    jump_vy += 1;
    if (jump_y >= 0) { jump_y = 0; jump_vy = 0; }
}
squash_t = max(0, squash_t - 0.04);
