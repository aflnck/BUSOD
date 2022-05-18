class Meteorite extends Things{

int metSize;
float metSpeedX;
float metSpeedY; //basically gravity & size
PImage metPicture;

//meteorites falling down 
  Meteorite(int metSize, int posX, int posY){
    this.metSize = metSize;
    this.metPicture = loadImage("meteorite.jpg");
    this.posX = posX;
    this.posY = posY;
    this.metSpeedX = metSize/800; //maybe use something like: constrain(this.y, 0, height - this.r);
    this.metSpeedY = 1;//with this parameter they are falling down 
    
    //random(6)-3;
    
    //print("This is a Meteorite:" + this.posX +" " + this.posY + " ");
    
   
  }

   void show(){
      image(this.metPicture, this.posX, this.posY, this.metSize*1.5, this.metSize);
      image(this.metPicture, this.posX+20, this.posY, this.metSize*2, this.metSize);
      image(this.metPicture, this.posX+200, this.posY, this.metSize*2.5, this.metSize);
       image(this.metPicture, this.posX-200, this.posY, this.metSize*2.5, this.metSize);
   }
   
   void fall(){
     //this.metSpeedY = metSpeedY + random(6)-3;
     //print(" // "+this.metSpeedX);
     //this.metSpeedY = metSpeedY- (posX/1000);
    this.posX = this.posX + int(metSpeedX);
    this.posY = this.posY + int(metSpeedY);
 
 }
   
}

