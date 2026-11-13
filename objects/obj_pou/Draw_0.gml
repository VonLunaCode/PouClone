/// @description Pou con anclaje a los pies y selector de emociones.
var _breath = dsin(bob_t) * 0.03;
var _react = dsin(squash_t * 720) * 0.12 * squash_t;
var _sx = base_scale * (1 - _breath + _react);
var _sy = base_scale * (1 + _breath - _react);
draw_set_alpha(0.2);
draw_set_color(c_black);
draw_ellipse(x - 155, home_y - 12, x + 155, home_y + 14, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite_ext(sprite_index, image_index, x, y + jump_y, _sx, _sy, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
for (var _i = 0; _i < 6; _i++) {
    var _bx = 40 + (_i mod 3) * 220;
    var _by = 850 + floor(_i / 3) * 80;
    draw_set_color((_i == emocion) ? make_color_rgb(75, 98, 64) : make_color_rgb(245, 240, 223));
    draw_roundrect(_bx, _by, _bx + 200, _by + 64, false);
    draw_set_color((_i == emocion) ? c_white : c_black);
    draw_text_transformed(_bx + 100, _by + 32, emocion_nombres[_i], 1.4, 1.4, 0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
