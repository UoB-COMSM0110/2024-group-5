class Shield{
  PImage image = loadImage("shield.png");
  boolean isVisible = false;
  public void showShield(){
    isVisible = true;
  }
  
  public void closeShield(){
    isVisible = false;
  }
}
