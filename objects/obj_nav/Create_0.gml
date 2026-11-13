/// @desc Puertas de navegación según el cuarto actual
door_scale = 1.3;
hover = -1;

switch (room) {
    case rm_sala:
        room_title = "Sala";
        doors = [
            { label: "Cocina", target: rm_cocina, x: 150, y: 1110 },
            { label: "Baño",   target: rm_bano,   x: 570, y: 1110 }
        ];
        break;
    case rm_cocina:
        room_title = "Cocina";
        doors = [ { label: "Sala", target: rm_sala, x: 150, y: 1110 } ];
        break;
    default:
        room_title = "Baño";
        doors = [ { label: "Sala", target: rm_sala, x: 150, y: 1110 } ];
        break;
}

// La room conserva 720x1280; la ventana de escritorio se ajusta a la pantalla.
if (os_type == os_windows) {
    var _scale = min(0.75, (display_get_height() - 140) / 1280);
    window_set_size(round(720 * _scale), round(1280 * _scale));
    window_center();
}
