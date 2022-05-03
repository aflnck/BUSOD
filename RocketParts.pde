class RocketParts extends Things{

  PImage partPicture;
  RocketParts(String picture, int RposX, int RposY) {
      this.partPicture = loadImage(picture);
      this.posX = RposX;
      this.posY = RposY;
  }
   void show(){
      image(this.partPicture, this.posX, this.posY, 50, 50);
   }
}
