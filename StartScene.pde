public class StartScene {

  private PImage startPic;

  public StartScene() {
    this.startPic = loadImage("startPic.jpg");
  }

  void draw() {
    image(startPic, 0, 0);
  }
}
