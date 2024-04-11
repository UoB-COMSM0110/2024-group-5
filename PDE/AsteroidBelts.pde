  class AsteroidBelts extends MoveObject{
    public int imageCount;
    public String[] imageUrls;
    public PImage[] images;
    public int asteriodCount;
    public int[][] topImagesPos;
    public int[][] botImagesPos;
    public int range;
    
    public AsteroidBelts(int imageCount){
      imageUrls = new String[imageCount];
      images = new PImage[imageCount];
      for(int i=0;i<imageCount;i++){
        imageUrls[i] = "asteriodMiddle.png";
      }
      for(int i=0;i<imageCount;i++){
        images[i] = loadImage(imageUrls[i]);
      }
      
      setAsteriodCount(40);
      topImagesPos = new int[asteriodCount][2];
      botImagesPos = new int[asteriodCount][2]; 
      createBelt();
      speed = 10;
    }
    
    
    public void setAsteriodCount(int asteriodCount){
      this.asteriodCount = asteriodCount;
    }
    
    
    public void setRange(int range){
      this.range = range;
    }
    
    //public void setTopImagesPos(){
    //  for(int i=0;i<asteriodCount;i++){
    //    topImagesPos[i][0] = (int)random(width);
    //    topImagesPos[i][1] = (int)random(range)-50;
    //  }  
    //}
    
    //public void setBotImagesPos(){
    //  for(int i=0;i<asteriodCount;i++){
    //    botImagesPos[i][0] = (int)random(width);
    //    botImagesPos[i][1] = height-range+(int)random(range)-50;
    //  }  
    //}
    
    public void createBelt() {
       for(int i=0;i<asteriodCount;i++){
        topImagesPos[i][0] = (int)random(width);
        topImagesPos[i][1] = (int)random(range)-50;
        
        botImagesPos[i][0] = (int)random(width);
        botImagesPos[i][1] = height-range+(int)random(range)-50;
      } 
    }
   
    
    //@Override
    //public void move(){
    //  for(int i=0;i<asteriodCount;i++){
    //    topImagesPos[i][0] -= speed; 
    //    botImagesPos[i][0] -= speed;
    //  } 
    //}
     
     public void moveAsteroid(int i ){
       topImagesPos[i][0] -= speed;
       botImagesPos[i][0] -= speed;
    }
    
    
    public boolean isOutOfBound(int x){
       return x < -50;
    }
  }
