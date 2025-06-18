import Jugador from '../src/jugador.js';
import Proyectil from '../src/proyectil.js';

const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

// Instancia del jugador en la parte inferior
const jugador = new Jugador(canvas.width / 2, canvas.height - 30);
let direccion = 0; // -1 izquierda, 1 derecha
// Lleva la cuenta del tiempo previo para calcular deltaTime
let tiempoAnterior = 0;

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
  const rect = canvas.getBoundingClientRect();
  const x = e.touches[0].clientX - rect.left;
  direccion = x < rect.width / 2 ? -1 : 1;
});
canvas.addEventListener('touchend', () => {
  direccion = 0;
});

function bucle(timestamp) {
  // Calcula el tiempo transcurrido en segundos
  const deltaTime = (timestamp - tiempoAnterior) / 1000 || 0;
  tiempoAnterior = timestamp;
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Actualizar y dibujar jugador
  jugador.mover(direccion, deltaTime);
  // Evita que salga del canvas
  jugador.x = Math.max(jugador.ancho / 2, Math.min(canvas.width - jugador.ancho / 2, jugador.x));
  jugador.dibujar(ctx);

  // Actualizar proyectil
  proyectil.actualizar(deltaTime);
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
// Inicia el bucle de animacion con requestAnimationFrame
requestAnimationFrame(bucle);
