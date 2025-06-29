# Mover modulos a carpeta publica

## Resumen
Se trasladaron los archivos `jugador.js` y `proyectil.js` a la carpeta `public` y se actualizaron las rutas de importación en `game.js`.

## Razonamiento
Al servir la aplicación desde `public`, el navegador reportaba errores 404 al no exponerse la carpeta `src`. Al ubicar los módulos junto al resto de recursos se simplifica el despliegue del juego.

## Alternativas consideradas
- Mantener los archivos en `src` y configurar el servidor para exponer dicha carpeta: se descartó para evitar configuración adicional.
- Reescribir `game.js` sin módulos: se descartó por perder claridad y modularidad.

## Sugerencias
Probar la carga del juego en un servidor real o en GitHub Pages para confirmar que no existan rutas incorrectas y considerar un empaquetador que facilite futuras ampliaciones.
