public class GoldCoin extends MoveObject{
  private int asteroidRange;
  public GoldCoin(int asteroids){
    asteroidRange = asteroids;
    PImage image = loadImage("mineral.png");
    this.setImage(image);
    speed = 10;
  }
  
  @Override
  public void move(){
    if(isOutOfBound()){
      isVisiable = true;
      curX = width+(int)random(500);
      curY = (int)random(asteroidRange + 60, height - asteroidRange - 150);
    }
    curX-=speed;
  }
  
  @Override
  public boolean isOutOfBound(){
    if(curX<0){
      return true;
    }
    return false;
  };
}
