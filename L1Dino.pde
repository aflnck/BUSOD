class L1Dino {
  String skill;
  int age;
  int L1DposX, L1DposY;
  L1Dino[] dinos;
  
  L1Dino() {
  
  }
  
  void love(int amount, int level){
  childDinos = new L1Dino[amount];
  for (int i=0; i < childDinos.length; i++) {
    
    }
  
  }
  
  void show() {
  pushMatrix();
  if (childDinos != null) {
    for (int i = 0; i < childDinos.length; i++) {
      childDinos[i].show();
    }
  }
  
  }
  
}
