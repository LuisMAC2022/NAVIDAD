class Objeto {//Nombre de la clase 
  float posicionX, posicionY, velocidad; //Atributo que maneja posicion en x/y
  Objeto(float x, float y){//Inicio metodo constructor
   posicionX = x; //Posicion del objeto en eje x
   posicionY = y; //Posicion del objeto en eje y
  }//Fin metodo constructor
  void mueve(){} //Cada clase implementa su metodo mover
}
int regalos = 7;//variable usada para inicializar saco
float techo = 0;// limite superior de la pantalla
Proyectil[] saco = new Proyectil[regalos]; //largo del saco segun numero de regalos
Jugador prueba = new Jugador(450,800);

void setup(){ 
  size(900,900);//ventana 
  frameRate(60);//tasa de actualizacion 
 
  for(int i = 0; i < regalos; i++ ){//desde 0 hasta numero de regalos
  float coordenadas_x = 100 * i + 100;
  
  //inicializa saco
    saco[i] = new Proyectil( coordenadas_x , //genera un proyectil cada 100 pixeles, + 100 para que  el primer proyectil inicie dentro de la pantalla. 
                                              //si hay mas proyectiles que pixeles se generaran fuera de la pantalla
                            techo         ,//coordenada y en lo mas alto de la pantalla
                          int(random(-1,4))//Le da un valor entre -1 y 4 sin incluir el 4 usando el metodo random y convirtiendo el resultado a entero  
                          );
                          

  }
}

void draw(){
 background(0);//fondo negro
for(int i = 0; i < saco.length; i++ ){
saco[i].dibuja();
saco[i].mueve();  
}
prueba.dibuja();
prueba.mueve();


}


//Definicion de clase proyectil
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
if (posicionY < 800){
    posicionY += velocidad; 
    
  }}

  
  void dibuja() {
    rect(posicionX, posicionY, tamaño, tamaño); 
  }

}


class Jugador extends Objeto{
  int puntuacion,vida;
  float velocidad = 10;
  Jugador(float posicionX,float posicionY){
  super(posicionX,posicionY);
  }
  
 
  void mueve(){
    if (keyPressed) {
    if (keyCode == RIGHT) {
      posicionX += velocidad; // Mover a la derecha
    } else if (keyCode == LEFT) {
      posicionX -= velocidad; // Mover a la izquierda
    }
  }

}
  
  void dibuja(){
    
      circle(posicionX,posicionY,50);}
  
}
