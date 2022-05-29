class Playground {
  public Rocket rocket;
  public ArrayList<Rocket> rocketList = new ArrayList<Rocket>();
  public ArrayList<Meteorite> meteoriteList = new ArrayList<Meteorite>();
  public ArrayList<L1Dino> dinoList = new ArrayList<L1Dino>();
  public ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
  EndScene end;
  private float playerScore = 100;

  PImage bombPicture;
  int selectedObject = 10; // -> selectedObject: 0 is for Dino, 1 is for Rocket.
  int selectedObjID;
  int metFrequency = 10;

  Playground() {
      this.bombPicture = loadImage("bomb.png");
  }

  void createInitialDinos() {
    for (int i = 0; i < 5; i ++) {
      String pictureStorage = "dino"+i+".png";
      int posX = (i*150)+50;
      int posY = int(random(100)+300);
      int r = i*50;
      int g = i*50;
      int b = i*50;
      int sizeX = 150;
      int sizeY = 130;
      dinoList.add(new L1Dino(pictureStorage, posX, posY, r, g, b, 1, sizeX, sizeY)); //these dinos have generation 1.
    }
  }

  void showDinos() {
    if (dinoList != null) {
      for (int i = 0; i < dinoList.size(); i++) {
        dinoList.get(i).show();
      }
    }
  }
  
  void moveDinos() {
    if (dinoList != null) {
      for (int i = 0; i < dinoList.size(); i++) {
        dinoList.get(i).moveRandomly();
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
  
  int getPlayerScore(){
  return int(playerScore);
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
        gameStage = 2; //display EndScene
      }
      
      // check collision of bullets and meteorites
      for (int b = 0; b < bulletList.size(); b++) {
        Bullet bullet = bulletList.get(b);
        if (met.checkCollision(bullet) == true) {
          meteoriteList.remove(met);
          bulletList.remove(bullet);
          playerScore = playerScore + 9;
          print (playerScore);
          i++; // skip current met at index i
        }
      }
      
      // check collision of closest dino and meteorites
      int dinoIdToDelete = getClosestDino(met);
      if (dinoIdToDelete != -1) {
          int dinoX = dinoList.get(dinoIdToDelete).posX;
          int dinoY = dinoList.get(dinoIdToDelete).posY;
          playerScore = int(playerScore * 0.7); // if the dino dies, the playerscore is getting punched.
          dinoList.remove(dinoIdToDelete);
          meteoriteList.remove(i);
          image(this.bombPicture, dinoX, dinoY, 150, 130);
          smooth(); 
          delay(500);
      }
      if (met.posY > met.getDestructionY()){
        meteoriteList.remove(met);
        //TODO: destructionList.add(new Destruction);
      }
    }
  }
}
