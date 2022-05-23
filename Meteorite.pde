class Meteorite extends Things{

int metSize;
float metSpeedX;
float metSpeedY; 
PImage metPicture;
int destructionY; //at this Y, the meteorite will crash automatically.

//meteorites falling down 
  Meteorite(int metSize, int posX, int posY){
    this.metSize = metSize;
    this.posX = posX;
    this.posY = posY;
    this.metSpeedX = metSize/800; //maybe use something like: constrain(this.y, 0, height - this.r);
    this.metSpeedY = 1;//with this parameter they are falling down 
    this.destructionY = int(random(40))+430;
   
  }

   void show(){
      fill(0,63,6);
      ellipse( this.posX, this.posY, this.metSize*1.5, this.metSize);
    //ellipse(this.posX+20, this.posY, this.metSize*2, this.metSize);
    //ellipse(this.posX+200, this.posY, this.metSize*2.5, this.metSize);
    //ellipse(this.posX-200, this.posY, this.metSize*2.5, this.metSize);
 }
   public void fall(){
    this.posX = this.posX + int(metSpeedX);
    this.posY = this.posY + int(metSpeedY);
 
 }  
 
   boolean checkCollision(Object obj){
     if (obj instanceof Rocket) {
      Rocket rocket = (Rocket)obj;
      float apothem = 10 * tan(60);
      float distance = dist(this.posX, this.posY, rocket.posX, rocket.posY-apothem);
      if (distance < this.metSize/2 + apothem + 10) {        
        return true;
        }
      } else if (obj instanceof L1Dino) {
        L1Dino dino = (L1Dino)obj;
        float distance = dist(this.posX, this.posY, dino.posX + dino.getSizeX()/2, dino.posY + dino.getSizeY()/1.3);
        if (distance < metSize/2+dino.sizeX/2) {
          return true;
        }
     } else if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;
        float distance = dist(this.posX, this.posY, bullet.posX, bullet.posY); 
        if (distance <= metSize/2 + bullet.size/2 ) {        
          return true;
        }
    }
     
     return false;
   }
   
   //getters&setters:
   int getDestructionY(){
   return destructionY;
   }
}
