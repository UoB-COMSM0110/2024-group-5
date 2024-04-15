class Missile extends MoveObject{
  PImage[] images;
  int curIndx = 0;
  int lastChangeTime = millis();
  boolean isVisible = true;
  boolean isEnd = false;
  int accelerate = 2;
  PGraphics buffer = createGraphics(width, height);
  public Missile(){
     images = new PImage[3];
    for(int i=0;i<3;i++){
    images[i] = loadImage("missile"+(i+1)+".png");
    }
    speed = 1;
  }
  
  public void drawMissile(int frame,int posX,int posY){
     if(isVisible){
        buffer.beginDraw();        
        buffer.imageMode(CENTER);
        buffer.image(images[curIndx],posX,posY,150,150);
        buffer.endDraw();
        image(buffer,0,0);
        buffer.clear();
     }
     if(millis()-lastChangeTime>=frame){
       if(isEnd){
         curIndx = 2;
         return;
       }
       lastChangeTime = millis();
       curIndx = curIndx+1;
       if(curIndx+1==3){
         isEnd = true;
       }
     }
  }

  
  @Override
  public void move(){
    if(!isOutOfBound()&&isVisiable==true){
      speed = speed + accelerate;
      curX += speed;
    }else{
      //curX = gameLevel1.helicopter.curX-1000;
      //curY = gameLevel1.helicopter.curY;
      gameLevel1.missileCount--;
      isVisiable = false;
      speed = 1;
      curIndx = 0;
      isEnd = false;
      lastChangeTime = millis();
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
    if(ufo.curX>=curX&&ufo.curX<=curX+75&&ufo.curY>=curY&&ufo.curY<=curY+75){
      return true;
    }
    if(ufo.curX+100>=curX&&ufo.curX+100<=curX+75&&ufo.curY>=curY&&ufo.curY<=curY+75){
      return true;
    }
    if(ufo.curX>=curX&&ufo.curX<=curX+75&&ufo.curY+50>=curY&&ufo.curY+50<=curY+75){
      return true;
    }
    if(ufo.curX+50>=curX&&ufo.curX+50<=curX+75&&ufo.curY+50>=curY&&ufo.curY+50<=curY+75){
      return true;
    }
    return false;
  }
  
}
