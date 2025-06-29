# Localizacion y reinicio

## Resumen
Se agrego soporte multilenguaje para HUD y un boton de reinicio. El idioma predeterminado es aleman.

## Razonamiento
La localizacion permite publicar el juego en distintas regiones sin modificar el codigo base. El boton de reinicio agiliza volver a jugar tras perder, mejorando la experiencia.

## Alternativas consideradas
- Cambiar manualmente el texto en HTML: descartado por poco escalable.
- Recargar toda la pagina para reiniciar: evita logica extra pero interrumpe la musica.

## Sugerencias
La implementacion actual fija el idioma en el codigo. Futuras versiones podrian elegir idioma de forma dinamica.
