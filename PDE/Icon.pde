class Icon extends FixedObject{
  public int iconCount = 3;
  public Icon(){
    initIcons();
  }
  
  public void initIcons(){
    images = new PImage[iconCount];
    images[0] = loadImage("shield-icon.png");
    images[1] = loadImage("missile-icon.png");
    images[2] = loadImage("bullet-icon.png");
  }

}
