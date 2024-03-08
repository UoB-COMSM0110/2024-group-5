import java.io.*;
abstract class MoveObject implements Serializable{
  public PImage image; 
  public PImage[] images;
  public int curX;
  public int curY;
  public int prevX;
  public int prevY;
  public int speed;
  public boolean isVisiable = false;
  
  
  public JSONObject toJSONObject(){
    JSONObject obj = new JSONObject();
    obj.setInt("curX",curX);
    obj.setInt("curY",curY);
    obj.setInt("prevX",prevX);
    obj.setInt("prevY",prevY);
    obj.setInt("speed",speed);
    obj.setBoolean("isVisiable",isVisiable);
    return obj;
  }
    
  public void move(){
    prevX = curX;
    curX+=speed;
  };

  public void drawAnimation(int x,int y,int imageWidth,int imageHeight,int delayTime){
    //int now = millis();
    for(int i=0;i<images.length;){
      image(images[i],x,y,imageWidth,imageHeight);
      //while(millis()-now<50){
      //}
      i++;
    }
  }
  
  public PImage getImage() {
    return image;
  }

  public void setImage(PImage image) {
    this.image = image;
  }
  
  public PImage[] getImages() {
    return images;
  }

  public void setImages(String[] urls) {
      for(int i=0;i<urls.length;i++){
        images[i]=loadImage(urls[i]);
      }
  }
  
  public int getCurX() {
    return curX;
  }

  public void setCurX(int curX) {
    this.curX = curX;
  }

  public int getCurY() {
    return curY;
  }

  public void setCurY(int curY) {
    this.curY = curY;
  }

  public int getPrevX() {
    return prevX;
  }

  public void setPrevX(int prevX) {
    this.prevX = prevX;
  }

  public int getPrevY() {
    return prevY;
  }

  public void setPrevY(int prevY) {
    this.prevY = prevY;
  }

  public int getSpeed() {
    return speed;
  }

  public void setSpeed(int speed) {
    this.speed = speed;
  }

  public boolean isVisiable() {
    return isVisiable;
  }

  public void setVisiable(boolean visiable) {
    isVisiable = visiable;
  }

  public boolean isOutOfBound(){
    return false;
  };
  

}
