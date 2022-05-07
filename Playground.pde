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
    backgroundImg = loadImage("background.jpg");
  }

  //background selection:
  void updateBackground() {
    switch(gameStage) {
    case 0:
      background(backgroundImg);
      break;
    case 1: //
      break;
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

  //check what element of the lists got selected:
  void checkThingLocation(int mousePosX, int mousePosY) {
    //check if selected is a Dino & what dino it exactly is:
    if (dinoList != null) {
      for (int i=0; i < dinoList.size(); i++) {
        int dinoX = dinoList.get(i).getPosX();
        int dinoY = dinoList.get(i).getPosY();
        if (dinoX < mousePosX && dinoX + 80 > mousePosX && // TODO: extract this function into the things class!
          dinoY < mousePosY && dinoY + 50 > mousePosY) { // TORESEARCH: colourpicker in mouseLocation to determine
          //the if dino is clicked or if on background.
          selectedObject = 0; // 0 is for Dino!
          selectedObjID = i; // which rocket (in arrayList) is it?
        }
      }
    }
    //check if selected is a Rocket & what rocket it exactly is: (can only select the last rocket:)
    if (rocketList != null) {
      int rocketX = rocketList.get(rocketList.size()-1).getPosX();
      int rocketY = rocketList.get(rocketList.size()-1).getPosY();
      if (rocketX < mousePosX && rocketX + 50 > mousePosX &&
        rocketY < mousePosY && rocketY + 50 > mousePosY) {
        print("issa Rocket, "+rocketX + " " + rocketY + " ");
        selectedObject = 1; // 1 is for Rocket!
        selectedObjID = rocketList.size()-1; // which rocket (in arrayList) is it?
      }
    }
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

  void highlightSelectedObj() {
    if (selectedObject != 10) {
      int objectX = 0;
      int objectY = 0;
      if (selectedObject == 0) { //if its a dino!
        objectX = dinoList.get(selectedObjID).getPosX();
        objectY = dinoList.get(selectedObjID).getPosY();
      } else if (selectedObject == 1) { // if it` a Rocket
        objectX = rocketList.get(selectedObjID).getPosX();
        objectY = rocketList.get(selectedObjID).getPosY();
      }
      stroke(255, 103, 111);
      strokeWeight(6);
      fill(0, 0);

      //TODO if selectedObject == 0){ make it 80x50, else as big as a rocket.}
      rect(objectX, objectY, 52, 52);
    }
  }
}
//there is exactly no missing curly bracket here, besides processing saying it would be.
