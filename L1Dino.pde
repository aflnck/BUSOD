class L1Dino extends Things{
  //L1Dino[] dinos;
  //String skill;
  
  PImage dinoPicture;
  int age;
  int colorR;
  int colorG;
  int colorB;
  int generation;
  
  //constructor!
  L1Dino(String picture, int DposX, int DposY, int r, int g, int b, int dinoGeneration) {
  this.age = 0;
  this.dinoPicture = loadImage(picture);
  this.posX = DposX;
  this.posY = DposY;
  this.colorR = r; //maybe someone knows how to extract rgb out of the dino picture? then we can create mixed generations of dinos.
  this.colorG = g; //or we generate these dinos with sines & elypses in processing, this would make ms. tiwari incredibly happy^^
  this.colorB = b;
  this.generation = dinoGeneration;
  //print("This is a Dino, set param.:" + this.posX +" " + this.posY + " ");
  //print("This is a Dino, brought parameters:" + DposX +" " + DposY + " ");
  }

  void move(int directionX, int directionY){
    this.posX = posX + directionX;
    this.posY = posY + directionY;
  }
  
  void jump(){
      this.posY = -35;
      //set back +35 after 0.2 "gameyears" later..?
  }
  
  void show() {
      image(this.dinoPicture, this.posX, this.posY, 80, 50);
    }

//getter / setter methods:
  int getColorR(){
    return this.colorR;
  }
  int getColorG(){
    return this.colorR;
  }
  int getColorB(){
    return this.colorR;
  }
}
