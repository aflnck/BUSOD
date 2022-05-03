class Playground {

  public ArrayList<RocketParts> rocketParts = new ArrayList<RocketParts>();
  public ArrayList<Rocket> rocketList = new ArrayList<Rocket>();
  public ArrayList<Meteorite> meteoriteList = new ArrayList<Meteorite>();
  public ArrayList<Train> trains = new ArrayList<Train>();
  
  Playground() {
  }
  
  void createRockets(int amount){
    for (int i=0; i < amount; i++) {
      String pictureStorage = "rocket"+i+".png";
      int posX = (i*50)+50;
      int posY = int(random(100)+300);
      rocketList.add(new Rocket(pictureStorage,posX, posY));
  }
  }
    void showRockets() {
    if (rocketList != null) {
      for (int i=0; i < rocketList.size(); i++) {
        rocketList.get(i).show();
        
      }
    }
  }
                                                          //create rocketparts
  void rocketPartSetup(int amount) {
    for (int i=0; i < amount; i++) {
      String pictureStorage = "rocketPart"+i+".png";
      int posX = int(random(400));
      int posY = int(random(100)+300);      
      rocketParts.add(new RocketParts(pictureStorage,posX, posY));
    }
  }                                                        //show rocketparts
  void showRocketParts() {
    if (rocketParts != null) {
      for (int i=0; i < rocketParts.size(); i++) {
        rocketParts.get(i).show();
        
      }
    }
  }
  void addMeteorite() {
    int meteoriteSize = int(random(5));
      meteoriteList.add(new Meteorite(meteoriteSize));
  }

}
//void moveMeteorites(0,-700,2){


//void showMeteorites(){
