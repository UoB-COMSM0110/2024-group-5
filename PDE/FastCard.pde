public class FastCard extends MoveObject{
  
    public FastCard(){
      image = loadImage("fastCard.png");
      speed = 5;
    }
    
    @Override
    public void move(){
      if(isOutOfBound()){
        isVisiable = true;
        curX = width+1500;
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
