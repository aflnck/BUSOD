//var decl.
int currentYear;

Playground playground;

Meteorite met;
PImage MetImg;

Falcon1 rocket1;
PImage Fal1Img;
Unicorn unicorn;
PImage uImg;
PImage tImg;
PImage bImg;
ArrayList<Train> trains = new ArrayList<Train>();
PImage L1DinoImg;


void mousePressed() {
}

void setup() {
  size(800, 450);
  playground = new Playground();
  //pic initialisation
  uImg = loadImage("unicorn.png");
  tImg = loadImage("train.png");
  bImg = loadImage("background.jpg");
  Fal1Img = loadImage("Fal1.jpg");
  L1DinoImg = loadImage("unicorn.png");

  unicorn = new Unicorn();
  playground.partSetup(6);

}


void keyPressed() {
  if (key == 'w') {
    //Things.move();
  } else if (key == 's') {
  }
}

void draw() {

  if (random(1) < 0.005) {
    trains.add(new Train());
  }

  //background(bImg);
  for (Train t : trains) {
    t.move();
    t.show();
    if (unicorn.hits(t)) {
      print("game over");
      noLoop();
    }
  }

  unicorn.show();
  unicorn.move();
  playground.showRocketParts();
}
