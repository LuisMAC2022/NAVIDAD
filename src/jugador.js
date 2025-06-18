// Clase que representa al jugador
// Imagen utilizada para representar al jugador
const imagenJugador = new Image();
imagenJugador.src = 'assets/cent.png';

export default class Jugador {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    // Velocidad en pixeles por segundo. 5 px por frame a 60fps serian 300
    // pero un poco menos rapido para mejor control
    this.velocidad = 250;
    this.ancho = 60;
    this.alto = 90;
    this.puntuacion = 0;
  }

  mover(direccion, deltaTime) {
    // direccion: -1 para izquierda, 1 para derecha
    this.x += direccion * this.velocidad * deltaTime;
  }

  dibujar(ctx) {
    ctx.drawImage(
      imagenJugador,
      this.x - this.ancho / 2,
      this.y - this.alto / 2,
      this.ancho,
      this.alto
    );
  }
}
