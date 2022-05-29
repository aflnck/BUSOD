class L1Dino extends Things{
  
  private PImage dinoPicture;
  private int colorR;
  private int colorG;
  private int colorB;
  private int generation;
  private int sizeX, sizeY;
  private int speedX, speedY, cyclesFromDC;
  private boolean movesRight;

  
  //constructor!
  L1Dino(String picture, int DposX, int DposY, int r, int g, int b, int dinoGeneration, int sizeX, int sizeY) {
  //this.age = 0;
  this.dinoPicture = loadImage(picture);
  this.posX = DposX;
  this.posY = DposY;
  this.colorR = r; //maybe someone knows how to extract rgb out of the dino picture? then we can create mixed generations of dinos.
  this.colorG = g; 
  this.colorB = b;
  this.generation = dinoGeneration;
  this.movesRight = false;
  this.sizeX = sizeX;
  this.sizeY = sizeY;
  }

  void move(int directionX, int directionY){
    this.posX = posX + directionX;
    this.posY = posY + directionY;
  }
  
  void jump(){
      this.posY = -35;
  }
  
  void changeMovesRight() {
    if (this.movesRight) {
      this.movesRight = false;
    } else {
      this.movesRight = true;
    }
  }
  
  void show() {
      image(this.dinoPicture, this.posX, this.posY, sizeX, sizeY);
    }
    
    int getSizeX(){
    return this.sizeX;
    }
        int getSizeY(){
    return this.sizeY;
    }
    
    
  int getColorR(){
    return this.colorR;
  }
  int getColorG(){
    return this.colorG;
  }
  int getColorB(){
    return this.colorB;
  }

  //START RANDOM MOVING OPERATIONS!!
   void moveRandomly() {
     this.speedX = int(random(3));
     if (this.posX >= 700) {
       this.changeMovesRight();
     }
     if (this.posX <= 40) {
       this.changeMovesRight();
     }

     if (random(1) <= 0.01) {
       this.speedX = 0;
       this.speedY = 0;
     }

     //set back +35 after 0.2 "gameyears" later..?
     if (this.movesRight) {
       this.posX = this.posX - this.speedX; //updating actual location.
     } else {
       this.posX = this.posX + this.speedX; //updating actual location.
     }
   }
   //END RANDOM MOVING OPERATIONS !!
}
