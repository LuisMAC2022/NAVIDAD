float x = 100;
float y = 100;
float w = 60;
float h = 60;
float eyeSize = 16;

void setup() {
  size(400, 400);
  smooth();
} // fin de setup()

void draw() {
  background(255); // Dibuja un fondo negro
  //mouseX la posicion en X del mouse, determina el factor de velocidad para la funcion moveZoog
  float factor = constrain(mouseX/10, 0, 5);

  jiggleZoog(factor);
  // pasa un color para dibujar a Zoog a la funcion drawZoog pass in a color to drawZoog
  // funcion para el color de los ojosfunction for eye's color
  float d = dist(x, y, mouseX, mouseY);
  color c = color(d);
  drawZoog(c);
} //fin de draw()

void jiggleZoog(float speed) {
  // Cambia la posición de x y y de Zoog al azar
  x = x + random( - 1, 1)*speed;
  y = y + random( - 1, 1)*speed;
  // Restringe a Zoog a la ventana
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
} //fin de jiggleZoog

void drawZoog(color eyeColor) {
  // Coloca el dibujado de las elipses y rectángulos a partir del centro
  ellipseMode(CENTER);
  rectMode(CENTER);

  // Dibuja los brazos de Zoog en un ciclo
  for (float i = y - h/3; i < y + h/2; i += 10) {
    stroke(0);
    line(x - w/4, i, x + w/4, i);
  } 

  // Dibuja el cuerpo de Zoog
  stroke(0);
  fill(175);
  rect(x, y, w/6, h);
  // Dibuja la cabeza de Zoog
  stroke(0);
  fill(255);
  ellipse(x, y - h, w, h);
  // Dibuja los ojos de Zoog
  fill(eyeColor);
  ellipse(x - w/3, y - h, eyeSize, eyeSize*2);
  ellipse(x + w/3, y - h, eyeSize, eyeSize*2);
  // DIbuja las piernas de Zoog
  stroke(0);
  line(x - w/12, y + h/2, x - w/4, y + h/2 + 10);
  line(x + w/12, y + h/2, x + w/4, y + h/2 + 10);
} // fin de drawZoog()
