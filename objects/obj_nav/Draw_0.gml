/// @desc Dibuja las puertas y el título del cuarto
var _hh = sprite_get_height(spr_puerta) * door_scale * 0.5;

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var _i = 0; _i < array_length(doors); _i++) {
    var _d = doors[_i];
    var _col = (hover == _i) ? c_white : c_ltgray;
    draw_sprite_ext(spr_puerta, 0, _d.x, _d.y, door_scale, door_scale, 0, _col, 1);
    draw_text(_d.x, _d.y + _hh + 8, _d.label);
}

draw_text_transformed(room_width * 0.5, 24, room_title, 2, 2, 0);
draw_set_halign(fa_left);
