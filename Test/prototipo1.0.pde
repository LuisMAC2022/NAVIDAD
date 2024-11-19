import processing.sound.*; 

SoundFile sonidoColision;

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
Jugador prueba = new Jugador(450,700);

void setup(){ 
  size(1480,900);//ventana 
  frameRate(60);//tasa de actualizacion 
  // Colores Iniciales
   
  //
  sonidoColision = new SoundFile(this, "coin.mp3");
  colorVestidoR = 218; colorVestidoG = 70; colorVestidoB = 39; // Rojo inicial para el vestido
  colorCapaR = 45; colorCapaG = 223; colorCapaB = 102;  // Verde inicial para la capa
  colorMonoR = 218; colorMonoG = 70; colorMonoB = 39;      // Rojo inicial para el moño
  for(int i = 0; i < regalos; i++ ){//desde 0 hasta numero de regalos
  float coordenadas_x = 100 * i + 300;
  
  //inicializa saco
    saco[i] = new Proyectil( coordenadas_x , //genera un proyectil cada 100 pixeles, + 100 para que  el primer proyectil inicie dentro de la pantalla. 
                                              //si hay mas proyectiles que pixeles se generaran fuera de la pantalla
                            techo         ,//coordenada y en lo mas alto de la pantalla
                          int(random(-1,4))//Le da un valor entre -1 y 4 sin incluir el 4 usando el metodo random y convirtiendo el resultado a entero  
                          );
                          

  }
}

void draw(){
 background(255);//fondo negro
 /*// Cambiar los colores dinámicamente
  float t = frameCount * 0.05; // Escala de tiempo
  colorVestidoR = map(sin(t), -1, 1, 200, 255); // Alternar entre tonos de rojo
  colorVestidoG = map(cos(t), -1, 1, 50, 150);  // Alternar entre tonos de verde
  colorCapaR = map(cos(t + PI / 2), -1, 1, 30, 100); // Alternar entre tonos oscuros de rojo
  colorCapaG = map(sin(t + PI / 2), -1, 1, 200, 255); // Alternar entre tonos claros de verde
  colorMonoR = map(sin(t + PI), -1, 1, 180, 255); // Alternar tonos claros para el moño
  colorMonoG = map(cos(t + PI), -1, 1, 0, 100); // Alternar entre verdes más oscuros
  */
for(int i = 0; i < saco.length; i++ ){
saco[i].dibuja();
saco[i].mueve();  
saco[i].colision(prueba);
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
  } else posicionY = 0 ;
}

  
  void dibuja() {
    rect(posicionX, posicionY, tamaño, tamaño); 
  }

  void colision(Jugador jugador) {
  //calcula la dstancia del entre el centro del proyectil y del jugador 
  float distancia = dist(posicionX, posicionY, jugador.posicionX, jugador.posicionY);
  //si la distancia es menor es colision
  if (distancia < (tamaño )) {
    sonidoColision.play();//reproduce le sonido de colision
    println(this.valor);
  }
}

}




class Jugador extends Objeto {
  float velocidad = 10;
  int puntos;
  int vidas; 
Jugador(float xInicio, float yInicio){
super(xInicio, yInicio);
}

@Override
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
  drawCindy_Lou(posicionX,posicionY, 120);
}


}



float colorVestidoR, colorVestidoG, colorVestidoB; // Colores dinámicos del vestido
float colorCapaR, colorCapaG, colorCapaB;   // Colores dinámicos de la capa
float colorMonoR, colorMonoG, colorMonoB;      // Colores dinámicos del moño





void drawCindy_Lou(float x, float y, float diameter) {
  drawDibujaCabeza(x, y, diameter); // Dibujar la cabeza
  drawCuerpo(x, y + diameter / 2, diameter); // Dibujar el cuerpo
}

void drawDibujaCabeza(float x, float y, float diametro) {
  
  // Dibujar la cabeza
  fill(255, 220, 185); // Color de la cabeza
  ellipse(x, y, diametro, diametro); // Cabeza
 // Agregar pequeños círculos en la mitad superior del contorno para simular el cabello
  float radio = diametro / 2; // Radio del círculo principal
  int numCirculos = 20; // Número de círculos pequeños
  float nuevoDiametro = 15; // Diámetro de los pequeños círculos

  fill(139, 69, 19); // Color café para los pequeños círculos
  stroke(0);

  for (int i = 0; i <= numCirculos; i++) {
    float angulo = map(i, 0, numCirculos, PI, 0); // Ángulo de PI (izquierda) a 0 (derecha)
    float cx = x + radio * cos(angulo);
    float cy = y - radio * sin(angulo);
    ellipse(cx, cy, nuevoDiametro, nuevoDiametro);
  }

  // Moño
   stroke(0);
  fill(colorMonoR, colorMonoG, colorMonoB); // Color dinámico del moño
  ellipse(x - 30, y - 70, 40, 40); // Lazo izquierdo
  ellipse(x + 30, y - 70, 40, 40); // Lazo derecho
  ellipse(x, y - 70, 20, 20); // Centro del moño
  
  
  
    // Cabello (izquierda y derecha)
  fill(139, 69, 19); // Color café
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j <= i; j++) {
      ellipse(x - 60 - j * 10, y - 35 + i * 10, 10, 10); // Cabello izquierda
      ellipse(x + 60 + j * 10, y - 35 + i * 10, 10, 10); // Cabello derecha
    }
  }

  // Ojos
  stroke(0);
  fill(255); // Blanco
  ellipse(x - 20, y - 20, 30, 40); // Ojo izquierdo
  ellipse(x + 20, y - 20, 30, 40); // Ojo derecho
  fill(0); // Negro para pupilas
  ellipse(x - 20, y - 10, 20, 20); // Pupila izquierda
  ellipse(x + 20, y - 10, 20, 20); // Pupila derecha

  // Boca
  fill(255, 0, 0); // Rojo
  arc(x, y + 20, 50, 50, 0, PI); // Boca abierta
  
  //Nariz
  stroke(0);       // Contorno negro
  strokeWeight(2); // Grosor del contorno
  noFill();        // Sin relleno
  arc(x, y+8, 15, 10, PI, PI*2); // 180 a 360
}

void drawCuerpo(float x, float y, float diametroCabeza) {
  // Capa
  fill(colorCapaR, colorCapaG, colorCapaB); // Color dinámico de la capa
  float topeCapa = diametroCabeza * 0.7;
  float baseCapa = diametroCabeza * 1.6;
  float alturaCapa = 90;
  float topeY = y;
  float fondoY = y + alturaCapa;

  beginShape();
  vertex(x - topeCapa / 2, topeY);    
  vertex(x + topeCapa / 2, topeY);    
  vertex(x + baseCapa / 2, fondoY); 
  vertex(x - baseCapa / 2, fondoY); 
  endShape(CLOSE);

  // Vestido
  fill(colorVestidoR, colorVestidoG, colorVestidoB); // Color dinámico del vestido
  float topeVestido = diametroCabeza * 0.4;
  float fondoVestido = diametroCabeza * 1.2;
  float altoVestido = 80;
  float topeVY = y;
  float fondoVY = y + altoVestido;

  beginShape();
  vertex(x - topeVestido / 2, topeVY);    
  vertex(x + topeVestido / 2, topeVY);    
  vertex(x + fondoVestido / 2, fondoVY); 
  vertex(x - fondoVestido / 2, fondoVY); 
  endShape(CLOSE);
  
   // Dibujar brazos
  stroke(0); // Color negro para el contorno
  strokeWeight(1);
  fill(255, 220, 185); // Color piel
  float largoBrazo = 50;
  float anchoBrazo = 20;

  // Brazo izquierdo
  pushMatrix();
  translate(x - topeVestido / 2 - anchoBrazo / 2, topeVY + 10);
  rotate(radians(-5)); // Ángulo similar al costado izquierdo del trapecio
  rect(0, 0, anchoBrazo, largoBrazo);
  popMatrix();
  
   // Brazo Derecho
  pushMatrix();
  translate(x + topeVestido / 2 - anchoBrazo / 2, topeVY + 10);
  rotate(radians(5)); // Ángulo similar al costado izquierdo del trapecio
  rect(0, 0, anchoBrazo, largoBrazo);
  popMatrix();
  
  
  // Dibujar manos
  fill(255); // Color piel
  ellipse(x - 20, y + 60, 30, 30); // Mano izquierda
  ellipse(x + 20, y + 60, 30, 30); // Mano 
  
  stroke(0); // Color negro para el contorno
  strokeWeight(1); // Grosor del contorno
  fill(255); // Color blanco
  ellipse(x - 30, y + 10, 50, 30); // Hombro izquierdo
  ellipse(x + 30, y + 10, 50, 30); // Hombro derecho

  // Dibujar piernas
  fill(255, 220, 185); // Color piel
  rect(x - 40, y + altoVestido, 30, 40); // Pierna izquierda
  rect(x + 10, y + altoVestido, 30, 40); // Pierna derecha

  // Dibujar pies
  fill(0); // Negro para zapatos
  ellipse(x - 25, y + altoVestido + 35, 40, 25); // Pie izquierdo
  ellipse(x + 25, y + altoVestido + 35, 40, 25); // Pie derecho
}
