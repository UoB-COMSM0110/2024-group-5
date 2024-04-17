class Lazor extends Ability implements Serializable{
  public Lazor(){
    image = loadImage("lazor.png");
    speed = width;
  }
  
  @Override
  public void move(){
    curX+=speed;
  }
  
  public boolean intersectWithUfo(Ufo ufo){
      if (ufo.curX > 0 && ufo.curX < width && 
      ((ufo.curY >= curY && ufo.curY <= curY + 105) ||
      (ufo.curY + 100 >= curY && ufo.curY <= curY + 105))) {
      return true;
    }
    return false;
  }
  
}
