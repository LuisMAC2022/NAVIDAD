import Jugador from '../src/jugador.js';
import Proyectil from '../src/proyectil.js';

const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

function resizeCanvas() {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
}

resizeCanvas();

// Instancia del jugador en la parte inferior
const jugador = new Jugador(canvas.width / 2, canvas.height - 30);
window.addEventListener('resize', () => {
  resizeCanvas();
  jugador.x = canvas.width / 2;
  jugador.y = canvas.height - 30;
});
let direccion = 0; // -1 izquierda, 1 derecha

// Crea un proyectil en x aleatoria y valor positivo
function crearProyectil() {
  return new Proyectil(Math.random() * canvas.width, 0, 1);
}
let proyectil = crearProyectil();

function actualizarMarcador() {
  document.getElementById('score').textContent = `Puntuación: ${jugador.puntuacion}`;
}

// Control por teclado
window.addEventListener('keydown', (e) => {
  if (e.key === 'ArrowLeft' || e.key === 'a') direccion = -1;
  if (e.key === 'ArrowRight' || e.key === 'd') direccion = 1;
});
window.addEventListener('keyup', (e) => {
  if (e.key === 'ArrowLeft' || e.key === 'a' || e.key === 'ArrowRight' || e.key === 'd') direccion = 0;
});

// Controles táctiles: tocar lado izquierdo o derecho de la pantalla
canvas.addEventListener('touchstart', (e) => {
  const x = e.touches[0].clientX - canvas.getBoundingClientRect().left;
  direccion = x < canvas.width / 2 ? -1 : 1;
});
canvas.addEventListener('touchend', () => {
  direccion = 0;
});

function bucle() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Actualizar y dibujar jugador
  jugador.mover(direccion);
  // Evita que salga del canvas
  jugador.x = Math.max(jugador.ancho / 2, Math.min(canvas.width - jugador.ancho / 2, jugador.x));
  jugador.dibujar(ctx);

  // Actualizar proyectil
  proyectil.actualizar();
  proyectil.dibujar(ctx);

  if (proyectil.colisionaCon(jugador)) {
    jugador.puntuacion += proyectil.valor;
    actualizarMarcador();
    proyectil = crearProyectil();
  } else if (proyectil.fueraDePantalla(canvas.height)) {
    proyectil = crearProyectil();
  }

  requestAnimationFrame(bucle);
}

actualizarMarcador();
bucle();
