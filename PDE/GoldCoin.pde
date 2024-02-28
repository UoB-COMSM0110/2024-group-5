public class GoldCoin extends MoveObject{
  public GoldCoin(){
    PImage image = loadImage("goldCoin.png");
    this.setImage(image);
    speed = 10;
  }
  
  @Override
  public void move(){
    if(isOutOfBound()){
      isVisiable = true;
      curX = width;
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
