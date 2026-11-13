/// @desc Detecta hover y clic en las puertas
hover = -1;
var _hw = sprite_get_width(spr_puerta) * door_scale * 0.5;
var _hh = sprite_get_height(spr_puerta) * door_scale * 0.5;

for (var _i = 0; _i < array_length(doors); _i++) {
    var _d = doors[_i];
    if (point_in_rectangle(mouse_x, mouse_y, _d.x - _hw, _d.y - _hh, _d.x + _hw, _d.y + _hh)) {
        hover = _i;
        if (mouse_check_button_pressed(mb_left)) {
            audio_play_sound(snd_click, 1, false);
            room_goto(_d.target);
        }
    }
}
