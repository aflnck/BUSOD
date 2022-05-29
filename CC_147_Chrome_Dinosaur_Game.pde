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
private int timeDifficoulty = 6000;
private int timeDifficoultyLvl2 = 3000;

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
int run_id;
PFont startFont;


//StartScene Vars:
private Textfield textBox;
private Button startButton;
private Button addPlayerButton;
private color c1 = color(250, 218, 94);
private color textColor = color(0);
private String playerName;

private boolean playerCreated = false;

//startScene Vars:
private boolean dbActionEndScene;

//LevelUp Stuff:
private Button levelUpButton;

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
  noStroke();
  endScene = new EndScene();
  pdb = new PlayerDB();
  sqldb = new SQLite(this, "data/db.sqlite");

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
    if (addPlayerButton.isPressed() && textBox.getText() != null && !playerCreated) {
        playerName = textBox.getText();
      playerCreated = true;
    }
    if (startButton.isPressed() && playerCreated) {
      gameStage = 1;
      textBox.setVisible(false);
      startButton.setVisible(false);
      addPlayerButton.setVisible(false);
      levelUpButton.setVisible(false);
    } else if (levelUpButton.isPressed() && playerCreated){
          gameStage = 2;
      textBox.setVisible(false);
      startButton.setVisible(false);
      addPlayerButton.setVisible(false);
      levelUpButton.setVisible(false);
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
    if ((millis() - timer) >= timeDifficoulty) { //it was ((millis() - timer) >= 5000) before!
      timer = millis();
      playground.addMeteorite(1);
      timeDifficoulty = timeDifficoulty - 56;
      print(timeDifficoulty);
    }
    break;
      case 2:
    bg.drawB();
    playground.showRocket();
    playground.showBullets();
    playground.showDinos();
    playground.showMeteorites();
    playground.checkCollision();
    playground.fallMeteorites();
    playground.moveDinos();
    if ((millis() - timer) >= timeDifficoultyLvl2) { //it was ((millis() - timer) >= 5000) before!
      timer = millis();
      playground.addMeteorite(1);
      timeDifficoultyLvl2 = timeDifficoultyLvl2 - 56;
      print(timeDifficoultyLvl2);
    }
    break;
  case 3:
  
    endScene.setPlayerName(playerName);
    
    //print(this.run_id);
    
    if (!dbActionEndScene) {
      this.run_id = pdb.addPlayer(playerName, playground.getPlayerScore());
      pdb.fillListsLeaderBoardStats();
      endScene.processLists(pdb.getplayerList(), pdb.getplayerScoreList());
      dbActionEndScene = true;
    }

    endScene.draw();
    break;
  }
}

void showStartButtons() {
  cp5 = new ControlP5(this);
  startFont = createFont("arial", 25);
  textFont(startFont);

  textBox = cp5.addTextfield("Choose a username")
    .setPosition(width/2 - 300, height/2 -50)
    .setSize(100, 30)
    .setFont(startFont)
    .setFocus(true)
    .setColorCaptionLabel(0)
    .setColorBackground(color(255))
    .setColorActive(color(255))
    .setColor(color(0))
    .setVisible(true);

  addPlayerButton = cp5.addButton("Add Player")
    .setPosition(width/2 - 300, height/2 + 20)
    .setSize(200, 40)
    .setFont(startFont)
    .setColorBackground(c1)
    .setColorForeground(color(100))
    .setColorActive(color(128))
    .setVisible(true);

  startButton = cp5.addButton("Start Lvl 1")
    .setPosition(width/2 - 300, height/2 +130)
    .setSize(200, 40)
    .setFont(startFont)
    .setColorBackground(c1)
    .setColorForeground(color(100))
    .setColorActive(color(128))
    .setVisible(true);
    
  levelUpButton = cp5.addButton("Start Lvl 2")
    .setPosition(width/2 + 100, height/2 + 130)
    .setSize(200, 40)
    .setFont(startFont)
    .setColorBackground(c1)
    .setColorForeground(color(100))
    .setColorActive(color(128))
    .setVisible(true);
}


void showLevelUpButton() {

}
void mousePressed() { //EXECUTE MOUSE OPERATIONS IN CONTROLS CLASS.
  con.mouseP();
}

void keyPressed() {
  con.keyP();
}
