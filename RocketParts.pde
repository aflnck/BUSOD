class RocketParts extends Things{
  int RPposX, RPposY;
  PImage partPicture;
  RocketParts(String picture, int posX, int posY) {
      this.partPicture = loadImage(picture);
      this.RPposX = posX;
      this.RPposY = posY;
  }
   void show(){
      image(this.partPicture, this.RPposX, this.RPposY, 50, 50);
   }
}
