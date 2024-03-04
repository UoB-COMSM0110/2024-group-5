
class Ufo extends MoveObject{
   private int speedY = 5;
   public Explode explode = new Explode();
   public boolean isDestoryed = false;
   public Ufo(){
     //old ui
     //PImage image = loadImage("ufo.png");
     images = new PImage[3];
     for(int i=0;i<images.length;i++){
       images[i] = loadImage("ufo"+(i+1)+".png");
     }
     curImageIndex = (int)random(images.length);
     speed = 15;
     setImage(images[curImageIndex]);
   }
   @Override
    public void move(){
      if((curX<0&&isOutOfBound())||isVisiable==false){
        curImageIndex = (int)random(images.length);
        setImage(images[curImageIndex]);
        curX = width+(int)(random(500)*random(2));
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
