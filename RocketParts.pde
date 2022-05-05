class RocketParts extends Things{

  boolean isVisible;
  PImage partPicture;
  RocketParts(String picture, int RposX, int RposY) {
      this.partPicture = loadImage(picture);
      this.posX = RposX;
      this.posY = RposY;
      //print("This is a Rocketpart:" + this.posX +" " + this.posY + " ");
  }
   void show(){
      image(this.partPicture, this.posX, this.posY, 50, 50);
   }
}
