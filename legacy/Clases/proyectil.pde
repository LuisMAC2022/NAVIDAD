class Proyectil extends Objeto {
  int valor; 
  float tamaño = 20; 
  float velocidad = 5; 

  
  Proyectil(float xInicial, float yInicial, int valorInicial) {
    super(xInicial, yInicial); 
    valor = valorInicial; 
  }

  @Override
  void mueve() {
    posicionY += velocidad; 
  }

  
  void dibuja() {
    rect(posicionX, posicionY, tamaño, tamaño); 
  }
}
