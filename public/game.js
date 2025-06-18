import Jugador from '../src/jugador.js';
import Proyectil from '../src/proyectil.js';

// Bucle principal y gestion de eventos
(function () {
  const canvas = document.getElementById('gameCanvas');
  const ctx = canvas.getContext('2d');

  let score = 0;

  const jugador = new Jugador(canvas);
  const proyectil = new Proyectil(canvas);

  let dir = 0;

  function resize() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    jugador.y = canvas.height - jugador.height - 10;
  }
  window.addEventListener('resize', resize);
  resize();

  window.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowLeft' || e.key === 'a') dir = -1;
    if (e.key === 'ArrowRight' || e.key === 'd') dir = 1;
  });
  window.addEventListener('keyup', (e) => {
    if (
      e.key === 'ArrowLeft' ||
      e.key === 'a' ||
      e.key === 'ArrowRight' ||
      e.key === 'd'
    )
      dir = 0;
  });

  // Control táctil básico
  window.addEventListener('touchstart', (e) => {
    const x = e.touches[0].clientX;
    dir = x < window.innerWidth / 2 ? -1 : 1;
  });
  window.addEventListener('touchend', () => (dir = 0));

  function loop() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    jugador.mover(dir);
    jugador.dibuja(ctx);

    proyectil.mover();
    proyectil.dibuja(ctx);

    if (proyectil.colisiona(jugador)) {
      score += proyectil.valor;
      proyectil.respawn();
    }

    ctx.fillStyle = 'white';
    ctx.fillText('Puntuación: ' + score, canvas.width - 120, 20);

    requestAnimationFrame(loop);
  }

  loop();
})();
