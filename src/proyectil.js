// Clase que representa un proyectil que cae desde la parte superior
// Imágenes para los distintos tipos de proyectil
const imagenes = {
  corazon: new Image(),
  calavera: new Image(),
  reloj: new Image(),
};
imagenes.corazon.src = 'assets/cora.png';
imagenes.calavera.src = 'assets/calaca.png';
imagenes.reloj.src = 'assets/reloj.png';

export default class Proyectil {
  constructor(x, y, tipo = 'corazon', valor = 1) {
    this.x = x;
    this.y = y;
    this.tipo = tipo;
    this.valor = valor;
    this.imagen = imagenes[tipo] || imagenes.corazon;
    // Velocidad en pixeles por segundo. Antes eran 3 px por fotograma a 60fps
    this.velocidad = 180;
    this.tamano = 35;
  }

  // deltaTime corresponde al tiempo transcurrido en segundos desde el ultimo frame
  actualizar(deltaTime) {
    this.y += this.velocidad * deltaTime;
  }

  dibujar(ctx) {
    ctx.drawImage(
      this.imagen,
      this.x - this.tamano / 2,
      this.y - this.tamano / 2,
      this.tamano,
      this.tamano
    );
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
