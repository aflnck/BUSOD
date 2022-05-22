class Playground {

  public ArrayList<RocketParts> rocketParts = new ArrayList<RocketParts>();
  public ArrayList<Rocket> rocketList = new ArrayList<Rocket>();
  public ArrayList<Meteorite> meteoriteList = new ArrayList<Meteorite>();
  public ArrayList<L1Dino> dinoList = new ArrayList<L1Dino>();
  PImage backgroundImg;
  int selectedObject = 10; // -> selectedObject: 0 is for Dino, 1 is for Rocket.
  int selectedObjID;

  //constructor!
  Playground() {
    //backgroundImg = loadImage("background.jpg");
  }

color green =  #63E06B;
color dgreen = #217424;
color yellow = #FFD05E;
color blue =   #40B0E2;
color white =  #FFFFFF;

int x1 = -200; //big hills
int x2 = 200;
int x3 = 600;

int x4 = 400; //cloud

int x5 = -200; //small hills
int x6 = 0;
int x7 = 200;
int x8 = 400;
int x9 = 600;
int x10 = 800;
  
  void drawB() {
    background(blue); //sky
  
 fill(white); //cloud
 ellipse(x4, 150, 100, 100);
 ellipse(x4, 200, 100, 100);
 ellipse(x4-50, 200, 100, 100);
 ellipse(x4+50, 200, 100, 100);
 
 fill(green); //black hills
 ellipse(x1, 400, 400, 400);
 ellipse(x2, 400, 400, 400);
 ellipse(x3, 400, 400, 400);
 
 fill(yellow); //ground
 rect(0, 400, 800, 200);
 
 //move cloud
 x4 = x4 + 1;
 if (x4 == 1000) {
    x4 = -200;
 }
 //move back hills
 x1 = x1 + 2;
 x2 = x2 + 2;
 x3 = x3 + 2;
 
 //teleport staff
 if (x1 >= 1000) {
   x1 = -200;
 }
 if (x2 >= 1000) {
   x2 = -200;
 }
 if (x3 >= 1000) {
   x3 = -200;
 }
 
 //move foreground hills
 x5 = x5 + 4;
 x6 = x6 + 4;
 x7 = x7 + 4;
 x8 = x8 + 4;
 x9 = x9 + 4;
 x10 = x10 + 4;
 
 if (x5 >= 1000){
   x5 = -200;
 }
 if (x6 >= 1000){
   x6 = -200;
 }
 if (x7 >= 1000){
   x7 = -200;
 }
 if (x8 >= 1000){
   x8 = -200;
 }
 if (x9 >= 1000){
   x9 = -200;
 }
 if (x10 >= 1000){
   x10 = -200;
 }
  }


  void createInitialDinos() {
    for (int i = 0; i < 5; i ++) {
      String pictureStorage = "dino"+i+".png";
      int posX = (i*150)+50;
      int posY = int(random(100)+300);
      int r = i*50;
      int g = i*50;
      int b = i*50;
      dinoList.add(new L1Dino(pictureStorage, posX, posY, r, g, b, 1)); //these dinos have generation 1.
    }
  }
  void dinoLove(int amount, int level) {
    //dinoList.add(newDino(..TODO..);
    //dinogeneration parameter +1
    //
  }
  void showDinos() {
    if (dinoList != null) {
      for (int i = 0; i < dinoList.size(); i++) {
        dinoList.get(i).show();
      }
    }
  }

  //create rocketparts
  void rocketPartSetup(int amount) {
    for (int i=0; i < amount; i++) {
      String pictureStorage = "rocketPart"+i+".png";
      int posX = int(random(400));
      int posY = int(random(100)+300);
      rocketParts.add(new RocketParts(pictureStorage, posX, posY));
    }
  }                                                        //show rocketparts
  void showRocketParts() {
    if (rocketParts != null) {
      for (int i=0; i < rocketParts.size(); i++) {
        rocketParts.get(i).show();
      }
    }
  }
  void addMeteorite(int amount) {
    for (int i=0; i < amount; i++) {
      int meteoriteSize = int(random(23)+8);
      int posX = int(random(720));
      int posY = int(random(200));
      meteoriteList.add(new Meteorite(meteoriteSize, posX, posY));
    }
  }
  void showMeteorites() {
    if (meteoriteList != null) {
      for (int i=0; i < meteoriteList.size(); i++) {
        meteoriteList.get(i).show();
      }
    }
  }
  void fallMeteorites() {
    if (meteoriteList != null) {
      for (int i=0; i < meteoriteList.size(); i++) {
        meteoriteList.get(i).fall();
      }
    }
  }


  void moveDinosRandomly(int r){
    //print("  -  "+r);
      //if (selectedObject != 0 || (selectedObjID != dinoList.get(r).getID() && selectedObject == i)){ //if its not a dino, or if its a dino & not the currently selectedDino, then:
      dinoList.get(r).moveRandomly(); // should add speed to move dinos with speed variable over continious cycles.
      //}
  }
  
  void moveRight() {
    if (selectedObject == 0) {
      dinoList.get(selectedObjID).move(2, 0);
    } else if (selectedObject == 1 && oc1.rocketReady()) {
      rocketList.get(selectedObjID).move(2, 0);
    }
  }
  void moveLeft() {
    if (selectedObject == 0) {
      dinoList.get(selectedObjID).move(-2, 0);
    } else if (selectedObject == 1 && oc1.rocketReady()) {
      rocketList.get(selectedObjID).move(-2, 0);
    }
  }
  void moveUp() {
    if (selectedObject == 0) {
      dinoList.get(selectedObjID).move(0, -2);
    } else if (selectedObject == 1 && oc1.rocketReady()) {
      rocketList.get(selectedObjID).move(0, -2);
    }
  }
  void moveDown() {
    if (selectedObject == 0) {
      dinoList.get(selectedObjID).move(0, 2);
    } else if (selectedObject == 1 && oc1.rocketReady()) {
      rocketList.get(selectedObjID).move(0, 2);
    }
  }
  
  //getters & setters:
  int getDinoListSize(){
  return dinoList.size();
  }
}
//there is exactly no missing curly bracket here, besides processing saying it would be.
