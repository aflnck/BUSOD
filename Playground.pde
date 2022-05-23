class Playground {
  public Rocket rocket;
  public ArrayList<Rocket> rocketList = new ArrayList<Rocket>();
  public ArrayList<Meteorite> meteoriteList = new ArrayList<Meteorite>();
  public ArrayList<L1Dino> dinoList = new ArrayList<L1Dino>();
  public ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
  EndScene end;
  PImage backgroundImg;
  PImage bombPicture;
  int selectedObject = 10; // -> selectedObject: 0 is for Dino, 1 is for Rocket.
  int selectedObjID;
  int metFrequency = 10;

  Playground() {
      this.bombPicture = loadImage("bomb.png");
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
      int size = 50;
      dinoList.add(new L1Dino(pictureStorage, posX, posY, r, g, b, 1, size)); //these dinos have generation 1.
    }
  }

  void showDinos() {
    if (dinoList != null) {
      for (int i = 0; i < dinoList.size(); i++) {
        dinoList.get(i).show();
      }
    }
  }

  // section Rocket
  void rocketSetup() {
    int posX = int(width/2);
    int posY = int((height/2) + 50);
    rocket = new Rocket(posX, posY);
  }    
  
  void showRocket() {
    if (rocket != null) {
     rocket.show(); 
    }
  }
  
  // section Meteorites
  void addMeteorite(int amount) {
    for (int i=0; i < amount; i++) {
      int meteoriteSize = int(random(23)+30);
      int posX = int(random(720));
      int posY = int(random(100));
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
  
  void showBullets() {
    for (int i = 0; i<bulletList.size(); i++) {
      //i is every number from 0 to the size of the bullet array
      //println(bullets.get(i).x);
      bulletList.get(i).show();
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
  
  // rocket section
  void moveRight() {
    if (rocket != null) {
        rocket.moveRight();
    }
  }
  void moveLeft() {
    if (rocket != null) {
        rocket.moveLeft();
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
 
  
  int getClosestDino(Meteorite met) {
      int index = -1;
      float minDist = 10000000;
      for (int i = 0; i < dinoList.size(); i++) {
         L1Dino dino = dinoList.get(i);
         if (met.checkCollision(dino)) {
             float distance = dist(met.posX, met.posY, dino.posX, dino.posY);
             if (distance < minDist) {
               minDist = distance;
               index = i;
             }
         }
      }
      
      return index;
  }
  
  void checkCollision() {
    for (int i = 0; i < meteoriteList.size(); i++) {
      Meteorite met = meteoriteList.get(i);
      
      // if met collided rocket, we lose
      if (met.checkCollision(rocket) == true) {
        rocket = null;
        end = new EndScene();
      }
      
      // check collision of bullets and meteriots
      for (int b = 0; b < bulletList.size(); b++) {
        Bullet bullet = bulletList.get(b);
        if (met.checkCollision(bullet) == true) {
          meteoriteList.remove(met);
          bulletList.remove(bullet);
          i++; // skip current met at index i
        }
      }
      
      // check collision of closest dino and meteriots
      int dinoIdToDelete = getClosestDino(met);
      if (dinoIdToDelete != -1) {
          int dinoX = dinoList.get(dinoIdToDelete).posX;
          int dinoY = dinoList.get(dinoIdToDelete).posY;
          dinoList.remove(dinoIdToDelete);
          meteoriteList.remove(i);
          image(this.bombPicture, dinoX, dinoY, 150, 130);
          smooth(); 
          delay(500);
      }
    }
  }
}
//there is exactly no missing curly bracket here, besides processing saying it would be.
