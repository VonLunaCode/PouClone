# SDD — PouClone (TI138 Desarrollo de Videojuegos)

> Estado: **v0.5** (T01 hecha, T02 implementada sin probar en F5) · 2026-11-23 · Entrega: **3 de diciembre de 2026** (confirmada con la rúbrica del profesor).
> Método: Spec-Driven Development. Cada tarea se implementa contra su criterio de aceptación y sólo se marca hecha con evidencia (F5 / validación MCP).

## 1. Contexto

Juego tipo Pou en GameMaker 2024.14.4, vertical **720×1280**, orientado a móvil y probado en Windows con F5.
Desarrollo: **Christian hace todo el trabajo**. Camila, Irais y HatCode sólo figuran como colaboradores del repo `VonLunaCode/PouClone` (ramas `camila`, `hatcode`, `irais`, `main`), sin tareas asignadas.
Referencia visual: capturas del Pou original (`Descargas/Screenshot_2026111*_Pou.jpg`).

## 2. Rúbrica oficial del profesor (foto del pizarrón, 9 nov)

"Definir qué contendrá el juego — Juego tipo Pou"

| Criterio | Peso | Qué pide | Estado |
|----------|------|----------|--------|
| **Personaje** | 10 % | Pou como personaje | Hecho (6 emociones) — falta tu F5 |
| **Sonido** | 10 % | Sonido | Parcial: hay 30 sonidos; falta música de fondo y efectos por acción |
| **Escenarios** | 20 % | **3**: Sala, Cocina, Baño | Rooms creadas; faltan decorarlas |
| **Objetos** | 10 % | **Alimentos, bañarlo, ropa** | Pendiente (sprites ya existen) |
| **Minijuegos** | 25 % | **2 minijuegos** | Pendiente |
| **Interacción** | 25 % | **Que le den clic y reaccione** | **Hecho y probado con F5 (T01, 23 nov)**: clic → feliz + sonido + salto; 5 clics rápidos → serio |
| | **100 %** | | |

## 3. Alcance

### 3.1 Dentro (lo que se califica)
| ID | Requisito | Criterio |
|----|-----------|----------|
| RF-01 | Pou visible con emociones | Personaje |
| RF-02 | Clic sobre Pou → reacciona (animación/emoción + sonido) | Interacción |
| RF-03 | Navegación entre Sala, Cocina y Baño | Escenarios |
| RF-04 | Cada cuarto decorado (fondo + elementos propios) | Escenarios |
| RF-05 | **Alimentos:** elegir comida y dársela a Pou; él reacciona | Objetos |
| RF-06 | **Bañarlo:** ducha, jabón y burbujas; queda limpio | Objetos |
| RF-07 | **Ropa:** sombreros y lentes sobre Pou, equipar/quitar | Objetos |
| RF-08 | **Minijuego 1:** atrapar objetos que caen | Minijuegos |
| RF-09 | **Minijuego 2:** memoria con cartas | Minijuegos |
| RF-10 | Música de fondo + sonidos de acciones | Sonido |

### 3.2 Fuera del MVP (opcional, sólo tras QA)
HUD con 4 estadísticas, monedas y nivel (como en las capturas), tienda, dormitorio con lámpara, cámara, guardado en disco. **La rúbrica no los pide.**

## 4. Decisiones de diseño

| ID | Decisión | Estado |
|----|----------|--------|
| D-01 | Mantener **puertas** actuales en `obj_nav` (ya funcionan; flechas sólo si se hace el HUD opcional) | Propuesta |
| D-02 | Estado mínimo en `global.pou`: `comida_sel`, `sombrero`, `lentes`, `limpio` (sin estadísticas ni decaimiento en el MVP) | Propuesta |
| D-03 | Minijuegos como rooms propias (`rm_juego_atrapar`, `rm_juego_memoria`) que regresan a la sala; acceso desde un botón en la sala | Propuesta |
| D-04 | Emociones de Pou por evento (comer → feliz, bañar → limpio/feliz, caer algo → serio) reutilizando `PouEmocion` y `cambiar_emocion()` | Propuesta |
| D-05 | Ropa se elige en la sala con un botón "Armario" (los sprites no dependen del dormitorio) | Propuesta |

## 5. Diseño técnico

- **Código existente:** `obj_pou` (Create/Step/Draw: emociones, clic), `obj_nav` (puertas, título, cambio de room), `global.pou_emocion`.
- **Objetos nuevos:** `obj_comida` (arrastrable), `obj_selector_comida`, `obj_ducha`, `obj_jabon`, `obj_burbuja`, `obj_ropa` + selector, `obj_btn` (botón genérico), y los objetos de cada minijuego.
- **Assets disponibles:** `spr_food_*` (11), `spr_nevera`, `spr_ducha`, `spr_jabon`, `spr_burbujas`, `spr_sombrero_*` (3), `spr_lentes_*` (2), `spr_carta_frente/atras`, `spr_game_*` (4), `spr_moneda`, 30 sonidos.
- **Reglas GML:** sintaxis 2024+, `var` en locales, preflight con `gm_gml_validate_snippet`, validar con `gm_project_validate` tras cada tarea.

## 6. Plan de tareas (una rama por tarea; PR a `main` sólo si se quiere revisión)

Orden por peso e impacto: primero lo que más vale y menos riesgo tiene.

| ID | Tarea | Criterio de aceptación | Peso | Propuesta |
|----|-------|------------------------|------|-----------|
| T01 ✅ | Verificar y reforzar **interacción**: clic en Pou da reacciones distintas (varias emociones/sonidos) | F5: 5 clics seguidos → reacciones visibles y con sonido, sin errores | 25 % | Christian |
| T02 ⏳ | **Alimentos** en cocina: selector de comida, arrastrar a Pou, comer | La comida desaparece al soltarla en Pou y él reacciona | 10 % (con T03, T04) | Christian |
| T03 | **Baño:** ducha, jabón, burbujas | Frotar con jabón crea burbujas; la ducha las quita; Pou queda limpio | idem | Christian |
| T04 | **Ropa:** sombreros y lentes sobre Pou | Equipar/quitar; la prenda sigue a Pou entre cuartos | idem | Christian |
| T05 | **Decorar** sala, cocina y baño | Cada cuarto con fondo y 3+ elementos propios | 20 % | Christian |
| T06 | **Minijuego atrapar** | Caen objetos, se atrapan moviendo a Pou, hay puntaje y regreso a la sala | 25 % (con T07) | Christian |
| T07 | **Minijuego memoria** | Parejas de cartas, mensaje de victoria y regreso a la sala | idem | Christian |
| T08 | **Sonido:** música de fondo + efectos | Música en bucle sin saturar; sonido al comer, bañarse, ganar | 10 % | Christian |
| T09 | **QA final** contra la rúbrica | §7 al 100 % | todo | Christian |

**Calendario:** 23–27 nov: T01–T05 · 28 nov–1 dic: T06–T08 · 2–3 dic: T09 y margen. Hoy es 23 nov: quedan **10 días**.

## 7. Aceptación global
- [ ] `gm_project_validate` → ok, 0 errores, 0 warnings.
- [ ] Compila con Igor sin errores; se genera el ejecutable de Windows.
- [ ] ZIP del proyecto sin `.gamemaker-mcp`, builds ni logs.
- [ ] F5: clic reacciona; 3 cuartos decorados y navegables; alimentar, bañar y vestir a Pou; 2 minijuegos jugables; música sonando.
- [ ] Cada fila de la tabla de §2 verificada y marcada.
- [ ] Probado en teléfono Android o declarado "no probado".
- [ ] Entrega del 3 de diciembre: **ejecutable (`.exe`) y ZIP del proyecto**, ambos probados desde una carpeta limpia.

## 8. Reglas de trabajo
- Una rama por tarea; PR a `main`; commits convencionales.
- Un dueño por room; nadie edita a la vez la misma room ni `PouClone.yyp`.
- Guardar en GameMaker antes del commit; cerrar el proyecto antes de cambiar de rama.

## 9. Riesgos
| Riesgo | Mitigación |
|--------|------------|
| Conflictos en `.yyp` y rooms | Dueño único por room; integrar de a una |
| 10 días, 4 personas, ramas sin avance | Empezar hoy; revisar ramas cada 2–3 días |
| Minijuegos pesan 25 % y son lo más largo | Hacerlos simples (caída vertical, 6 parejas) |
| Móvil no validado | Probar Android en la 2.ª semana |

## 10. Decisiones tomadas (23 nov)
- **Q-01 Reparto:** sin reparto; Christian hace todo. Los demás sólo están en el repo.
- **Q-02 Entrega:** ejecutable **y** ZIP.
- **Q-03 HUD de estadísticas:** sí, **opcional y al final** (T10), sólo si T09 está cerrado.

## 11. Extra opcional
| ID | Tarea | Criterio |
|----|-------|----------|
| T10 | HUD: 4 estadísticas, monedas y nivel como en las capturas | Barras que cambian al alimentar/bañar; no rompe nada del MVP |
