class Map extends MoveObject{
  public Map(String imagePath,int curX,int curY,int speed){
    this.curX = curX;
    this.curY = curY;
    this.speed = speed;
    image = loadImage(imagePath);
  }
  @Override
  public void move(){
    if(curX+width<=0){
      curX = 2*width;
    }
    curX -= speed;
  }

}
