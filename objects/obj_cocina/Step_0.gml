/// @desc Cocina: abrir nevera, arrastrar comida y dársela a Pou
var _mx = mouse_x;
var _my = mouse_y;

if (mouse_check_button_pressed(mb_left)) {
    if (abs(_mx - nevera_x) < 60 && abs(_my - nevera_y) < 85) {
        bandeja_abierta = !bandeja_abierta;
        audio_play_sound(snd_click, 1, false);
    } else if (bandeja_abierta && arrastrando < 0) {
        for (var _i = 0; _i < array_length(comidas); _i++) {
            var _sx = 110 + (_i mod 5) * 125;
            var _sy = 930 + (_i div 5) * 95;
            if (point_in_rectangle(_mx, _my, _sx - 50, _sy - 50, _sx + 50, _sy + 50)) {
                arrastrando = _i;
                break;
            }
        }
    }
}

if (arrastrando >= 0 && mouse_check_button_released(mb_left)) {
    var _p = instance_find(obj_pou, 0);
    if (_p != noone) {
        var _s = _p.base_scale;
        var _sobre_pou = point_in_rectangle(_mx, _my,
            _p.x - 180 * _s, _p.y + _p.jump_y - 302 * _s,
            _p.x + 180 * _s, _p.y + _p.jump_y);
        if (_sobre_pou) {
            audio_play_sound(comer_sonidos[irandom(array_length(comer_sonidos) - 1)], 1, false);
            _p.reaccionar_emocion(PouEmocion.Feliz, 150);
            _p.squash_t = 1;
            _p.jump_vy = -6;
            total_comido++;
        }
    }
    arrastrando = -1;
}
