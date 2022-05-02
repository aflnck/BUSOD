class Things {
  
  
  
  void hits(int posX, int posY, int posX2, int posY2){

  
}

void move(){
    this.y += this.vy;
    this.vy += this.gravity;
    this.y = constrain(this.y, 0, height - this.r);
}

  
}
