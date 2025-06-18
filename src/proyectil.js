// Clase que representa un proyectil que cae desde la parte superior
export default class Proyectil {
  constructor(x, y, valor = 1) {
    this.x = x;
    this.y = y;
    this.valor = valor;
    // Velocidad en pixeles por segundo. Antes eran 3 px por fotograma a 60fps
    this.velocidad = 180;
    this.tamano = 20;
  }

  // deltaTime corresponde al tiempo transcurrido en segundos desde el ultimo frame
  actualizar(deltaTime) {
    this.y += this.velocidad * deltaTime;
  }

  dibujar(ctx) {
    ctx.fillStyle = this.valor >= 0 ? 'green' : 'blue';
    ctx.fillRect(this.x - this.tamano / 2, this.y - this.tamano / 2, this.tamano, this.tamano);
  }

  fueraDePantalla(alto) {
    return this.y - this.tamano / 2 > alto;
  }

  colisionaCon(jugador) {
    return (
      this.x + this.tamano / 2 > jugador.x - jugador.ancho / 2 &&
      this.x - this.tamano / 2 < jugador.x + jugador.ancho / 2 &&
      this.y + this.tamano / 2 > jugador.y - jugador.alto / 2 &&
      this.y - this.tamano / 2 < jugador.y + jugador.alto / 2
    );
  }
}
