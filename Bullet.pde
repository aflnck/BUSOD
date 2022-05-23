class Bullet extends Things {
  float size;
  int vy;
  
  Bullet(int x, int y) {
    this.posX = x;
    this.posY = y - 15; // to make bullets a bit higher than a rocket, etc...
    this.size = 10;
    this.vy = -5;
  }
  
  void show() {
    fill(255, 0, 0);
    ellipse(this.posX, this.posY, size, size);
    this.posY+=vy;
  }
}
