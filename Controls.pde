class Controls{
  
  //if anyone knows, how to make this class static without breaking everything, that would be an improvement.
  
void mouseP() {
    playground.checkThingLocation(mouseX, mouseY);
    // this function sets both int "selectedObjID" and int "checkDinoLocation".
    // -> selectedObject: 0 is for Dino, 1 is for Rocket.  
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
 
