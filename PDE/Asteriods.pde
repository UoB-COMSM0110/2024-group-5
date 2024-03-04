class Asteriods extends MoveObject{
  public int imageCount;
  public String[] imageUrls;
  public PImage[] images;
  public int asteriodCount;
  public int[][] topImagesPos;
  public int[][] botImagesPos;
  public int range;
  
  public Asteriods(int imageCount){
    imageUrls = new String[imageCount];
    images = new PImage[imageCount];
    for(int i=0;i<imageCount;i++){
      imageUrls[i] = "asteriodMiddle.png";
    }
    for(int i=0;i<imageCount;i++){
      images[i] = loadImage(imageUrls[i]);
    }
    setRange(200);
    setAsteriodCount(20);
    topImagesPos = new int[asteriodCount][2];
    botImagesPos = new int[asteriodCount][2]; 
    setTopImagesPos();
    setBotImagesPos();
    speed = 1;
  }
  
  
  public void setAsteriodCount(int asteriodCount){
    this.asteriodCount = asteriodCount;
  }
  
  
  public void setRange(int range){
    this.range = range;
  }
  
  public void setTopImagesPos(){
    for(int i=0;i<asteriodCount;i++){
      topImagesPos[i][0] = width+(int)random(width)-100;
      topImagesPos[i][1] = (int)random(range)-100;
    }  
  }
  
  public void setBotImagesPos(){
    for(int i=0;i<asteriodCount;i++){
      botImagesPos[i][0] = width+(int)random(width)-100;
      botImagesPos[i][1] = height-range+(int)random(range)-50;
    }  
  }
 
  
  @Override
  public void move(){
    for(int i=0;i<asteriodCount;i++){
      topImagesPos[i][0] -= speed; 
    } 
    
    for(int i=0;i<asteriodCount;i++){
      botImagesPos[i][0] -= speed;
    }  
  }
  
  
  public boolean isOutOfBound(int x){
     return x < -100;
  }
  
  
}
