class Rogue{
  int[] options = new int[3];
  int maxCount = 4;
  String intro = "Make Your Decision!";
  PImage lifePlus = loadImage("health_plus.png"); //0
  PImage timeSlow = loadImage("time_slower.png"); //1
  PImage doubleScore = loadImage("double_score.png"); //2
  PImage unlimitedPower = loadImage("power_unlimited.png"); //3
  
  public Rogue(){
    initOption();
  }
  
  private void initOption(){
    HashSet<Integer>set = new HashSet<>();
    while(set.size()!=3){
      int num = (int)random(maxCount);
      set.add(num);
    }
    int i=0;
    for(int c:set){
      options[i++] = c;
    }
  }
  
  public PImage getImageByNum(int i){
    switch(i){
      case 0: return lifePlus;
      case 1: return timeSlow;
      case 2: return doubleScore;
      case 3: return unlimitedPower;
      default: return lifePlus;
    }
  }
  
  public void draw(){
    for(int i=0;i<3;i++){
      PImage image = getImageByNum(options[i]);
      textAlign(CENTER);
      textSize(50);
      text(intro,width/2,150);
      imageMode(CENTER);
      image(image,width/2-200-50+i*250,330,200,300);
    }
  }
  
  public void trigger(int i){
     switch(i){
      case 0: if(gameLevel1.helicopter.health<=2) gameLevel1.helicopter.health++;
              break;
      case 1: gameLevel1.slowTime();
              break;
      case 2: gameLevel1.scorePanel.score*=2;
              break;
      case 3: gameLevel1.shield.showShield(30000);
      default: gameLevel1.scorePanel.score*=2;
    }
  
  }
}
