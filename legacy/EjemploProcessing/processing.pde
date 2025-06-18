//Añadi algunas variables para controlar la velocidad del zangoloteo y sea mas agradable a la vista

int tiempo; //Esta variable nos ayuda a llevar un registro del tiempo 
int espera = 250; // Esta variable corresponde al tiempo que vamos a esperar para realizar una llamada a zangolotea
float randomize = 1; //Esta variable la utilizo para cambiar el tamanno del circulo multiplicandola por el radio


class Forma{//Inicio de la superclase forma
  float posicionX;
  float posicionY;
  float radio;
  
  Forma(float x_, float y_, float r_){ // inicio del constructpr
    posicionX = x_;
    posicionY = y_;
    radio = r_;
  } // fin del constructor de Forma
  void zangolotea(){//inicio metodo zangolotea
    posicionX += random(-1,1);
    posicionY += random(-1,1);
  }//fin metodo zangolotea
  void despliega(){// inicio del metodo despliega
    point(posicionX,posicionY);
  }// fin metodo despliega
} //Fin de clase Forma

class Cuadrado extends Forma{//Inicio de clase cuadrado que es extension de Forma
  Cuadrado(float temp_x, float temp_y, float temp_r){
    super(temp_x,temp_y,temp_r); //usa super para heredar los metodos de la clase Forma
  }
  void despliega(){ //El metodo despliega() muestra un rectangulo usando los parametros recibidos al crear el objeto.
    rectMode(CENTER);
    fill(175);
    stroke(0);
    rect(posicionX,posicionY,radio,radio);
  }
} // Fin de clase Cuadrado
  
class Circulo extends Forma{
  color c;
  Circulo(float temp_x,float temp_y, float temp_r, color temp_colorCirculo){
  super(temp_x, temp_y, temp_r);
  c = temp_colorCirculo;
}


//Definicion del metodo despliega(), sobre escribe la clase padre y muestra un circulo
void despliega(){//Se sobre escribe despliega para que muestre un circulo en vez de un cuadrado
ellipseMode(CENTER); //dibuja una elipse a partir del centro
   fill(c); //Rellena la figura de a cuerdo al color de la variable de instancia 
   stroke(0);//perimetro en color negro
  ellipse(posicionX,posicionY,radio * randomize, radio * randomize); //dibuja un circulo
}//fin del metodo despliega

void zangolotea(){ //se sobre escribe zangolotea para modificar el color del circulo cada que se llama al metodo zangolotea
    super.zangolotea(); 
    cambiarColor();
} //Fin metodo zangolotea

void cambiarColor(){
c = color(random(0,255),random(0,255),random(0,255)); 
//c = color(random(255));
}
} // Fin de clase Circulo

