
class Ufo extends MoveObject{
   private int speedY = 5;
   public Ufo(){
     PImage image = loadImage("ufo.png");
     speed = 15;
     setImage(image);
   }
   @Override
    public void move(){
      if((curX<0&&isOutOfBound())||isVisiable==false){
        curX = width+(int)(500*Math.random());
      }else if(isOutOfBound()){
        speedY = -speedY;
        curX -= speed;
        curY += speedY;
      }else{
        curX -= speed;
        curY += speedY;
      }
    }

  @Override
  public boolean isOutOfBound(){
    if(curX<0||curY<0||curY+100>height){
      return true;
    }
    return false;
  }
}
