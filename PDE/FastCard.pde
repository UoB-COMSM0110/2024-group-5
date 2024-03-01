public class FastCard extends MoveObject{
  
    public FastCard(){
      image = loadImage("unknownBox.png");
      speed = 5;
    }
    
    @Override
    public void move(){
      if(isOutOfBound()||!isVisiable){
        isVisiable = true;
        curX = width+(int)random(1000);
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
