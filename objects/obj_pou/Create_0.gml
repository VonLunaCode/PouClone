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
if (!variable_global_exists("pou_emocion")) global.pou_emocion = PouEmocion.Normal;
/// @function cambiar_emocion(_emocion)
/// @param {Real} _emocion Valor de PouEmocion (0 a 5).
cambiar_emocion = function(_emocion) {
    emocion = clamp(floor(_emocion), 0, 5);
    image_index = emocion;
    global.pou_emocion = emocion;
};
cambiar_emocion(global.pou_emocion);
