//var decl.
int currentYear;

Playground playground;

Meteorite met;
PImage MetImg;
  
Falcon1 rocket1;
PImage Fal1Img;

//copied code
Unicorn unicorn;
PImage uImg;
PImage tImg;
PImage bImg;
ArrayList<Train> trains = new ArrayList<Train>();

//ArrayList<L1Dino> dinos = new ArrayList<L1Dino>();
PImage L1DinoImg;
Parts partCollection;

void mousePressed() {
  //trains.add(new Train());
}

void setup() {
  size(800, 450);
  playground = new Playground();
  //pic initialisation 
  uImg = loadImage("unicorn.png");
  tImg = loadImage("train.png");
  bImg = loadImage("background.jpg");
  Fal1Img = loadImage("Fal1.jpg");
  L1DinoImg = loadImage("L1Dino.jpg");
  
  for (int i = 0; i < 10; i++){
    
  }
  
  unicorn = new Unicorn();
  partCollection.partSetup(6,0);
}


void keyPressed() {
  if (key == 'w') {
    Things.move();
  }
  else if(key == 's'){
  
  
  }
}

void draw() {

  if (random(1) < 0.005) {
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
