
//https://youtu.be/gyVzT9cwMQI


PImage cactusChico;
PImage cactusGrande;
PImage cactusChiquitos;

PImage dinoRun1;
PImage dinoRun2;
PImage dinoJump;
PImage dinoDuck;
PImage dinoDuck1;

PImage pajaro;
PImage pajaro1;

ArrayList<Obstaculo> obstaculos = new ArrayList<Obstaculo>();
ArrayList<Pajaro> pajaros = new ArrayList<Pajaro>();


int obstacleTimer = 0;
int minTimeBetObs = 60;
int randomAddition = 0;
int groundCounter = 0;
float speed = 10;

int alturaPiso = 50;
int jugadorXpos = 100;
int highScore = 0;

jugador dino;

void setup(){
  size(800, 400);
  frameRate(60);
  
  dinoRun1 = loadImage("dinorun0000.png");
  dinoRun2 = loadImage("dinorun0001.png");
  dinoJump = loadImage("dinoJump0000.png");
  dinoDuck = loadImage("dinoduck0000.png");
  dinoDuck1 = loadImage("dinoduck0001.png");
  cactusChico = loadImage("cactusSmall0000.png");
  cactusGrande = loadImage("cactusBig0000.png");
  cactusChiquitos = loadImage("cactusSmallMany0000.png");
  pajaro = loadImage("berd.png");
  pajaro1 = loadImage("berd2.png");
  
  dino = new jugador();
}

void draw(){
  background(250);
  stroke(0);
  strokeWeight(2);
  line(0, height - alturaPiso - 30, width, height - alturaPiso - 30);
  
  updateObstacles();
  
  if(dino.score > highScore){
    highScore = dino.score;
  }
  
  textSize(20);
  fill(0);      
  text("Marca: " + dino.score, 5, 20);
  text("Record: " + highScore, width - (140 + (str(highScore).length() * 10)), 20);
}

void keyPressed(){
  switch(key){
    case ' ': dino.jump();
              break;
    case 's': if(!dino.dead){
                dino.ducking(true);
              }
              break;
  }
}

void keyReleased(){
  switch(key){
    case 's': if(!dino.dead){
                dino.ducking(false);
              }
              break;
    case 'r': if(dino.dead){
                reset();
              }
              break;
  }
}

void updateObstacles(){
  showObstacles();
  dino.show();
  if(!dino.dead){
    obstacleTimer++;
    speed += 0.002;
    if(obstacleTimer > minTimeBetObs + randomAddition){
      addObstacle();
    }
    groundCounter++;
    
    moveObstacles();
    dino.update();
  }
  else{
    textSize(32);
    fill(0);
    text("ESTAS MUERTO! PERDISTE", 180, 200);
    textSize(16);
    text("(Presiona 'r' para empezar)", 330, 230);
  }
}

void showObstacles(){
  
  for(int i = 0; i < obstaculos.size(); i++){
    obstaculos.get(i).show();
  }
  for(int i = 0; i < pajaros.size(); i++){
    pajaros.get(i).show();
  }
}

void addObstacle(){
  if(random(1) < 0.15){
    pajaros.add(new Pajaro(floor(random(3))));
  }
  else{
    obstaculos.add(new Obstaculo(floor(random(3))));
  }
  randomAddition = floor(random(50));
  obstacleTimer = 0;
}

void moveObstacles(){
  
  for(int i = 0; i < obstaculos.size(); i++){
    obstaculos.get(i).move(speed);
    if(obstaculos.get(i).posX < -jugadorXpos){
      obstaculos.remove(i);
      i--;
    }
  }
  for(int i = 0; i < pajaros.size(); i++){
    pajaros.get(i).move(speed);
    if(pajaros.get(i).posX < -jugadorXpos){
      pajaros.remove(i);
      i--;
    }
  }
}

void reset(){
  dino = new jugador();
  obstaculos = new ArrayList<Obstaculo>();
  pajaros = new ArrayList<Pajaro>();

  
  obstacleTimer = 0;
  randomAddition = floor(random(50));
  groundCounter = 0;
  speed = 10;
}
