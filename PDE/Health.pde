class Health extends FixedObject{
  public int healthCount = 3;
  public Health(){
    initHealth();
  }
  
  public void initHealth(){
    images = new PImage[healthCount];
    for(int i=0;i<healthCount;i++){
      images[i] = loadImage("health"+"-"+(i+1)+".png");
    }
  }

}
