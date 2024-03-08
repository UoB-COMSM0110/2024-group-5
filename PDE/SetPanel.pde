public class SetPanel{
  private final PImage setPanel = loadImage("setting.png");
  private final PImage diffPointer = loadImage("diffPointer.png");
  private final PImage volumePointer = loadImage("volumePointer.png");
  public int volumePointerX = 551;
  public int volumePointerY = 230;
  public int diffPointerX = 545;
  public int diffPointerY = 365;
  public void createPanel(){
    imageMode(CENTER);
    image(setPanel,width/2,height/2,700,700);
    imageMode(CORNER);
    image(volumePointer,volumePointerX,volumePointerY,40,40);
    image(diffPointer,diffPointerX,diffPointerY,50,50);
  }
}
