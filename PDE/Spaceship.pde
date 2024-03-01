class Spaceship extends MoveObject{
  
  int time = millis();
  public Spaceship(){
    image = loadImage("spaceship1.png");
    speed = 8;
    curX = -50;
    curY = height/2;
  }
  
  
  void update() {
    curX += speed;
    if(!isAnimationEnd){
      time = millis();
    }
    if (curX > width + 50 || isAnimationEnd) { 
      isAnimationEnd = true;
      curX = -100;
      speed = 0;
      if(isAnimationEnd && millis()-time>=3000){
        gameStatus.curLevel = Level.LEVEL_BEGIN;
      }
    }
  }
  
  void display() {
    fill(255);
    image(image, curX - 20, curY + 40, 100, 100);
  }
  
}
