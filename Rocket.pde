class Rocket extends Things{
  int Rsize;
  PImage rocketPicture;
  int fuel;
  boolean rocketStartable;

  Rocket(String picture, int RposX, int RposY) {
      this.rocketPicture = loadImage(picture);
      this.posX = RposX;
      this.posY = RposY;
      fuel = 100000; //lb`s of fuel of a falcon 1.
      rocketStartable = false;
  }
   void show(){
      image(this.rocketPicture, this.posX, this.posY, 40, 40);
   }
   void prepare(){
     posX = 700;
     posY = 300;
   }
   void move(int x, int y){
     fuel = fuel -1000; //can do 100 steps like this.
     //if rocket Y relative to starting base, into negative -> crash.
   }
//getter / setter methods:
  int getposX(){
    return this.posX;
  }
  int getposY(){
    return this.posY;
  }
}
