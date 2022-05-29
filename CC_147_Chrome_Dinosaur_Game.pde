import de.bezier.data.sql.*;
import processing.sound.*;
import controlP5.*;
//things to check out: textAlign(CENTER);, rectMode(CENTER);
//import processing.sound.*;


//in million years. timespan where dinos lived is until -66 m years.
//Non-bird dinosaurs lived between about 245 and 66 million years ago,
//in a time known as the Mesozoic Era. This was many millions of years
//before the first modern humans, Homo sapiens, appeared.
int currentYear = -245;
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
PlayerDB pdb;
ControlP5 cp5;
SQLite sqldb;
PFont startFont;

//StartScene Vars:
private Textfield text1;
private Button startButton;
private Button addPlayerButton;
private color c1 = color(100, 100, 100);
private color textColor = color(255);
private boolean playerCreated = false;


void settings() {
  size(800, 600);
}

void setup() {
  //The Welcome Screen:
  startScene=new StartScene();
  this.showStartButtons();

  //later initialisations of objects:
  con = new Controls();
  playground = new Playground();
  con = new Controls();
  bg = new Background();
  //noStroke(); WHAT DOES THIS DO HERE?
  endScene = new EndScene();
  pdb = new PlayerDB();
  sqldb = new SQLite(this, "data/db.sqlite" );

  //add initial objects to lists, prepare gameplay:
  playground.rocketSetup();
  playground.createInitialDinos();
  playground.addMeteorite(1);

  //music =new SoundFile(this,"sound.mp3");
  // music.loop();
}

void draw() {
  switch(gameStage) { //DEPENDING ON THE GAMESTAGE, DRAW DIFFERENT SCENES.
  case 0:
    if (addPlayerButton.isPressed() && text1.getText() != null) {
      pdb.addPlayer(text1.getText());
      playerCreated = true;
    }
    if (startButton.isPressed() && playerCreated) {
      gameStage = 1;
      text1.setVisible(false);
      startButton.setVisible(false);
      addPlayerButton.setVisible(false);
    }
    break;
  case 1: // Case 1 is the normal gameplay.
    bg.drawB();
    playground.showRocket();
    playground.showBullets();
    playground.showDinos();
    playground.showMeteorites();
    playground.checkCollision();
    playground.fallMeteorites();
    playground.moveDinos();
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

void showStartButtons() {
  cp5 = new ControlP5(this);
  startFont = createFont("arial", 25);
  textFont(startFont);
  
  text1 = cp5.addTextfield("Choose a username")
    .setPosition(width/2 - 300, height/2 -50)
    .setSize(100, 30)
    .setFont(startFont)
    .setFocus(true)
    .setColorCaptionLabel(0)
    .setColorBackground(color(255))
    .setColorActive(color(0))
    .setColor(color(0))
    .setVisible(true);

  addPlayerButton = cp5.addButton("Add Player")
    .setPosition(width/2 - 300, height/2 + 20)
    .setSize(200, 40)
    .setFont(startFont)
    .setColorBackground(c1)
    .setColorForeground(color(255))
    .setVisible(true);

  startButton = cp5.addButton("play")
    .setPosition(width/2 - 300, height/2 +130)
    .setSize(100, 50)
    .setFont(startFont)
    .setColorBackground(c1)
    .setColorForeground(color(255))
    .setVisible(true);
}

void mousePressed() { //EXECUTE MOUSE OPERATIONS IN CONTROLS CLASS.
  con.mouseP();
}

void keyPressed() {
  con.keyP();
}
