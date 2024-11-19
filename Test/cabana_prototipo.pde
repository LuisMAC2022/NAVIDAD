
Objeto villa;

//Creamos cabaña 
class Cabana extends Objeto{
  int ancho,alto;
  color forma;
  //Constructor
  Cabana(float posicionX,float posicionY, int ancho, int alto, color c)
  {
  super(posicionX,posicionY);
  this.ancho = ancho;
  this.alto = alto;
  this.forma = c; 
  }
  
  void despliega(){
  //Base de la cabaña
  fill(forma);
  rect(posicionX,posicionY,ancho,alto);
  fill(101, 67, 33); // Cafe mas oscuro
  //puerta
  rect(posicionX + ancho * 0.4, posicionY + alto * 0.5, ancho * 0.2, alto * 0.5);
  }
}
//creamos techo
class Techo extends Objeto
{
    int ancho,alto;
    color forma;
  
  //constructor
  Techo(float posicionX,float posicionY, int ancho, int alto, color c){
    super(posicionX,posicionY);
    this.ancho = ancho;
    this.alto = alto;
    this.forma = c;
  }
  
  void despliega(){
  //Techo
  fill(forma);//color a la forma 
  //Dibujar un triangulo en el techo 
  triangle(posicionX,posicionY,posicionX+ancho,posicionY,posicionX+alto/2,posicionY-alto/2);
  }
} 
//creamos ventanas
class Ventanas extends Objeto
{
    int ancho,alto;
    color forma;
  
  //constructor
  Ventanas(float posicionX,float posicionY, int ancho, int alto, color c){
    super(posicionX,posicionY);
    this.ancho = ancho;
    this.alto = alto;
    this.forma = c;
  }
  
  void despliega(){
  //Techo
  fill(forma);//color a la forma 
  //Dibujar un triangulo en el techo 
  rect(posicionX + ancho * 0.1, posicionY + alto * 0.3, ancho * 0.2, alto * 0.2); // Ventana izquierda
  rect(posicionX + ancho * 0.7, posicionY + alto * 0.3, ancho * 0.2, alto * 0.2); // Ventana derecha
  }
  //cambia de color entre amarillo y naranja ayuda de IA
  void cambiaColor()
  {
    float rojo = random(200, 255);   
    float verde = random(100, 255);  
    float azul = random(0, 50);      
    forma = color(rojo, verde, azul); // Generar color aleatorio dentro de este rango
  }
}

/*Inicia villaquien
//SETUP()
//inicializamos
  cabana_a = new Cabana (50,550,50,50,color(139,69,19));
  techo_a = new Techo (50,550,50,50,color(165,42,42));
  ventanas_a = new Ventanas (55,550,40,40,color(0,0,0));
Fin del prototipo villa quien*/

/*Inicia villaquien
//Draw()
//le llamamos a los objetos
prueba.dibuja();
prueba.mueve();
cabana_a.despliega();
techo_a.despliega();
ventanas_a.despliega();
ventanas_a.cambiaColor();
Fin villaquien*/
