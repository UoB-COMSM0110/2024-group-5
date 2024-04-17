  class AsteroidBelts extends MoveObject{
    public int imageCount;
    public String[] imageUrls;
    public PImage[] images;
    public int asteroidCount;
    public int[][] topImagesPos;
    public int[][] botImagesPos;
    private int range;
    public final int imgWidth;
    public final int imgHeight;
    
    
    public AsteroidBelts(int imageCount, int range){
      imageUrls = new String[imageCount];
      images = new PImage[imageCount];
      for(int i=0;i<imageCount;i++){
        imageUrls[i] = "asteriodMiddle.png";
      }
      for(int i=0;i<imageCount;i++){
        images[i] = loadImage(imageUrls[i]);
      }
      imgWidth = 50;
      imgHeight = 50;
      setRange(50);
      setAsteroidCount(40);
      topImagesPos = new int[asteroidCount][2];
      botImagesPos = new int[asteroidCount][2]; 
      createBelts();
      speed = 10;
    }
    
    
    public void setAsteroidCount(int asteroidCount){
      this.asteroidCount = asteroidCount;
    }
    
    
    public void setRange(int range){
      this.range = range;
    }
    
    public void createBelts() {
       for(int i = 0; i < asteroidCount; i++){
        topImagesPos[i][0] = (int)random(width);
        topImagesPos[i][1] = (int)random(range);
        botImagesPos[i][0] = (int)random(width);
        botImagesPos[i][1] = (height - (int)random(range)) - 50;
      } 
    }
     
     public void moveAsteroid(int i ){
       topImagesPos[i][0] -= speed;
       botImagesPos[i][0] -= speed;
    }
    
    
    public boolean isOutOfBound(int x){
       return x < -50;
    }
    
    public int getRange() {
      return this.range;
    }
  }
