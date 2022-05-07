class Meteorite extends Things{

int metSize;
float metSpeedX;
float metSpeedY; //basically gravity & size
PImage metPicture;


  Meteorite(int metSize, int posX, int posY){
    this.metSize = metSize;
    this.metPicture = loadImage("meteorite.jpg");
    this.posX = posX;
    this.posY = posY;
    this.metSpeedX = random(6)-3; //maybe use something like: constrain(this.y, 0, height - this.r);
    this.metSpeedY = metSize/60;
    
    //print("This is a Meteorite:" + this.posX +" " + this.posY + " ");
  }

   void show(){
      image(this.metPicture, this.posX, this.posY, this.metSize*1.5, this.metSize);
   }
   
   void fall(){
     this.metSpeedX = metSpeedX - (posX/1000);
     //print(" // "+this.metSpeedX);
     this.metSpeedY = metSpeedY + (metSize/60);
     this.posX = this.posX + int(metSpeedX);
     this.posY = this.posY + int(metSpeedY);

   }

  
}
