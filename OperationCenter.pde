class OperationCenter {

  //all sorts of stuff that matters to rockets.
  //dinos can start rockets if they walk to this area,
  //shows how much fuel there` left in the current rocket
  //maybe shows a "cockpit" with rocketAngle or stuff like this.

OperationCenter(){
}
  void showOC(){
    fill(100);
    rect(350,320,180,30);
  }
  boolean rocketReady() {
    //returns boolean if rocket is ready (flying, or ready at start base) or not.
    return true;
  }

  void createRockets(int amount) {
    for (int i=0; i < amount; i++) {
      //String pictureStorage = "rocket"+i+".png";
      String pictureStorage = "Fal1.jpg";
      int posX = 30;
      int posY = (i * 50)+60;
      playground.rocketList.add(new Rocket(pictureStorage, posX, posY));
    }
  }

//TODO: Maybe move these into playground again, but executed from here..? (playground.rocketList is a 
      //bit dumb when used that many times)
      
  void prepareRocket() {
    playground.rocketList.get(playground.rocketList.size()-1).prepare(); //takes rocket from list to starting ramp.
    //rocketStartable = true;
    //make rocket viewAble in startblock.
  }
  void startRocket() {
    //if rocket startable, then:
    //rocketAvail = false;
  }
  void meteoriteHit() {
    //meteoriteFlyaway();
    //explosion(certainLocation);
    playground.rocketList.remove(playground.rocketList.size()-1);
  }
  void showRockets() {
    if (playground.rocketList != null) {
      for (int i=0; i < playground.rocketList.size(); i++) {
        playground.rocketList.get(i).show();
      }
    }
  }
}
