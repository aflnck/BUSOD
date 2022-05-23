class Rocket extends Things{
  boolean isVisible;
  int speed;
  
  Rocket(int RposX, int RposY) {
      //this.partPicture = loadImage(picture);
      this.posX = RposX;
      this.posY = RposY;
      this.speed = 20;
      //print("This is a Rocketpart:" + this.posX +" " + this.posY + " ");
  }
  
   void show(){
    fill(0,65,255);
    triangle(this.posX + 10, this.posY -17.32, this.posX+3 , this.posY, this.posX+17, this.posY);
    noFill();
    //bottom left triangle
    fill(0,65,255);
    triangle(this.posX-10, this.posY -17.32, this.posX -17, this.posY, this.posX -3, this.posY);
    noFill();
    //top triangle
    fill(19, 18, 140);
    triangle(this.posX, this.posY -34.32, this.posX +10, this.posY -18, this.posX-10, this.posY -18);
    noFill();
    //riverse bottom triangle
    fill(255,0,0);
    triangle(this.posX, this.posY -10.32, this.posX +10, this.posY -18, this.posX-10, this.posY -18);
   }
   
   void moveRight() {
     this.posX+=this.speed;
   }
   
   void moveLeft() {
     this.posX-=this.speed;
   }
}
