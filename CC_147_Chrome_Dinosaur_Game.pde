//var decl.
int currentYear;

Playground playground;

Meteorite met;


Rocket rocket1;

Unicorn unicorn;
PImage uImg;
PImage tImg;
PImage bImg;

void mousePressed() {
}

void settings(){
  size(1300, 650);
}

void setup() {
  playground = new Playground();

  uImg = loadImage("unicorn.png");
  tImg = loadImage("train.png");
  bImg = loadImage("background.jpg");

  unicorn = new Unicorn();
  playground.rocketPartSetup(6);


ArrayList<Train> trains = new ArrayList<Train>();


void mousePressed() {
  trains.add(new Train());
}

void setup() {
  size(800, 450);
  uImg = loadImage("unicorn.png");
  tImg = loadImage("train.png");
  bImg = loadImage("background.jpg");
  unicorn = new Unicorn();
}


void keyPressed() {
  if (key == ' ') {
    unicorn.jump();
  }

}

void draw() {

  if (random(1) < 0.005) {

    playground.addMeteorite();
  }


  unicorn.show();
  unicorn.move();
  playground.showRocketParts();
  //playground.moveMeteorites();

    trains.add(new Train());
  }

  background(bImg);
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

}
