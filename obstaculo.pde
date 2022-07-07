class Obstaculo{
  float posX;
  int w, h;
  int type;
  
  Obstaculo(int t){
    posX = width;
    type = t;
    switch(type){
      case 0: w = 20;
              h = 40;
              break;
      case 1: w = 30;
              h = 60;
              break;
      case 2: w = 60;
              h = 40;
              break;
    }
  }
  
  void show(){
    switch(type){
      case 0: image(cactusChico, posX - cactusChico.width / 2, height - alturaPiso - cactusChico.height);
              break;
      case 1: image(cactusGrande, posX - cactusGrande.width / 2, height - alturaPiso - cactusGrande.height);
              break;
      case 2: image(cactusChiquitos, posX - cactusChiquitos.width / 2, height - alturaPiso - cactusChiquitos.height);
              break;
    }
  }
  
  void move(float speed){
    posX -= speed;
  }
  
  boolean collided(float playerX, float playerY, float playerWidth, float playerHeight){
    float playerLeft = playerX - playerWidth / 2;
    float playerRight = playerX + playerWidth / 2;
    float thisLeft = posX - w / 2;
    float thisRight = posX + w / 2;
    
    if(playerLeft < thisRight && playerRight > thisLeft){
      float playerDown = playerY - playerHeight / 2;
      float thisUp = h;
      if(playerDown < thisUp){
        return true;
      }
    }
    return false;
  }
}
