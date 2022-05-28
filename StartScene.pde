class StartScene {

  private PImage startPic;
  private Button startButton;
  private boolean gameStart;

  StartScene() {
    this.startPic = loadImage("startPic.png");
    startButton = new Button(width/2 - 50, height/2 -25, 100, 50, "Start");
        image(startPic, 0, 0);
    startButton.display();
  }

  void update() {
    gameStart = startButton.clicked(mouseX, mouseY);
  }
  
  boolean checkStartButton(){
    return gameStart;
  }
  
}
