
//things to check out: textAlign(CENTER);, rectMode(CENTER);
//import processing.sound.*;
int currentYear = -245; //in million years. timespan until -66 years.
  //Non-bird dinosaurs lived between about 245 and 66 million years ago,  
  //in a time known as the Mesozoic Era. This was many millions of years
  //before the first modern humans, Homo sapiens, appeared.

int gameStage = 0;

int timer = 0;

//SoundFile music;
StartScene startscene;
Playground playground;
Meteorite met;
Rocket rocket1;
Controls con;
Background bg;

void settings() {
  size(800, 600);
}

void setup() {
  startscene=new StartScene();
  con = new Controls();
  
  //music =new SoundFile(this,"sound.mp3");
 // music.loop();
  playground = new Playground();
  con = new Controls();
  bg = new Background();
  noStroke();
  
  //add initial objects:
  playground.rocketSetup();
  playground.createInitialDinos();
  playground.addMeteorite(1);
}

void draw() {
   // if end scene exist, show endscene
   if (playground.end != null) {
     playground.end.drawEndScene();
     return;
   }
   
  bg.drawB();
  
  if ((millis() - timer) >= 5000)  {
    timer = millis();
    playground.addMeteorite(1);
  }

  playground.showRocket();
  playground.showBullets();
  playground.showDinos();
  playground.showMeteorites();
  playground.checkCollision();
  playground.fallMeteorites();

}

void mousePressed() {
  con.mouseP();
}

void keyPressed() {
    con.keyP();
}
