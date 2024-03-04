class Helicopter extends MoveObject implements Serializable{
  public int health;
  public ArrayList<Bullet>bullets;
  public int curBulletCount = 1000; //to do
  public int invincibleTimeWhenLoseHp = 3000; //3s
  public int hitBeginTime = 0;
  public Helicopter(){

  }
  
  public Helicopter(String imagePath,int curX,int curY,int health,int speed){
    this.curX = curX;
    this.curY = curY;
    this.health = health;
    this.speed = speed;
    this.bullets = new ArrayList<Bullet>(); 
    images = new PImage[2];
    String[] urls = {"spaceship.png","spaceship1.png"};
    setImages(urls);
    image = loadImage(imagePath);
  }
  
  public void initBullets(int count){
    for(int i=0;i<count;i++){
      Bullet bullet = new Bullet();
      bullet.curX = curX;
      bullet.curY = curY;
      bullets.add(bullet);
    }
  }
  
  public void shoot(){
    if(bullets!=null&&bullets.size()>0){
      curBulletCount--;
    }
  }

  public void move(boolean isClicked){
    if(isClicked) {
      curY -= speed;
    }else{
      curY += speed;
    }
  }
  
  public void move(){
    curX += speed;
    if (curX > width + 50) { 
      curX = -100;
      speed = 0;
    }
  }
  
  public void display(){
    imageMode(CORNER);
    image(images[1], curX -20, curY + 40, 100, 100);
  }

  @Override
  public boolean isOutOfBound(){
    if(curY<0||curY+100>height){
      return true;
    }
    return false;
  }

  public int getHealth() {
    return health;
  }

  public void setHealth(int health) {
    this.health = health;
  }


  public void lostHealth(){
    health--;
  }
  
  public boolean intersectWithCoin(GoldCoin coin){
    if(coin.curX+50>=curX&&coin.curX+50<=curX+100&&coin.curY+50>=curY&&coin.curY+50<=curY+100){
      return true;
    }
    return false;
  }
  
  public boolean intersectWithUfo(Ufo ufo){
    if(ufo.curX+50>=curX&&ufo.curX+50<=curX+100&&ufo.curY+50>=curY&&ufo.curY+50<=curY+100){
      return true;
    }
    return false;
  }
  
  public boolean intersectWithAsteriods(Asteriods asteriods){
    for(int i=0;i<asteriods.asteriodCount;i++){
       if(asteriods.topImagesPos[i][0]+50>=curX&&asteriods.topImagesPos[i][0]+50<=curX+100&&asteriods.topImagesPos[i][1]+50>=curY&&asteriods.topImagesPos[i][1]+50<=curY+100){
          return true;
        }
    }
     for(int i=0;i<asteriods.asteriodCount;i++){
       if(asteriods.botImagesPos[i][0]+50>=curX&&asteriods.botImagesPos[i][0]+50<=curX+100&&asteriods.botImagesPos[i][1]+50>=curY&&asteriods.botImagesPos[i][1]+50<=curY+100){
          return true;
       }
    }
    return false;
  }
  
  public boolean intersectWithFastCard(FastCard card){
    if(card.curX+50>=curX&&card.curX+50<=curX+100&&card.curY+50>=curY&&card.curY+50<=curY+100){
      return true;
    }
    return false;
  }
}
