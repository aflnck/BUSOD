import controlP5.*;
class StartScene {

  private PImage startPic;
  private Button startButton;
  private boolean gameStart;
  private PFont font;
  private Textfield textBox;
  private Button start;
  private Button addPlayer;
  private color c1 = color(100,100,100);
  private color textColor = color(255);
  private boolean wasAPlayerAdded = false;
  private int newPlayerID;
  private String newPlayerName;
  
  
  
  StartScene() {

    this.startPic = loadImage("startPic.png");

        image(startPic, 0, 0);

 

  // new player button, has to hide when clicked.
  

     
     
     
  }

//COMMUNICATION BETWEEN MAIN FUNCTION AND THIS; FOR DB_INPUTS. //isnt needed anymore?

  
}
