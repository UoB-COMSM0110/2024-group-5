class GameLevel2 {
    public final Helicopter helicopter = new Helicopter("helicopter.png",0,width/4,3,7);
    public final Helicopter helicopter2 = new Helicopter("helicopter2.png",0,width/3,3,7);
    public Map[] newMaps = new Map[3];
    public int randomMap = (int)random(5);
    public final GoldCoin[] coins = new GoldCoin[10];
    public final Ufo[] ufos = new Ufo[5];
    public final Asteriods asteriods = new Asteriods(1);
    public AsteroidBelts asteroidBelts = new AsteroidBelts(1, 50);
    public boolean gameStarted = false;
    public boolean showStartImage = true;
    
    private ScorePanel scorePanel = new ScorePanel();
    private ScorePanel scorePanel2 = new ScorePanel();

    private Health health = new Health();
    private Health health2 = new Health();

    private boolean isGameEnd = false;
    private final FastCard[] cards = new FastCard[2];
    
    public int gameTime = millis();
    public boolean isSetSpeedPlus = false;
    Gif startImg;

    
    public GameLevel2(){
       initCoins();
       initUfos();
       initFastCards();
       initNewMaps();
       startImg = new Gif(sketch, "spacebarBegin.gif");
       startImg.play();
    }
    
    public void startLevel2(){
      if (!gameStarted) {
        drawNewMaps();
        drawAsteroidBelts();
        drawSpaceship(); 
        drawGamePanel();
        imageMode(CENTER);
        image(startImg, width / 2, height / 2);
        return; 
      }
      
        if(!isGameEnd()&&!isGameEnd){
          imageMode(CORNER);
          drawNewMaps();
          drawCoins();
     
          
          //change speed with time passing
          if(millis()-gameTime>=20000){
            println("speed up!");
            for(Ufo ufo:ufos){
              ufo.speed += 5;
            }
            asteriods.speed +=1;
            //randomMap = (int)random(5);
            gameTime = millis();
          }
          
          updateSpaceshipHitTime();
          
          drawUfos();

          drawFastCards();

          drawSpaceship();
          drawAsteroidBelts();
          drawGamePanel();
          //drawIcon();
          drawHealth();
          if( helicopter.health>0){
            helicopter.move(mousePressed);
          }
          if( helicopter2.health>0){
            helicopter2.move(keyPressed && key == ' ');
          }
        }else{
          gameStatus.curLevel = Level.LEVEL_END2;
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
      helicopter.speed = 7;
      helicopter2.health = 3;
      helicopter2.speed = 7;
      for(int i=0;i<ufos.length;i++){
        ufos[i].speed = 10;
      }
      helicopter.sizeX = 100;
      helicopter.sizeY = 100;
      helicopter2.sizeX = 100;
      helicopter2.sizeY = 100;
    }
    
    private void setNormal(){
      helicopter.health = 2;
      helicopter.speed = 12;
      helicopter2.health = 2;
      helicopter2.speed = 12;
      for(int i=0;i<ufos.length;i++){
        ufos[i].speed = 15;
      }
      helicopter.sizeX = 110;
      helicopter.sizeY = 110;
      helicopter2.sizeX = 110;
      helicopter2.sizeY = 110;
    }
    
    private void setHard(){
      helicopter.health = 1;
      helicopter.speed = 17;
      helicopter2.health = 1;
      helicopter2.speed = 17;
      for(int i=0;i<ufos.length;i++){
        ufos[i].speed = 23;
      }
      helicopter.sizeX = 120;
      helicopter.sizeY = 120;
      helicopter2.sizeX = 120;
      helicopter2.sizeY = 120;
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
        int posY = (int)((height-100)*Math.random());
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
      if(helicopter.health==0&&helicopter2.health==0){
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
       if(helicopter.health>0){
         scorePanel.updateScore();
       }       
      textAlign(LEFT);
       text("Score:",width-250,50);
       text(scorePanel2.score,width-70,50);
       text("Mineral:",width-250,100);
       text(scorePanel2.goldCount,width-30,100);
       if(helicopter2.health>0){
         scorePanel2.updateScore();
       }
      }
    }
    
    public void drawSpaceship(){
      if(helicopter.health>0&&helicopter.hitBeginTime!=0){
        image(helicopter.images[2], helicopter.curX, helicopter.curY,helicopter.sizeX,helicopter.sizeY);
         tint(150,100); 
      }
      if(helicopter2.health>0&&helicopter2.hitBeginTime!=0){
        image(helicopter2.images[2], helicopter2.curX, helicopter2.curY,helicopter2.sizeX,helicopter2.sizeY);
         tint(150,100); 
      }
      if( helicopter.health>0){
        if(mousePressed){
          image(helicopter.images[1],helicopter.curX,helicopter.curY,helicopter.sizeX,helicopter.sizeY);
        }else{
          image(helicopter.images[0],helicopter.curX,helicopter.curY,helicopter.sizeX,helicopter.sizeY);
        }
      }
      noTint();
      if( helicopter2.health>0){
        if(keyPressed&&key==' '){
          image(helicopter2.images[4],helicopter2.curX,helicopter2.curY,helicopter2.sizeX,helicopter2.sizeY);
        }else{
          image(helicopter2.images[3],helicopter2.curX,helicopter2.curY,helicopter2.sizeX,helicopter2.sizeY);
        }
      }
      noTint();
    }
    
    public void updateSpaceshipHitTime(){
      if(millis()-helicopter.hitBeginTime>=helicopter.invincibleTimeWhenLoseHp){
        helicopter.hitBeginTime = 0;
      }
      if(millis()-helicopter2.hitBeginTime>=helicopter2.invincibleTimeWhenLoseHp){
        helicopter2.hitBeginTime = 0;
      }
    }
    
    private void drawAsteroidBelts() {
      for(int i=0;i<asteroidBelts.asteroidCount;i++){
        image(asteroidBelts.images[0],asteroidBelts.topImagesPos[i][0],asteroidBelts.topImagesPos[i][1],50,50);
        image(asteroidBelts.images[0],asteroidBelts.botImagesPos[i][0],asteroidBelts.botImagesPos[i][1],50,50);
        String intersect = helicopter.intersectsWithAsteroidBelt(asteroidBelts);
        String intersect2 = helicopter2.intersectsWithAsteroidBelt(asteroidBelts);
        if( helicopter.health>0&&(intersect != null||helicopter.isOutOfBound())){
              image(helicopter.images[2], helicopter.getCurX(), helicopter.getCurY(), 100,100);
              helicopter.hitBeginTime = millis();
              helicopter.lostHealth();
              if (intersect == "TOP") helicopter.setCurY(helicopter.getCurY() + 50);
              if (intersect == "BOTTOM") helicopter.setCurY(helicopter.getCurY() - 100 );
         }
         
         if( helicopter2.health>0&& (intersect2 != null||helicopter2.isOutOfBound())){
              image(helicopter2.images[2], helicopter2.getCurX(), helicopter2.getCurY(), 100,100);
              helicopter2.hitBeginTime = millis();
              helicopter2.lostHealth();
              if (intersect2 == "TOP") helicopter2.setCurY(helicopter2.getCurY() + 50);
              if (intersect2 == "BOTTOM") helicopter2.setCurY(helicopter2.getCurY() - 100 );
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
            if( helicopter.health>0&&helicopter.intersectWithCoin(coin) && coin.isVisiable){
              coin.isVisiable = false;
              scorePanel.goldCount++; 
            }
            if( helicopter2.health>0&&helicopter2.intersectWithCoin(coin) && coin.isVisiable){
              coin.isVisiable = false;
              scorePanel2.goldCount++; 
            }
            if(coin.isVisiable){
              image(coin.getImage(),coin.curX,coin.curY,100,100);
            }
             coin.move();
          }
    }
    
    public void drawUfos(){
       for(Ufo ufo:ufos){
                   
            if( helicopter.health>0&&helicopter.hitBeginTime==0&&helicopter.intersectWithUfo(ufo)&&ufo.isVisiable){
              helicopter.lostHealth();
              helicopter.hitBeginTime = millis();
            }
            
             if( helicopter2.health>0&&helicopter2.hitBeginTime==0&&helicopter2.intersectWithUfo(ufo)&&ufo.isVisiable){
              helicopter2.lostHealth();
              helicopter2.hitBeginTime = millis();
            }
            
            if(ufo.isVisiable){
              image(ufo.getImage(),ufo.curX,ufo.curY,100,100);
              ufo.move();
            }
       }
    }
    

    
    public void drawFastCards(){
       for(FastCard card:cards){
            if( helicopter.health>0&&helicopter.intersectWithFastCard(card)){
              card.isVisiable = false;
              helicopter.setHealth(helicopter.getHealth()+1);
              for(Ufo ufo:ufos){
                ufo.speed+=5;
              } 
            }
            if( helicopter2.health>0&&helicopter2.intersectWithFastCard(card)){
              card.isVisiable = false;
              helicopter2.setHealth(helicopter2.getHealth()+1);
              for(Ufo ufo:ufos){
                ufo.speed+=5;
              } 
            }
            if(card.isVisiable){
              image(card.getImage(),card.curX,card.curY,100,100);
            }
            card.move();
       }
    }
    public void drawHealth(){
      switch(helicopter.health){
        case 1: image(health.images[0],0,120,200,40); break;
        case 2: image(health.images[1],0,120,200,40); break;
        case 3: image(health.images[2],0,120,200,40); break;
      }
      switch(helicopter2.health){
        case 1: image(health.images[0],width-250,120,200,40); break;
        case 2: image(health.images[1],width-250,120,200,40); break;
        case 3: image(health.images[2],width-250,120,200,40); break;
      }
    }
}
