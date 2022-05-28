class Controls{
  
  //if anyone knows, how to make this class static without breaking everything, that would be an improvement.
  
void mouseP() {
    if (gameStage == 0 && startScene.checkStartButton()){
      gameStage = 1;
    }
}
  
  void keyP() {
      if (keyCode == RIGHT && true) {
        playground.moveRight();
      } else if (keyCode == LEFT && true) {
        playground.moveLeft();
    } else if (key == ' ') {
      Rocket rocket = playground.rocket;
      Bullet b = new Bullet(rocket.posX, rocket.posY);
      playground.bulletList.add(b);
    }
  } 
}
 
