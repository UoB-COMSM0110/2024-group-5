class Shield{
  PImage image = loadImage("shield.png");
  boolean isVisible = false;
  private int startTime;
  private int shieldLife = 15000;
  
  public void showShield(){
    isVisible = true;
  }
  
  public void closeShield(){
    isVisible = false;
  }
  
  public void startBonusShield(int start) {
  this.startTime = start;
  showShield();
}
  
  public int getStartTime() {return this.startTime;}
  
  public int getShieldLife() {return this.shieldLife;}
}
