// Clase Jugador
export default class Jugador {
  constructor(canvas) {
    this.width = 50;
    this.height = 20;
    this.canvas = canvas;
    this.x = (canvas.width - this.width) / 2;
    this.y = canvas.height - this.height - 10;
    this.vel = 7;
  }

  mover(dir) {
    this.x += dir * this.vel;
    if (this.x < 0) this.x = 0;
    if (this.x + this.width > this.canvas.width)
      this.x = this.canvas.width - this.width;
  }

  dibuja(ctx) {
    ctx.fillStyle = 'white';
    ctx.fillRect(this.x, this.y, this.width, this.height);
  }
}
