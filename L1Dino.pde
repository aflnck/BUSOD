class L1Dino extends Things{
  String skill;
  int age;

  L1Dino[] dinos;
  
  L1Dino() {
  
  }
  
  void love(int amount, int level){
  dinos = new L1Dino[amount];
  for (int i=0; i < dinos.length; i++) {
    
    }
  
  }
  
  void show() {
  pushMatrix();
  if (dinos != null) {
    for (int i = 0; i < dinos.length; i++) {
      dinos[i].show();
    }
  }
  
  }
  
}
