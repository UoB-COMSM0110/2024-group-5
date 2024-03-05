class Explode{
  PImage[] images;
  int curIndx = 0;
  int lastChangeTime = millis();
  boolean isVisible = true;
  boolean isEnd = false;
  PGraphics buffer = createGraphics(width, height);
  public Explode(){
     images = new PImage[9];
    for(int i=0;i<9;i++){
    images[i] = loadImage("explode"+(i+1)+".png");
    }
  }
  
  public void drawExplode(float frame,int posX,int posY){
     if(isVisible){
        buffer.beginDraw();        
        buffer.imageMode(CENTER);
        buffer.image(images[curIndx],posX,posY,150,150);
        buffer.endDraw();
        image(buffer,0,0);
        buffer.clear();
     }
     if(millis()-lastChangeTime-frame>=0){
       lastChangeTime = millis();
       curIndx = curIndx+1;
       if(curIndx+1==9){
         isVisible = false;
         isEnd = true;
       }
     }
  }
  
}
