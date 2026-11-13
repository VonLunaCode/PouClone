/// @description Selector táctil de emociones, respiración y reacción al toque.
bob_t += 3;
// También permite probar cada emoción con las teclas 1 a 6.
for (var _i = 0; _i < 6; _i++) {
    if (keyboard_check_pressed(ord("1") + _i)) cambiar_emocion(_i);
}
if (mouse_check_button_pressed(mb_left)) {
    for (var _i = 0; _i < 6; _i++) {
        var _bx = 40 + (_i mod 3) * 220;
        var _by = 850 + floor(_i / 3) * 80;
        if (point_in_rectangle(mouse_x, mouse_y, _bx, _by, _bx + 200, _by + 64)) {
            cambiar_emocion(_i);
        }
    }
    if (point_in_rectangle(mouse_x, mouse_y, x - 180 * base_scale, y + jump_y - 302 * base_scale, x + 180 * base_scale, y + jump_y)) {
        var _snd = reaction_sounds[irandom(array_length(reaction_sounds) - 1)];
        audio_play_sound(_snd, 1, false);
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
