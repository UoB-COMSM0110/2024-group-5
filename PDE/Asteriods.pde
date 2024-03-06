class Asteriods extends MoveObject{
  public int imageCount;
  public String[] imageUrls;
  public PImage[] images;
  public int asteriodCount;
  public int[][] topImagesPos;
  public int[][] botImagesPos;
  public int[][] topImageSize;
  public int[][] botImageSize;
  public int range;
  
  public Asteriods(int imageCount){
    imageUrls = new String[imageCount];
    images = new PImage[imageCount];
    for(int i=0;i<imageCount;i++){
      imageUrls[i] = "Asteroid-Base .png";
    }
    for(int i=0;i<imageCount;i++){
      images[i] = loadImage(imageUrls[i]);
    }
    setRange(300);
    setAsteriodCount(10);
    topImagesPos = new int[asteriodCount][2];
    botImagesPos = new int[asteriodCount][2]; 
    setTopImagesPos();
    setBotImagesPos();
    setImageSize();
    speed = 1;
  }
  
  
  public void setAsteriodCount(int asteriodCount){
    this.asteriodCount = asteriodCount;
  }
  
  public void setImageSize(){
    topImageSize = new int[asteriodCount][2];
    botImageSize = new int[asteriodCount][2];
    for(int i=0;i<asteriodCount;i++){
      topImageSize[i][0] = 100;
      topImageSize[i][1] = 100;
      botImageSize[i][0] = 100;
      botImageSize[i][1] = 100;
    }
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
