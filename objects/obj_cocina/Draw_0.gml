/// @desc Cocina: nevera, bandeja y comida en arrastre
draw_sprite_ext(spr_nevera, 0, nevera_x, nevera_y, 1.6, 1.6, 0, c_white, 1);

if (bandeja_abierta) {
    draw_set_alpha(0.55);
    draw_set_color(c_black);
    draw_roundrect(30, 870, 690, 1070, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    for (var _i = 0; _i < array_length(comidas); _i++) {
        var _sx = 110 + (_i mod 5) * 125;
        var _sy = 930 + (_i div 5) * 95;
        var _a = (_i == arrastrando) ? 0.35 : 1;
        draw_sprite_ext(comidas[_i], 0, _sx, _sy, 0.8, 0.8, 0, c_white, _a);
    }
}

if (arrastrando >= 0) {
    draw_sprite_ext(comidas[arrastrando], 0, mouse_x, mouse_y, 1.3, 1.3, 0, c_white, 1);
}
