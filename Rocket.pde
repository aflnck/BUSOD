class Rocket extends Things{
  int Rsize;
    PImage rocketPicture;

  
  Rocket(String picture, int RposX, int RposY) {
      this.rocketPicture = loadImage(picture);
      this.posX = RposX;
      this.posY = RposY;
  }
   void show(){
      image(this.rocketPicture, this.posX, this.posY, 50, 50);
   }
}
