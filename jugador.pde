class jugador{
  float posY = 0;
  float velY = 0;
  float gravity = 1.2;
  int size = 20;
  boolean duck = false;
  boolean dead = false;
  
  int runCount = -5;
  int lifespan;
  int score;
  
  jugador(){
  }
  
  void jump(){
    if(posY == 0){
      gravity = 1.2;
      velY = 16;
    }
  }
  
  void show(){
    if(duck && posY == 0){
      if(runCount < 0){
        image(dinoDuck, jugadorXpos - dinoDuck.width / 2, height - alturaPiso - (posY + dinoDuck.height));
      }
      else{
        image(dinoDuck1, jugadorXpos - dinoDuck1.width / 2, height - alturaPiso - (posY + dinoDuck1.height));
      }
    }
    else{
      if(posY == 0){
        if(runCount < 0){
          image(dinoRun1, jugadorXpos - dinoRun1.width / 2, height - alturaPiso - (posY + dinoRun1.height));
        }
        else{
          image(dinoRun2, jugadorXpos - dinoRun2.width / 2, height - alturaPiso - (posY + dinoRun2.height));
        }
      }
      else{
        image(dinoJump, jugadorXpos - dinoJump.width / 2, height - alturaPiso - (posY + dinoJump.height));
      }
    }
    
    if(!dead){
      runCount++;
    }
    if(runCount > 5){
      runCount = -5;
    }
  }
  
  void move(){
    posY += velY;
    if(posY > 0){
      velY -= gravity;
    }
    else{
      velY = 0;
      posY = 0;
    }
    
    for(int i = 0; i < obstaculos.size(); i++){
      if(dead){
        if(obstaculos.get(i).collided(jugadorXpos, posY + dinoDuck.height / 2, dinoDuck.width * 0.5, dinoDuck.height)){
          dead = true;
        }
      }
      else{
        if(obstaculos.get(i).collided(jugadorXpos, posY + dinoRun1.height / 2, dinoRun1.width * 0.5, dinoRun1.height)){
          dead = true;
        }
      }
    }
    
    for(int i = 0; i < pajaros.size(); i++){
      if(duck && posY == 0){
        if(pajaros.get(i).collided(jugadorXpos, posY + dinoDuck.height / 2, dinoDuck.width * 0.5, dinoDuck.height)){
          dead = true;
        }
      }
      else{
        if(pajaros.get(i).collided(jugadorXpos, posY + dinoRun1.height / 2, dinoRun1.width * 0.5, dinoRun1.height)){
          dead = true;
        }
      }
    }
  }
  
  void ducking(boolean isDucking){
    if(posY != 0 && isDucking){
      gravity = 3;
    }
    duck = isDucking;
  }
  
  void update(){
    incrementCounter();
    move();
  }
  
  void incrementCounter(){
    lifespan++;
    if(lifespan % 3 == 0){
      score += 1;
    }
  }
}
