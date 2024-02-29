import java.util.*;
class GameLevel1 {
    public final Helicopter helicopter = new Helicopter("helicopter.png",0,width/4,3,15);
    public Map map1 = new Map("map1.png",0,0,2);
    public final GoldCoin[] coins = new GoldCoin[10];
    public final Ufo[] ufos = new Ufo[5];
    public Lazor lazor = new Lazor();
    public final Asteriods asteriods = new Asteriods(1);
    public int score = 0;
    public int maxMissileCount = 5;
    public final Missile[] missiles = new Missile[maxMissileCount];
    public int missileCount = 5;
    
    public LightDecrease lightDecrease = new LightDecrease();
    public boolean isSet = false;
    public int isLightDecrease = 1;
    public boolean isTimeUpdate = false;
    public int time = 0;
    public boolean isTrigger = false;
    
    private ScorePanel scorePanel = new ScorePanel();
    private AbilityBox[] boxs = new AbilityBox[3];
    private boolean isGameEnd = false;
    private final FastCard[] cards = new FastCard[2];
    
    public GameLevel1(){
       //init coins
       initCoins();
       //init boxs;
       initBoxs();
       //init ufos;
       initUfos();
       //init fastCards;
       initFastCards();
       //init missiles
       initMissiles();
       //init bullets , need to be motified (when pick up bullet then init it)
       helicopter.initBullets(100);
    }
    
    public void startLevel1(){
        if(!isGameEnd()&&!isGameEnd){
          imageMode(CORNER);
          //draw map
          image(map1.getImage(),map1.curX,map1.curY,width,height);
          //draw coins
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
          letLightDecrease(1);
          //update time
          setLightDecrease();
          updateTime();
          setIsLightDecrease();
          //draw ufo
          drawUfos();
          //draw fasrCard
          drawFastCards();
          //draw bullet
          drawBullets();
          //draw lazor;
          drawLazor();
          //draw missile;
          drawMissiles();
          //draw Asteriods
          drawAsteriods();
          //draw abilityBox
          drawAbilityBoxs();
          //draw gamePanel
          drawGamePanel();
          //draw helicopter
          //image(helicopter.getImage(),helicopter.curX,helicopter.curY,100,100); old ui
          drawSpaceship();
          helicopter.move(mousePressed);
        }else{
          gameStatus.curLevel = Level.LEVEL_END;
          score = scorePanel.score+scorePanel.goldCount*10;
          println("You lose!Your Score is "+score);
          writeScoreToTxt();
        }
    }
    private void initBoxs(){
      int path = 20;
      for(int i=0;i<boxs.length;i++){
        boxs[i] = new AbilityBox();
        boxs[i].curY = 0;
        boxs[i].curX = 100+path+i*75;
      }
    }
    
    private void drawAsteriods(){
      for(int i=0;i<asteriods.asteriodCount;i++){
        image(asteriods.images[0],asteriods.topImagesPos[i][0],asteriods.topImagesPos[i][1],100,100);
        image(asteriods.images[0],asteriods.botImagesPos[i][0],asteriods.botImagesPos[i][1],100,100);
        if(helicopter.intersectWithAsteriods(asteriods)){
              isGameEnd = true;
              return;
         }
        asteriods.setRange((int)random(150));
        asteriods.move();
        if(asteriods.isOutOfBound(asteriods.topImagesPos[i][0])){
          asteriods.topImagesPos[i][0] = width+100;
          asteriods.topImagesPos[i][1] = (int)random(asteriods.range)-100;
        }
        if(asteriods.isOutOfBound(asteriods.botImagesPos[i][0])){
          //asteriods.botImagesPos[i][0] = (int)random(width)+50;
          asteriods.botImagesPos[i][0] = width+100;
          asteriods.botImagesPos[i][1] = height-asteriods.range+(int)random(asteriods.range)-50;
        }
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
    
    private void initMissiles(){
      for(int i=0;i<maxMissileCount;i++){
        missiles[i] = new Missile();
      }
    }
    
    private void initCoins(){
      for(int i=0;i<coins.length;i++){
        coins[i] = new GoldCoin();
        coins[i].isVisiable = true;
        int posY = (int)((height-100)*Math.random());
        int posX =  width-100+i*300;
        coins[i].curX = posX;
        coins[i].curY = posY;
      }
    }
    
    private void initUfos(){
      for(int i=0;i<ufos.length;i++){
        ufos[i] = new Ufo();
        ufos[i].isVisiable = true;
        int posY = (int)((height-100)*Math.random());
        int posX =  width-100+i*300;
        ufos[i].curX = posX;
        ufos[i].curY = posY;
      }
    }

    
    public boolean isGameEnd(){
      if(helicopter.isOutOfBound()){
        return true;
      }
      return false;
    }
    
    public void drawGamePanel(){
       fill(255);
       textSize(30);
       text("Score:",0,50);
       text(scorePanel.score,90,50);
       text("Mineral:",0,100);
       text(scorePanel.goldCount,120,100);
       scorePanel.updateScore();
    }
    
    public void drawSpaceship(){
      if(mousePressed){
        image(helicopter.images[1],helicopter.curX,helicopter.curY,100,100);
      }else{
        image(helicopter.images[0],helicopter.curX,helicopter.curY,100,100);
      }
    }
    
    public void drawUfos(){
       for(Ufo ufo:ufos){
            for(Bullet bullet:helicopter.bullets){
               if(bullet.isIntersectWithUfo(ufo)&&ufo.isVisiable){
                 ufo.isVisiable = false;
                 ufo.move();
                 ufo.isVisiable = true;
               } 
            }
            if(lazor.isVisiable==true&&lazor.intersectWithUfo(ufo)){
                ufo.isVisiable = false;
                ufo.move();
                ufo.isVisiable = true;
            }
            if(helicopter.intersectWithUfo(ufo)){
              isGameEnd = true;
              return;
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
    
    public void drawAbilityBoxs(){
       for(AbilityBox box:boxs){
         image(box.image,box.curX,box.curY,150,150);
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
    
    public void drawMissiles(){
      updateMissiles();
      for(Missile missile:missiles){
         for(Ufo ufo:ufos){
          if(missile.isIntersectWithUfo(ufo)){
            missile.isVisiable = false; 
            missile.move();
          }
        }
        if(missile.isVisiable){
          missile.drawAnimation(missile.curX,missile.curY,100,100,1000);
          missile.move();
        }
      }
    }
    
    public void drawBullets(){
      updateBullets();
      ArrayList<Bullet>bullets = helicopter.bullets;
      for(Bullet bullet:bullets){
        for(Ufo ufo:ufos){
          if(bullet.isIntersectWithUfo(ufo)){
            bullet.isVisiable = false; 
            bullet.move();
          }
        }
        if(bullet.isVisiable){
          image(bullet.image,bullet.curX+90,bullet.curY+50,50,50);
          bullet.move();
        }
      }
    }
    public void updateBullets(){
      for(Bullet bullet:helicopter.bullets){
        if(!bullet.isVisiable){
          bullet.curX = helicopter.curX-1000;
          bullet.curY = helicopter.curY;
        }
      }
    }
    
    public void updateMissiles(){
      for(Missile missile:missiles){
        if(!missile.isVisiable){
          missile.curX = helicopter.curX-1000;
          missile.curY = helicopter.curY;
        }
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
      map1.image.loadPixels();
      lightDecrease.change(isLightDecrease,map1.image);
      map1.image.updatePixels();
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
}
