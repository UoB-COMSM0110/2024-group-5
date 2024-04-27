class Shield{
  PImage image = loadImage("shield.png");
  boolean isVisible = false;
  private int startTime;
  private int shieldLife = 15000;
  private boolean bonusShieldInUse = false;
  
  public void showShield(){
    isVisible = true;
  }
  
  public void closeShield(){
    isVisible = false;
    bonusShieldInUse = false;
  }
  
  public void startBonusShield(int start) {
  this.bonusShieldInUse = true;
  this.startTime = start;
  showShield();
}
  
  public int getStartTime() {return this.startTime;}
  
  public int getShieldLife() {return this.shieldLife;}
  
  public boolean isBonusShieldInUse() {return this.bonusShieldInUse;}
  
  public void setbonusShieldInUse(boolean inUse) {this.bonusShieldInUse = inUse;}
}
