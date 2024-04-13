
class Ufo extends MoveObject{
   private int speedY = 5;
   public Explode explode = new Explode();
   public boolean isDestoryed = false;
   private int asteroidRange;
   public Ufo(int asteroidBeltRange){
     //old ui
     //PImage image = loadImage("ufo.png");
     asteroidRange = asteroidBeltRange;
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
        //curY = (int)random(height-100);
        curY = getYAxisWithinAsteroidBelts();
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
    if(curX <= 0 ||curY <= asteroidRange + 50 ||curY+100 >= height - asteroidRange - 50){
      return true;
    }
    return false;
  }
  
  public int getYAxisWithinAsteroidBelts() {
    return (int)random(asteroidRange+200,height-200 - asteroidRange);
  }
  
  
}
