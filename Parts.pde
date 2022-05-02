class Parts extends Things{
  int L1DposX, L1DposY;
  Parts[] parts;
  
  Parts() {
  
  }
  
  void partSetup(int amount, int level){
  parts = new Parts[amount];
  for (int i=0; i < parts.length; i++) {
    
    }
  
  }
  
  void show() {
  pushMatrix();
  if (parts != null) {
    for (int i = 0; i < parts.length; i++) {
      parts[i].show();
    }
  }
  
  }
  
}
