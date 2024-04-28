import java.util.*;
class GameLevel1 {
 
  //////////////////////////////////////////////////////////
    public boolean gameStarted = false;
   ////////////////////////////////////////////////////
      public boolean showStartImage = true;
    public final Helicopter helicopter = new Helicopter("helicopter.png",0,width/4,3,15);
    public Map[] newMaps = new Map[3];
    public int randomMap = (int)random(5);
    public final GoldCoin[] coins = new GoldCoin[10];
    public final Shield shield = new Shield();
    public final Ufo[] ufos = new Ufo[4];
    public Lazor lazor = new Lazor();
    public final Asteriods asteriods = new Asteriods(1);
    public AsteroidBelts asteroidBelts = new AsteroidBelts(1, 50);
    public int score = 0;
    
    public LightDecrease lightDecrease = new LightDecrease();
    public boolean isSet = false;
    public int isLightDecrease = 1;
    public boolean isTimeUpdate = false;
    public int time = 0;
    public boolean isTrigger = false;
    
    private ScorePanel scorePanel = new ScorePanel();
    private AbilityBox[] boxs = new AbilityBox[3];
    private Icon icon = new Icon();
    private Health health = new Health();
    //private PImage box = loadImage("abilityBox1.png");
    private boolean isGameEnd = false;
    private final FastCard[] cards = new FastCard[1];
    
    public int gameTime = millis();
    public int gameTime2 = millis();
    public boolean isSetSpeedPlus = false;
    
    
    //////////////////////ADDED//////////////////////
public void drawInitialScene() {
    imageMode(CORNER);
    for (Map map : newMaps) {  // Assuming newMaps is an array of Map objects.
        image(map.image, map.curX, map.curY, width, height);
    }
    drawSpaceship();  // Correct function name for drawing the helicopter or spaceship
    drawGamePanel();   // Draw game panel if needed
}
/////////////////////////////////////////////////////////

    public HashSet<Integer> keysInUse = new HashSet<Integer>();
    
    
    public GameLevel1(){
       initCoins();
       initBoxs();
       initUfos();
       initFastCards();
       initNewMaps();
    }
    

    
    public void startLevel1(){
 if (!gameStarted) {
        drawInitialScene(); // Draw the initial scene that might be static or an intro view.

        // Check if the start image should be shown
        if (showStartImage) {
            imageMode(CENTER);
            PImage startImg = loadImage("pressstart.png"); // Ensure this image is stored in the sketch's "data" folder
            image(startImg, width / 2, height / 2);
        }
        return; // Stop further execution to wait for the game to start
    }


        if(!isGameEnd()&&!isGameEnd){
          imageMode(CORNER);
          drawNewMaps();
          drawCoins();       
          
           // Update score only when the game has actually started
        scorePanel.updateScore();  // This ensures score updates after game start
        
          //change difficulty with time passing
          if(millis()-gameTime>=30000){
            increaseDifficulty();
            gameTime = millis();
          }
                   
          updateSpaceshipHitTime();
          drawUfos();
          drawLazor();
          drawFastCards();
          drawSpaceship();
          drawAsteroidBelts();
          drawGamePanel();
          drawShield();
          drawHealth();
          helicopter.move(keysInUse.contains(32));
        }else{
          gameStatus.curLevel = Level.LEVEL_END;
          score = scorePanel.score+scorePanel.goldCount*10;
          println("You lose!Your Score is "+score);
          writeScoreToTxt();
        }
    }
    public void initByDifficulty(){
      switch(gameStatus.curDifficulty){
        case EASY:
        setEasy();
        break;
        case NORMAL:
        setNormal();
        break;
        case HARD:
        setHard();
        break;
        default:
      }
    }
    
    private void setEasy(){
      helicopter.health = 3;
      helicopter.speed = 15;
      for(int i=0;i<ufos.length;i++){
        ufos[i].speed = 15;
      }
      helicopter.sizeX = 100;
      helicopter.sizeY = 100;
    }
    
    private void setNormal(){
      helicopter.health = 2;
      helicopter.speed = 18;
      for(int i=0;i<ufos.length;i++){
        ufos[i].speed = 17;
      }
      helicopter.sizeX = 110;
      helicopter.sizeY = 110;
    }
    
    private void setHard(){
      helicopter.health = 1;
      helicopter.speed = 21;
      for(int i=0;i<ufos.length;i++){
        ufos[i].speed = 20;
      }
      helicopter.sizeX = 120;
      helicopter.sizeY = 120;
    }
    
    public void slowTime(){
     for(int i=0;i<ufos.length;i++){
        ufos[i].speed -= 7;
      }
    }
    
    private void initBoxs(){
      int path = 20;
      for(int i=0;i<boxs.length;i++){
        boxs[i] = new AbilityBox();
        boxs[i].curY = 0;
        boxs[i].curX = 210+path+i*75;
      }
    }
    
    private void initNewMaps(){
      int random = (int)random(33)+1;
      for(int i=0;i<newMaps.length;i++){
        newMaps[i] = new Map("data/gameMap/map-"+random+".png",i*width,0,5);
      }
    }
    
    private void drawNewMaps(){
      for(Map map:newMaps){
        imageMode(CORNER);
        image(map.image,map.curX,map.curY,width,height);
        map.move();
      }
    }
    
    private void initFastCards(){
      for(int i=0;i<cards.length;i++){
        cards[i] = new FastCard();
        cards[i].isVisiable = true;
        //int posY = (int)((height-100)*Math.random());
        int posY = (int) random(asteroidBelts.getRange(), height - asteroidBelts.getRange()-100);
        int posX =  width-100+(i+1)*1500;
        cards[i].curY = posY;
        cards[i].curX = posX;
      }
    }
    
    private void initCoins(){
      for(int i=0;i<coins.length;i++){
        coins[i] = new GoldCoin(asteroidBelts.getRange());
        coins[i].isVisiable = true;
        int posY = (int)random(asteroidBelts.getRange() + 50, height - asteroidBelts.getRange()-50);
        int posX =  width-100+i*(int)random(300);
        coins[i].curX = posX;
        coins[i].curY = posY;
      }
    }
    
    private void initUfos(){
      for(int i=0;i<ufos.length;i++){
        ufos[i] = new Ufo(asteroidBelts.getRange());
        ufos[i].isVisiable = true;
        int posY = ufos[i].getYAxisWithinAsteroidBelts();
        int posX =  width+(int)random(2000)+(int)(i*random(100));
        ufos[i].curX = posX;
        ufos[i].curY = posY;
      }
    }

    
    public boolean isGameEnd(){
      if(helicopter.isOutOfBound()||helicopter.health==0){
        return true;
      }
      return false;
    }
    
    public void drawGamePanel(){
      if (gameStarted) {
       fill(255);
       textSize(30);
       textAlign(LEFT);
       text("Score:",0,50);
       text(scorePanel.score,160,50);
       text("Mineral:",0,100);
       text(scorePanel.goldCount,210,100);
       text("Kill:",0,150);
       text(scorePanel.killCount,120,150);
       scorePanel.updateScore();
      }
    }
    
public void drawSpaceship() {
    if(helicopter.hitBeginTime!=0){
        image(helicopter.images[2], helicopter.curX, helicopter.curY, helicopter.sizeX, helicopter.sizeY);
        tint(150,100);
    }
    if (keysInUse.contains(32)){
        image(helicopter.images[1], helicopter.curX, helicopter.curY, helicopter.sizeX, helicopter.sizeY);
    } else {
        image(helicopter.images[0], helicopter.curX, helicopter.curY, helicopter.sizeX, helicopter.sizeY);
    }
    noTint();
}
    
    public void updateSpaceshipHitTime(){
      if(millis()-helicopter.hitBeginTime>=helicopter.invincibleTimeWhenLoseHp){
        helicopter.hitBeginTime = 0;
      }
    }
    
    private void drawAsteroidBelts() {
      for(int i=0;i<asteroidBelts.asteroidCount;i++){
        image(asteroidBelts.images[0],asteroidBelts.topImagesPos[i][0],asteroidBelts.topImagesPos[i][1],50,50);
        image(asteroidBelts.images[0],asteroidBelts.botImagesPos[i][0],asteroidBelts.botImagesPos[i][1],50,50);
        String intersect = helicopter.intersectsWithAsteroidBelt(asteroidBelts);
        if( intersect != null){
              image(helicopter.images[2], helicopter.getCurX(), helicopter.getCurY(), 100,100);
              helicopter.hitBeginTime = millis();
              helicopter.lostHealth();
              if (intersect == "TOP") helicopter.setCurY(helicopter.getCurY() + 50);
              if (intersect == "BOTTOM") helicopter.setCurY(helicopter.getCurY() - 100 );
         }
        
        asteroidBelts.moveAsteroid(i);
        if(asteroidBelts.isOutOfBound(asteroidBelts.topImagesPos[i][0])){
          asteroidBelts.topImagesPos[i][0] = width;
          asteroidBelts.topImagesPos[i][1] = (int)random(asteroidBelts.range);
        }
        if(asteroidBelts.isOutOfBound(asteroidBelts.botImagesPos[i][0])){
          asteroidBelts.botImagesPos[i][0] = width;
          asteroidBelts.botImagesPos[i][1] = (height - (int)random(asteroidBelts.range)) - 50;
      }
      
    }
    }
    
    private void drawCoins() {
        for(GoldCoin coin:coins){
            if(helicopter.intersectWithCoin(coin) && coin.isVisiable){
              coin.isVisiable = false;
              scorePanel.goldCount++; 
            }
            if(coin.isVisiable){
              image(coin.getImage(),coin.curX,coin.curY,100,100);
            }
             coin.move();
          }
    }
    
    public void drawUfos(){
       for(Ufo ufo:ufos){

            if(lazor.isVisiable==true&&lazor.intersectWithUfo(ufo)){
                ufo.isVisiable = false;
                scorePanel.killCount++;
                ufo.move();
                ufo.isVisiable = true;
            }
            
            if(helicopter.hitBeginTime==0&&helicopter.intersectWithUfo(ufo)&&shield.isVisible==false&&ufo.isVisiable){
              helicopter.lostHealth();
              helicopter.hitBeginTime = millis();
            }
            
            if(ufo.isVisiable){
              image(ufo.getImage(),ufo.curX,ufo.curY,100,100);
              ufo.move();
            }
       }
    }
    

    
    public void drawFastCards(){
       for(FastCard card:cards){
            if(helicopter.intersectWithFastCard(card)){
              if (keysInUse.contains(32)) keysInUse.remove(32);
              card.isVisiable = false;
              gameStatus.curLevel = Level.LEVEL_ROGUE;
              rogue = new Rogue();
            }
            if(card.isVisiable){
              image(card.getImage(),card.curX,card.curY,100,100);
            }
            card.asteroidRange = asteroidBelts.getRange();
            card.move();
       }
    }
    
    public void drawAbilityBoxs(){
      //old ui
       for(AbilityBox box:boxs){
         image(box.image,box.curX,box.curY,150,150);
       }
       //imageMode(CORNER);
       //image(box,250,20,300,100);
    }
    
    public void drawIcon(){
      for(int i=0;i<icon.iconCount;i++){
        image(icon.images[i],boxs[i].curX+50,boxs[i].curY+50,50,50);
      }
    }
    
    public void drawHealth(){
      switch(helicopter.health){
        case 1: image(health.images[0],0,170,200,40); break;
        case 2: image(health.images[1],0,170,200,40); break;
        case 3: image(health.images[2],0,170,200,40); break;
      }
    }
    
    public void drawLazor(){
      updateLazor();
      if(lazor.isVisiable==true){
         image(lazor.image,lazor.curX+40,lazor.curY-45,1500,150);
         lazor.move();
         lazor.isVisiable = false;
      }
    }
    
    public void updateLazor(){
      lazor.curX = helicopter.curX;
      lazor.curY = helicopter.curY;
    }
    
    public void drawShield(){
      if(shield.isVisible){
        if (keysInUse.contains(90) && scorePanel.goldCount > 0) scorePanel.goldCount--; 
        
        image(shield.image,helicopter.curX-15,helicopter.curY-25,150,150);
        if (shield.isBonusShieldInUse() && millis() - shield.getStartTime() - shield.getShieldLife() >= 0) {
        shield.closeShield();
        }
        if (scorePanel.goldCount == 0 && !shield.isBonusShieldInUse()) shield.closeShield();
      }

    }
    
    public void writeScoreToTxt(){
      var scores = readHighestScoreFromTxt("score.txt");
      int[] rank = new int[5];
      var pq = new PriorityQueue<Integer>(new Comparator<Integer>(){
        public int compare(Integer a,Integer b){
          return a<=b?1:-1;
        }
      });
      for(int i=0;i<rank.length;i++){
        if(i>=scores.size()){
          rank[i] = 0;
        }else{
          rank[i] = scores.get(i);
        }
        pq.offer(rank[i]);
      }
      pq.offer(score);
      println(pq);
      for(int i=1;i<=5;i++){
        rank[i-1] = pq.remove();
      }
      String []finalScore = new String[5];
      for(int i=0;i<5;i++){
        finalScore[i] = str(rank[i]);
      }
      saveStrings("data/score.txt",finalScore);
    }
    
    public ArrayList<Integer> readHighestScoreFromTxt(String filename){
      var scores = new ArrayList<Integer>();
      String[] grades = loadStrings(filename);
      for(String s:grades){
        scores.add(int(s));
      }
      return scores;
    }
    
    public void setLightDecrease(){
      for(Map map:newMaps){
        map.image.loadPixels();
        lightDecrease.change(isLightDecrease,map.image);
        map.image.updatePixels();
      }
    }
    
    public void setIsLightDecrease(){
      if(isTrigger||isLightDecrease == 2&&isTimeUpdate){
        isLightDecrease = 1;
        if(millis()-time>=5000){
          isLightDecrease = 0;
          setLightDecrease();
          isLightDecrease = 1;
          setLightDecrease();
          isTimeUpdate = false;
          isTrigger = false;
          time = 0;
          isSet = false;
          println("execute");
        }
      }
    }
    
    public void updateTime(){
      if(isLightDecrease==2&&!isTimeUpdate){
        isTrigger = true;
        time = millis();
        isTimeUpdate = true;
      }
    }
    
    public void letLightDecrease(int rate){
      int random = (int)random(101);
      if(random<=rate&&isSet==false){
          isLightDecrease = 2;
          isTrigger = true;
          isSet=true;
      }
    }
    
    public void increaseDifficulty() {
      int randomSelect = (int)random(4);
      switch (randomSelect) {
        //speed of asteroid belts
         case 1:
           asteroidBelts.setSpeed(asteroidBelts.getSpeed() + 5);
           break;
        //speed of aliens
         case 2:
           for (Ufo ufo: ufos){
             ufo.setSpeed(ufo.getSpeed() + 5);
           }
           break; 
      }
     //always change the distance between asteroid belts
     int minRange = asteroidBelts.getMinRange();
     int randomRange = (int)random(minRange, 110);
     asteroidBelts.setRange(randomRange);
     if (minRange < 70) asteroidBelts.setMinRange(minRange + 10);
    }
}
