abstract class FixedObject implements Serializable{
  public PImage image;
  public int curX;
  public int curY;
  public boolean isVisiable = false;

    
  public JSONObject toJSONObject(){
    JSONObject obj = new JSONObject();
    obj.setInt("curX",curX);
    obj.setInt("curY",curY);
    obj.setBoolean("isVisiable",isVisiable);
    return obj;
  }
  
  public PImage getImage() {
    return image;
  }

  public void setImage(PImage image) {
    this.image = image;
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

  public boolean isVisiable() {
    return isVisiable;
  }

  public void setVisiable(boolean visiable) {
    isVisiable = visiable;
  }


}
