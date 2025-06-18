class Objeto {//Nombre de la clase 
  float posicionX, posicionY, velocidad; //Atributo que maneja posicion en x/y
  Objeto(float x, float y){//Inicio metodo constructor
   posicionX = x; //Posicion del objeto en eje x
   posicionY = y; //Posicion del objeto en eje y
  }//Fin metodo constructor
  void mover(){} //Cada clase implementa su metodo mover
}


abstract class Proyectil extends Objeto {
Proyectil(float x, float y) {
  super(x,y);
  int valor; //Interactua con el jugador cuando lo atrapa
}
/*aqui va metodo mover(), el proyectil cae a velocidad fija por el eje y 
manteniendo el eje x.*/

}

abstract class Jugador extends Objeto {//La clase es una extension del Objeto, heredando sus propiedades
Jugador(float x, float y) {//Inicio del metodo constructor
  super(x,y);//Con super usa el constructor de la clase padre Objeto.
  int vida,puntos; //variables con las estadisticas del jugador  
}  //Fin del metodo constructor
abstract void atrapar_proyectil( int valor);
/*Aqui van los metodos mover y atrapar_protectil()
* El metodo mover hace que el jugador se desplaze de izquierda a derecha por la pantalla 

* Atrapar proyectil interactua con el valor de la clase proyectil cuando la toca 
Si es positiva se suma a los puntos
Si es negativa se resta la vida
*
*
*/
}


abstract class Trineo extends Objeto {//La clase es una extension del Objeto, heredando sus propiedades
Trineo(float x, float y) {//Inicio del metodo constructor
  super(x,y);//Con super usa el constructor de la clase padre Objeto.
  Proyectil[] saco = {};//Arreglo que guarda los objetos proyectiles   
}  //Fin del metodo constructor

//El metodo lanzar proyectil instancia un proyectil cada cierto tiempo hasta que se vacia el "saco"


/*Aqui van los metodos mover y lanzar_proyectil()*/
}
