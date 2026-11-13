# PouClone

Proyecto escolar de mascota virtual para GameMaker, orientado a móviles.

## Abrir y ejecutar

1. Clona este repositorio o descarga su ZIP.
2. Abre `PouClone.yyp` con GameMaker 2024.14.4 (IDE de referencia: 2024.14.4.222; runtime: 2024.14.4.268).
3. Presiona **F5** para ejecutar en Windows. Las habitaciones usan 720 × 1280, en vertical.

Incluye sala, cocina y baño, navegación, reacciones con sonido y un selector de seis emociones en `obj_pou`. Las teclas **1–6** también permiten seleccionar emociones. El despliegue en un teléfono todavía no está validado.

## Trabajo del equipo

Cada integrante debe trabajar en una rama y abrir un pull request hacia `main`. Antes de empezar, actualicen su copia y acuerden qué objetos, sprites o rooms editará cada persona. Eviten modificar simultáneamente la misma room o `PouClone.yyp`.

```sh
git switch main
git pull --ff-only
git switch -c feature/nombre-de-la-tarea
# Editar, guardar en GameMaker y probar con F5.
git add .
git commit -m "feat: describe el cambio"
git push -u origin feature/nombre-de-la-tarea
```

Guarden los cambios en GameMaker antes de hacer commit. Cierren el proyecto antes de cambiar de rama o integrar cambios y vuelvan a abrirlo después, para que la IDE no sobrescriba archivos con una versión anterior.

El propietario puede invitar a los colaboradores en **Settings → Collaborators**.

## Pendientes del MVP

- Alimentación y HUD de estadísticas.
- Baño con ducha, jabón y burbujas.
- Ropa y accesorios.
- Decoración de los tres cuartos.
- Minijuego de atrapar objetos y minijuego de memoria.
- Música y revisión final contra la rúbrica original.

## Recursos

Proyecto escolar no oficial inspirado en Pou. Los nombres, sprites y sonidos de terceros pertenecen a sus respectivos titulares. No se concede una licencia sobre esos recursos; este repositorio no implica autorización de sus titulares.
