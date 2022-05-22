class L1Dino extends Things {

  //L1Dino[] dinos;
  //String skill;

  private PImage dinoPicture;
  private int age  = 0;
  private int colorR;
  private int colorG;
  private int colorB;
  private int generation;
  private int speedX, speedY;
  private int cyclesFromDC;

  //constructor!
  L1Dino(String picture, int DposX, int DposY, int r, int g, int b, int dinoGeneration) {
    //this.age = 0;
    this.dinoPicture = loadImage(picture);
    this.posX = DposX;
    this.posY = DposY;
    this.speedX = int(random(5));
    this.speedY = int(random(5));
    this.cyclesFromDC=0;
    this.colorR = r; //maybe someone knows how to extract rgb out of the dino picture? then we can create mixed generations of dinos.
    this.colorG = g; //or we generate these dinos with sines & elypses in processing, this would make ms. tiwari incredibly happy^^
    this.colorB = b;
    this.generation = dinoGeneration;
    //print("This is a Dino, set param.:" + this.posX +" " + this.posY + " ");
    //print("This is a Dino, brought parameters:" + DposX +" " + DposY + " ");
  }

  void move(int directionX, int directionY) {
    this.posX = posX + directionX;
    this.posY = posY + directionY;
  }

  //void jump(){ //would be funny if dinos could jump.
  //    this.posY = -35;

  //    //set back +35 after 0.2 "gameyears" later..?
  //}
  
  //START RANDOM MOVING OPERATIONS!!
  void moveRandomly() {

    if (this.posX > 700) {
      this.speedX = this.speedX - (speedX*2); //change direction if wanting to run off-screen:
      this.cyclesFromDC = 0;
    }
    if (this.posY > 400) {
      this.speedY = this.speedY - (speedY*2); //change direction if wanting to run off-screen:
      this.cyclesFromDC = 0;
    }
    if (this.posX < 40) {
      this.speedX = this.speedX - (speedX*2); //change direction if wanting to run off-screen:
      this.cyclesFromDC = 0;
      print(" -------speed: "+this.speedX + " & posX:"+this.posX);
    }
    if (this.posY < 300) {
      this.speedY = this.speedY - (speedY*2); //change direction if wanting to run off-screen:
      this.cyclesFromDC = 0;
    }

    if (random(1) < 0.02) {
      if (this.speedX < 0.1 && this.cyclesFromDC > 10) { //only interferes direction making if the last screen-border-touching has been at least 10 updates ago.
        this.speedX = this.speedX + int((random(3))); //change direction from time to time.
      } else if (this.speedX > 0 && this.cyclesFromDC > 10) {
        this.speedX = this.speedX - int((random(3)));
      }
      if (this.speedY < 0.1 && this.cyclesFromDC > 10) {
        this.speedY = this.speedY + int((random(3)));
      } else if (this.speedY > 0 && this.cyclesFromDC > 10) {
        this.speedY = this.speedY - int((random(3)));
      }
    }
    if (random(1) < 0.01) { //sometimes, dinos stop & eat some grass.
      this.speedX = 0;
      this.speedY = 0;
    }
    this.cyclesFromDC ++; //indicating if direction change has just yet been made.

    this.posX = this.posX + this.speedX; //updating actual location.
    this.posY = this.posY + this.speedY;
  }
  //END RANDOM MOVING OPERATIONS !!
  
  void show() {
    if (speedX < 0.1) {
      image(this.dinoPicture, this.posX, this.posY, 80, 50); //dino looks to the left.
    } else {
      image(this.dinoPicture, this.posX, this.posY, 80, 50);  //else, to the right.
    }
  }
  
  //getter / setter methods:
  int getColorR() {
    return this.colorR;
  }
  int getColorG() {
    return this.colorG;
  }
  int getColorB() {
    return this.colorB;
  }
}
