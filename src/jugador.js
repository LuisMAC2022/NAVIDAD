// Clase que representa al jugador
export default class Jugador {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.velocidad = 5;
    this.ancho = 50;
    this.alto = 20;
    this.puntuacion = 0;
  }

  mover(direccion) {
    // direccion: -1 para izquierda, 1 para derecha
    this.x += direccion * this.velocidad;
  }

  dibujar(ctx) {
    ctx.fillStyle = 'red';
    ctx.fillRect(this.x - this.ancho / 2, this.y - this.alto / 2, this.ancho, this.alto);
  }
}
