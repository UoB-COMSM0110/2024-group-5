public class Story{
  private final PImage storyPanel = loadImage("StoryImage.png");
  private final PImage toturialPanel = loadImage("TutorialImage.png");
  public void createPanel(){
    imageMode(CENTER);
    if(gameStatus.curLevel==Level.LEVEL_STORY){
      image(storyPanel,width/2,height/2,width,height);
    }else{
      image(toturialPanel,width/2,height/2,width,height);
    }
  }
}
