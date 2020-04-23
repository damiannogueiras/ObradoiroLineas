/*
 * Dibujando lineas con 'ruido' senocosenoidal
 * añadiendo fotos aleatoriamente transparentes
 */

void setup() {
  size(600, 600);
  background(0);
  frameRate(12);
}

// transparencia de las lineas y fotos
float transparenciaMouse;
// fotos del directorio data
PImage img;

void draw() {
  // segun el movimiento Y del mouse generamos un numero 100-255
  // lo usamos como transparencia
  //transparenciaMouse = map(mouseY, 0, width, 100, 255);
  transparenciaMouse = (int)random(100,255);
  
  // cargamos las fotos aleatoriamente
  // nombre de fichero solo cambiando un número
  img = loadImage("foto"+(int)random(1, 9)+".png");
  
  // trasladamos el origen de coordenadas al centro
  translate(width/2, height/2);
  
  // loop por el ancho de la imagen
  // dando saltos aleatorios
  for (int i=0; i < width; i=i+(int)random(1, 200)) {
    // color aleatorio de las lineas
    stroke(transparenciaMouse);
    // dibujamos lineas desde el exterior hasta el centro
    line(width*sin(random(PI)), height*cos(random(PI)), 0, 0);
    line(-width*sin(random(PI)), height*cos(random(PI)), 0, 0);
    //
    tint(255, transparenciaMouse);
    // escalamos aleatoriamente el tamaño de las imagenes
    float tamanho = random(1);
    scale(tamanho);
    // las posicionamos igual que los extremos de las lineas
    image(img, -width*sin(random(PI)), height*cos(random(PI)));
    image(img, width*sin(random(PI)), height*cos(random(PI)));
  }
  
  // guardamos los frames para hacer un film
  // saveFrame("###.png");
 
}
