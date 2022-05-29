class EndScene {
  String gameOverText;
  int buttonX, buttonY, buttonW, buttonH;
  private String playerName;
private ArrayList<String> playerList = new ArrayList<String>();
  private ArrayList<Integer> playerScoreList = new ArrayList<Integer>();
PFont lbFont;

  EndScene() {
    this.gameOverText = "Game Over! The Leaderboard:";
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
  fill(127,0,255);
  rect(100, 100, 600, 400);

    //TEXT
    stroke(255);
    fill(255);
    textSize(30);
    text(this.gameOverText, 200, height/4);
  

  fill(0); //used for text afterwards.
  for (int i = 0; i < playerList.size(); i++) { //the leaderboard data
    lbFont = createFont("arial", 25);
    textFont(lbFont);
    
    text(playerList.get(i), 300 , i * 25 + 200);
    text(playerScoreList.get(i).toString(),  500 , i * 25 + 200);

  }
  }
  
  void setPlayerName(String playerName){
    this.playerName = playerName;
  }
  void processLists(ArrayList<String> getplayerList, ArrayList<Integer> getplayerScoreList){
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
