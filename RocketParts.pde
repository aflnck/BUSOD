class RocketParts extends Things{
  int L1DposX, L1DposY;
  RocketParts[] rocketParts;
  
  RocketParts() {
  
  }
  

  
  void show() {
  pushMatrix();
  if (rocketParts != null) {
    for (int i = 0; i < rocketParts.length; i++) {
      rocketParts[i].show();
    }
  }
  
  }
  
}
