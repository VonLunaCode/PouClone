/// @description Emociones de Pou: un objeto y seis fotogramas.
enum PouEmocion { Normal, Feliz, Serio, Triste, Hambriento, Enfermo }
base_scale = 1.2;
squash_t = 0;
bob_t = random(360);
jump_y = 0;
jump_vy = 0;
home_y = y;
reaction_sounds = [snd_pou_toque, snd_pou_hablar, snd_pou_pregunta];
emocion_nombres = ["Normal", "Feliz", "Serio", "Triste", "Hambriento", "Enfermo"];
sprite_index = spr_pou_emociones;
image_speed = 0;
emocion_temp_t = 0;       // fotogramas que dura la emoción temporal (reacción al toque)
toques = [];              // marcas de tiempo (ms) de los últimos toques sobre Pou
mostrar_selector = false; // botones de prueba de emociones; F1 los muestra u oculta
if (!variable_global_exists("pou_emocion")) global.pou_emocion = PouEmocion.Normal;
/// @function cambiar_emocion(_emocion)
/// @param {Real} _emocion Valor de PouEmocion (0 a 5).
cambiar_emocion = function(_emocion) {
    emocion = clamp(floor(_emocion), 0, 5);
    image_index = emocion;
    global.pou_emocion = emocion;
    emocion_temp_t = 0;
};
/// @function reaccionar_emocion(_emocion, _frames)
/// @description Muestra una emoción pasajera sin cambiar la emoción de fondo.
/// @param {Real} _emocion Valor de PouEmocion (0 a 5).
/// @param {Real} _frames Fotogramas que dura antes de volver a la emoción de fondo.
reaccionar_emocion = function(_emocion, _frames) {
    emocion = clamp(floor(_emocion), 0, 5);
    image_index = emocion;
    emocion_temp_t = _frames;
};
cambiar_emocion(global.pou_emocion);
