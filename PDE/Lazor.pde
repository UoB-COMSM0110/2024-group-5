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
    if(ufo.curX+50>=curX+40&&ufo.curX<=curX+1540&&ufo.curY>=curY-45&&ufo.curY<=curY+105){
      return true;
    }
    return false;
  }
  
}
