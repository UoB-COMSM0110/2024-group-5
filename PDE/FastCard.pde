public class FastCard extends MoveObject{
    public int asteroidRange;
    public FastCard(){
      image = loadImage("unknownBox.png");
      speed = 5;
      asteroidRange = 100;
    }
    
    @Override
    public void move(){
      if(isOutOfBound()||!isVisiable){
        isVisiable = true;
        curX = width+(int)random(1000);
        curY = (int)random(this.asteroidRange, height-this.asteroidRange-100);
      }
      curX-=speed;
    }
    
    @Override
    public boolean isOutOfBound(){
      if(curX<0){
        return true;
      }
      return false;
    }
   
}
