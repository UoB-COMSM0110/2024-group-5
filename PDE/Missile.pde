class Missile extends MoveObject{
  public Missile(){
    images = new PImage[3]; //pay attention to initialize
    String[] urls = {"missile1.png","missile2.png","missile3.png"};
    setImages(urls);
    speed = 15;
  }
  
  @Override
  public void move(){
    if(!isOutOfBound()&&isVisiable==true){
      curX+=speed;
    }else{
      curX = gameLevel1.helicopter.curX-1000;
      curY = gameLevel1.helicopter.curY;
      isVisiable = false;
    }
  }
  
  @Override
  public boolean isOutOfBound(){
    if(curX+75>width){
      return true;
    }
    return false;
  }
  
  public boolean isIntersectWithUfo(Ufo ufo){
    if(ufo.curX>=curX&&ufo.curX<=curX+50&&ufo.curY>=curY&&ufo.curY<=curY+50){
      return true;
    }
    if(ufo.curX+100>=curX&&ufo.curX+100<=curX+50&&ufo.curY>=curY&&ufo.curY<=curY+50){
      return true;
    }
    if(ufo.curX>=curX&&ufo.curX<=curX+50&&ufo.curY+50>=curY&&ufo.curY+50<=curY+50){
      return true;
    }
    if(ufo.curX+50>=curX&&ufo.curX+50<=curX+50&&ufo.curY+50>=curY&&ufo.curY+50<=curY+50){
      return true;
    }
    return false;
  }
  
}
