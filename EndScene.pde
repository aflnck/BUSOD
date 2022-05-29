class EndScene {
  String gameOverText;
  int buttonX, buttonY, buttonW, buttonH;

  private ArrayList<String> playerList = new ArrayList<String>();
  private ArrayList<Integer> playerScoreList = new ArrayList<Integer>();

  EndScene() {
    this.gameOverText = "Game Over!";
    this.buttonW = 200;
    this.buttonH = 100;
    this.buttonX = width/2 - this.buttonW/2;
    this.buttonY = height/2 - this.buttonH/2;
  }

  void draw() {
    //OVERLAY
    //fill(#F73939);
    //rect(0, 0, width, height);
    //rect(buttonX, buttonY, buttonW, buttonH);

    //TEXT
    stroke(255);
    fill(255);
    textSize(60);
    text(this.gameOverText, width/3, height/4);
  
  for (int i = 0; b < playerList.size(); i++) {
    text(playerList
  }
  
  void processLists(ArrayList getplayerList, ArrayList getplayerScoreList){
    playerList = getplayerList;
    playerScoreList = getplayerScoreList;
  }

  boolean mouseOverButton() {
    return (mouseX > buttonX 
      && mouseX < buttonX + buttonW
      && mouseY > buttonY
      && mouseY < buttonY + buttonH);
  }
}
