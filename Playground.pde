class Playground {
  int Fal1X, Fal1Y, Fal1Size;
  public ArrayList<RocketParts> rocketParts = new ArrayList<RocketParts>();

  Playground() {
  }


                                                          //create rocketparts
  void partSetup(int amount) {
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
}
