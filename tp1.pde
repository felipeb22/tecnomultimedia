int miVariable;
int value = 0;
int pantalla = 1 ;
int screen;
String texto ;
String texto2;
String texto3;
String texto4;
String texto5;
String texto6;
String texto7;
String texto8;
String texto9;
String texto10;
String texto11;
String texto12;
PImage losPalmeras;
PImage palmeras;
PImage lospalmeras2;
PImage canciones1;
PFont fuenteUno;
PFont fuenteDos;
PFont fuenteTres;
PFont fuente1;

void setup() {
  size (500,400);
  //textSize(32);
  background(150,0,0);
  miVariable = 1;
  texto = "LOS PALMERAS \n";
  texto2 = " \n\npresentando \nel nuevo disco \n\n"; 
  texto3 = "LOS PALMERAS";
  texto4 = "30 AÑOS";
  texto5 = "Rubén Deicas \n(voz)\n";
  texto6 = "Marcos Camino \n(acordeón/coros)\n";
  texto7 = "Exequiel Enrique  \n(teclados/guitarra)\n";
  texto8 = "Gustavo Martínez \n(tumbadoras/coros)\n";
  texto9 = "Darien Grenon  \n(timbaletas/percusión)\n";
  texto10 = "Silvio Medina \n(bajo/coros)\n";
  texto11 = "1. COMO NO VOY A QUERERTE  2. LUNA LUNERA \n3. PICA PICA  4. APRENDERAS A LLORAR \n5. ADIOS, ADIOS CORAZON  6. LA PIRAGUA";
  texto12 = "CLICK PARA REINICIAR";
  losPalmeras = loadImage("lospalmeras30.jpg");
  palmeras = loadImage("palmeras.jpg");
  lospalmeras2 = loadImage ("lospalmeras2.jpg");
  canciones1 = loadImage ("canciones1.jpg");
  fuenteUno =  loadFont ("fuenteUno.vlw");
  fuenteDos = loadFont ("fuenteDos.vlw");
  fuenteTres = loadFont ("fuenteTres.vlw");
  fuente1 = loadFont("fuente1.vlw");
}


void draw (){
  background(150,0,0);
  
  //PANTALLA 1
  if (frameCount > 0 && frameCount < 3000){
  miVariable = frameCount - - 1;
  println (miVariable);
  image (losPalmeras,70 ,700 - miVariable, 350, 300);
  textFont(fuente1);
  textSize(60);
  text(texto,90 , 400 - miVariable );
  textFont (fuenteDos);
  textSize(32);
  text(texto2, 140, 410 - miVariable);
  fill (0);
  textFont(fuenteUno);
  text(texto3, 120, 650 - miVariable);
  textFont(fuenteTres);
  text(texto4, 180, 680 - miVariable);
  }
  
 //PANTALLA 2
  if  (frameCount > 1000 && frameCount < 1730){
  image (palmeras, 20, 1370 - miVariable,200,200);
  image(lospalmeras2, 20, 1500 - miVariable, 200, 200 );
  textSize (24);
  text(texto5, 250, 1400 - miVariable);
  text(texto6, 250, 1450 - miVariable);
  text(texto7, 250, 1500 - miVariable);
  text(texto8, 250, 1550 - miVariable);
  text(texto9, 250, 1600 - miVariable);
  text(texto10, 250, 1650 - miVariable);
  
   }

   
  //PANTALLA 3
   if ( frameCount > 1720 && frameCount < 3000){
    image(canciones1, 2300 - miVariable, 30, 250, 250 ); 
    textSize(18);
    text(texto11,2200 - miVariable,300);
   }
   
   
   //REINICIO
   if (frameCount > 2600){
     textSize(22);
     text(texto12,120, 330);
   }
}
   void mousePressed (){
   if(mouseX > 80 && mouseY < 390 && mouseX < 350 && mouseY > 250 ){
     frameCount=0;
   }
   }

  
  
  
  
 
   
  
  
  
  
  
  
  
