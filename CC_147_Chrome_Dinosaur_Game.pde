import de.bezier.data.sql.*;
//things to check out: textAlign(CENTER);, rectMode(CENTER);
//import processing.sound.*;
int currentYear = -245; //in million years. timespan until -66 years.
//Non-bird dinosaurs lived between about 245 and 66 million years ago,
//in a time known as the Mesozoic Era. This was many millions of years
//before the first modern humans, Homo sapiens, appeared.

int gameStage = 0;

int timer = 0;

//SoundFile music;
StartScene startScene;
Background bg;
EndScene endScene;

Playground playground;
Meteorite met;
Rocket rocket1;
Controls con; //for mouse & keyboard control.
PlayerDB DB;

void settings() {
  size(800, 600);
}

void setup() {
  startScene=new StartScene();
  con = new Controls();

  //music =new SoundFile(this,"sound.mp3");
  // music.loop();
  playground = new Playground();
  con = new Controls();
  bg = new Background();
  noStroke();
  endScene = new EndScene();
  //add initial objects:
  playground.rocketSetup();
  playground.createInitialDinos();
  playground.addMeteorite(1);
  DB = new PlayerDB(this);
}

void draw() {
  switch(gameStage) {
  case 0:
    startScene.update();
    break;
  case 1: // Case 1 is the normal gameplay.
    bg.drawB();
    playground.showRocket();
    playground.showBullets();
    playground.showDinos();
    playground.showMeteorites();
    playground.checkCollision();
    playground.fallMeteorites();
    if ((millis() - timer) >= 5000) {
    timer = millis();
    playground.addMeteorite(1);
  }
    break;
  case 2:
    endScene.draw();
    break;
  case 3:
    //menuScreen.draw(); //We could do a Menu here.
  }

  
}

void mousePressed() {
  con.mouseP();
}

void keyPressed() {
  con.keyP();
}
