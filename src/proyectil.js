// Clase Proyectil
export default class Proyectil {
  constructor(canvas) {
    this.size = 20;
    this.canvas = canvas;
    this.vel = 4;
    this.valor = 1; // valor positivo para la demo
    this.respawn();
  }

  respawn() {
    this.x = Math.random() * (this.canvas.width - this.size);
    this.y = -this.size;
  }

  mover() {
    this.y += this.vel;
    if (this.y > this.canvas.height) this.respawn();
  }

  dibuja(ctx) {
    ctx.fillStyle = 'red';
    ctx.fillRect(this.x, this.y, this.size, this.size);
  }

  colisiona(jugador) {
    return (
      this.x < jugador.x + jugador.width &&
      this.x + this.size > jugador.x &&
      this.y < jugador.y + jugador.height &&
      this.y + this.size > jugador.y
    );
  }
}
