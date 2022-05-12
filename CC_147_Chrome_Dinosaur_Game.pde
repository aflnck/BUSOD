
//things to check out: textAlign(CENTER);, rectMode(CENTER);

int currentYear = -245; //in million years. timespan until -66 years.
  //Non-bird dinosaurs lived between about 245 and 66 million years ago,  
  //in a time known as the Mesozoic Era. This was many millions of years
  //before the first modern humans, Homo sapiens, appeared.

int gameStage = 0;

Playground playground;
Meteorite met;
Rocket rocket1;
Controls con;
OperationCenter oc1;


void settings() {
  size(800, 600);
}

void setup() {
  playground = new Playground();
  con = new Controls();
  oc1 = new OperationCenter();
  noStroke();
  

  //add initial objects:
  playground.rocketPartSetup(1);
  playground.createInitialDinos();
  oc1.createRockets(5);
  playground.addMeteorite(5);
}

void draw() {
  //do a new background, depending on how far the game is.

    playground.drawB();
    oc1.showOC();

  //add meteorites sometimes, at random, during the game.
  if (random(1) < 0.001) {
    playground.addMeteorite(1);
  }

  playground.showRocketParts();
  playground.showDinos();
  oc1.showRockets();
  playground.showMeteorites();
  playground.fallMeteorites();
  playground.highlightSelectedObj();
}

//redirected functions for interaction -> class Controls.
void mousePressed() {
  con.mouseP();
}

  //move the selected obj. into the desired direction.
void keyPressed() {
  //if (key == CODED) {
    con.keyP();
  //}
}
