public class Background {

  color green =  #63E06B;
  color dgreen = #217424;
  color yellow = #FFD05E;
  color blue =   #40B0E2;
  color white =  #FFFFFF;

  int x1 = -200; //big hills
  int x2 = 200;
  int x3 = 600;

  int x4 = 400; //cloud

  int x5 = -200; //small hills
  int x6 = 0;
  int x7 = 200;
  int x8 = 400;
  int x9 = 600;
  int x10 = 800;

  Background() {
    //currently empty constructor.
  }

  void drawB() {
    background(blue); //sky

    fill(white); //cloud
    ellipse(x4, 150, 100, 100);
    ellipse(x4, 200, 100, 100);
    ellipse(x4-50, 200, 100, 100);
    ellipse(x4+50, 200, 100, 100);

    fill(green); //black hills
    ellipse(x1, 400, 400, 400);
    ellipse(x2, 400, 400, 400);
    ellipse(x3, 400, 400, 400);

    fill(yellow); //ground
    rect(0, 400, 800, 200);

    //move cloud
    x4 = x4 + 1;
    if (x4 == 1000) {
      x4 = -200;
    }
    //move back hills
    x1 = x1 + 2;
    x2 = x2 + 2;
    x3 = x3 + 2;

    //teleport staff
    if (x1 >= 1000) {
      x1 = -200;
    }
    if (x2 >= 1000) {
      x2 = -200;
    }
    if (x3 >= 1000) {
      x3 = -200;
    }

    //move foreground hills
    x5 = x5 + 4;
    x6 = x6 + 4;
    x7 = x7 + 4;
    x8 = x8 + 4;
    x9 = x9 + 4;
    x10 = x10 + 4;

    if (x5 >= 1000) {
      x5 = -200;
    }
    if (x6 >= 1000) {
      x6 = -200;
    }
    if (x7 >= 1000) {
      x7 = -200;
    }
    if (x8 >= 1000) {
      x8 = -200;
    }
    if (x9 >= 1000) {
      x9 = -200;
    }
    if (x10 >= 1000) {
      x10 = -200;
    }
  }
}
