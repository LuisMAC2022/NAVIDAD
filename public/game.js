import Jugador from '../src/jugador.js';
import Proyectil from '../src/proyectil.js';

const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
const bgm = document.getElementById('bgm');


let idioma = 'de';
let t = textos[idioma];

function cambiarIdioma(nuevo) {
  idioma = nuevo;
  t = textos[idioma];
  document.documentElement.lang = idioma;
  document.getElementById('retryButton').textContent = t.retry;
  actualizarHud();
}


// Instancia del jugador en la parte inferior
const jugador = new Jugador(canvas.width / 2, canvas.height - 30);
// Ajusta la posicion vertical para mantener un margen de 20px
jugador.y = canvas.height - jugador.alto / 2 - 20;
let direccion = 0; // -1 izquierda, 1 derecha
let tiempoAnterior = 0;

let vidas = 3;
const maxVidas = 7;
let tiempoRestante = 60; // segundos
let juegoTerminado = false;

function crearProyectil() {
  const tipos = ['corazon', 'calavera', 'reloj'];
  const tipo = tipos[Math.floor(Math.random() * tipos.length)];
  return new Proyectil(Math.random() * canvas.width, 0, tipo, 1);
}
let proyectil = crearProyectil();

function formatearTiempo(t) {
  const m = Math.floor(t / 60);
  const s = Math.floor(t % 60).toString().padStart(2, '0');
  return `${m}:${s}`;
}

function actualizarHud() {
  document.getElementById('score').textContent = `${t.score}: ${jugador.puntuacion}`;
  const contenedorVidas = document.getElementById('lives');
  contenedorVidas.innerHTML = '';
  for (let i = 0; i < vidas; i++) {
    const img = document.createElement('img');
    img.src = 'assets/cora.png';
    contenedorVidas.appendChild(img);
  }
  document.getElementById('time').textContent = formatearTiempo(tiempoRestante);
}

function finDelJuego() {
  juegoTerminado = true;
  direccion = 0;
  bgm.pause();
  const mensaje = document.getElementById('gameOver');
  mensaje.textContent = `${t.finalScore}: ${jugador.puntuacion}`;
  mensaje.classList.remove('hidden');
  const boton = document.getElementById('retryButton');
  boton.textContent = t.retry;
  boton.classList.remove('hidden');
}

// Control por teclado
window.addEventListener('keydown', (e) => {
  if (juegoTerminado) return;
  if (e.key === 'ArrowLeft' || e.key === 'a') direccion = -1;
  if (e.key === 'ArrowRight' || e.key === 'd') direccion = 1;
});
window.addEventListener('keyup', (e) => {
  if (e.key === 'ArrowLeft' || e.key === 'a' || e.key === 'ArrowRight' || e.key === 'd') direccion = 0;
});

canvas.addEventListener('touchstart', (e) => {
  if (juegoTerminado) return;
  const rect = canvas.getBoundingClientRect();
  const x = e.touches[0].clientX - rect.left;
  direccion = x < rect.width / 2 ? -1 : 1;
});
canvas.addEventListener('touchend', () => {
  direccion = 0;
});

function reiniciarJuego() {
  vidas = 3;
  tiempoRestante = 60;
  jugador.puntuacion = 0;
  juegoTerminado = false;
  document.getElementById('gameOver').classList.add('hidden');
  const boton = document.getElementById('retryButton');
  boton.classList.add('hidden');
  bgm.currentTime = 0;
  bgm.play();
  proyectil = crearProyectil();
  actualizarHud();
  requestAnimationFrame(bucle);
}
document.getElementById('retryButton').addEventListener('click', reiniciarJuego);

document.getElementById('language').addEventListener('change', (e) => {
  cambiarIdioma(e.target.value);
});


function bucle(timestamp) {
  const deltaTime = (timestamp - tiempoAnterior) / 1000 || 0;
  tiempoAnterior = timestamp;
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  if (!juegoTerminado) {
    tiempoRestante -= deltaTime;
    if (tiempoRestante <= 0) {
      tiempoRestante = 0;
      finDelJuego();
    }
  }

  if (!juegoTerminado) {
    jugador.mover(direccion, deltaTime);
    jugador.x = Math.max(jugador.ancho / 2, Math.min(canvas.width - jugador.ancho / 2, jugador.x));
  }
  jugador.dibujar(ctx);

  if (!juegoTerminado) {
    proyectil.actualizar(deltaTime);
    proyectil.dibujar(ctx);

    if (proyectil.colisionaCon(jugador)) {
      jugador.puntuacion += proyectil.valor;
      if (proyectil.tipo === 'calavera') {
        vidas -= 1;
      } else if (proyectil.tipo === 'corazon') {
        if (vidas < maxVidas) {
          vidas += 1;
        } else {
          jugador.puntuacion += 10;
        }
      } else if (proyectil.tipo === 'reloj') {
        tiempoRestante += 15;
      }
      if (vidas <= 0) {
        finDelJuego();
      }
      proyectil = crearProyectil();
    } else if (proyectil.fueraDePantalla(canvas.height)) {
      proyectil = crearProyectil();
    }
  }

  actualizarHud();

  if (!juegoTerminado) {
    requestAnimationFrame(bucle);
  }
}

cambiarIdioma(idioma);
requestAnimationFrame(bucle);
