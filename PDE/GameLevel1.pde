import java.util.*;
class GameLevel1 {
    public final Helicopter helicopter = new Helicopter("helicopter.png",0,width/4,3,15);
    public Map[] newMaps = new Map[3];
    public int randomMap = (int)random(5);
    public final GoldCoin[] coins = new GoldCoin[10];
    public final Shield shield = new Shield();
    public final Ufo[] ufos = new Ufo[5];
    public Lazor lazor = new Lazor();
    public final Asteriods asteriods = new Asteriods(1);
    public int score = 0;
    public int maxMissileCount = 50;
    public final Missile[] missiles = new Missile[maxMissileCount];
    public int missileCount = 50;
    
    public LightDecrease lightDecrease = new LightDecrease();
    public boolean isSet = false;
    public int isLightDecrease = 1;
    public boolean isTimeUpdate = false;
    public int time = 0;
    public boolean isTrigger = false;
    public boolean spaceCheck = false;
    
    private ScorePanel scorePanel = new ScorePanel();
    private AbilityBox[] boxs = new AbilityBox[3];
    private Icon icon = new Icon();
    private Health health = new Health();
    //private PImage box = loadImage("abilityBox1.png");
    private boolean isGameEnd = false;
    private final FastCard[] cards = new FastCard[2];
    
    public int gameTime = millis();
    public boolean isSetSpeedPlus = false;
    
    
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
       //init new maps;
       initNewMaps();
       //init bullets , need to be motified (when pick up bullet then init it)
       helicopter.initBullets(100);
    }
    
    public void startLevel1(){
        if(!isGameEnd()&&!isGameEnd){
          imageMode(CORNER);
          //draw map
          drawNewMaps();
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
          
          //change speed with time passing
          if(millis()-gameTime>=30000){
            println("speed up!");
            for(Ufo ufo:ufos){
              ufo.speed += 5;
            }
            asteriods.speed +=1;
            //randomMap = (int)random(5);
            gameTime = millis();
          }
          
          updateSpaceshipHitTime();
         
          //letLightDecrease(1);
          ////update time
          //setLightDecrease();
          //updateTime();
          //setIsLightDecrease();
          
          //draw ufo
          drawUfos();

          //draw bullet
          drawBullets();
          //draw lazor;
          drawLazor();
          //draw missile;
          drawMissiles();
          //draw Asteriods
          drawAsteriods();
          //draw abilityBox
          //drawAbilityBoxs();
          //draw fasrCard
          drawFastCards();
          //draw gamePanel
          drawGamePanel();
          //draw Shield
          drawShield();
          //draw icon
          //drawIcon();
          //draw health
          drawHealth();
          //draw helicopter
          //image(helicopter.getImage(),helicopter.curX,helicopter.curY,100,100); old ui
          drawSpaceship();
          helicopter.move(mousePressed);
        }else{
          gameStatus.curLevel = Level.LEVEL_END;
          score = scorePanel.score+scorePanel.goldCount*10;
          println("You lose! Your Score is "+ score);
          writeScoreToTxt();
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
    
    private boolean keyPressed(){
      if (key == ' ') {
        return true;
      } else return false;
    }
    
    private void initNewMaps(){
      int random = (int)random(34);
      for(int i=0;i<newMaps.length;i++){
        newMaps[i] = new Map("./gameMap/map-"+random+".png",i*width,0,5);
      }
    }
    
    private void drawNewMaps(){
      for(Map map:newMaps){
        imageMode(CORNER);
        image(map.image,map.curX,map.curY,width,height);
        map.move();
      }
    }
    
    private void drawAsteriods(){
      for(int i=0;i<asteriods.asteriodCount;i++){
        image(asteriods.images[0],asteriods.topImagesPos[i][0],asteriods.topImagesPos[i][1],asteriods.topImageSize[i][0],asteriods.topImageSize[i][1]);
        image(asteriods.images[0],asteriods.botImagesPos[i][0],asteriods.botImagesPos[i][1],asteriods.botImageSize[i][0],asteriods.botImageSize[i][0]);
        if(helicopter.hitBeginTime==0&&helicopter.intersectWithAsteriods(asteriods)&&shield.isVisible==false){
              helicopter.lostHealth();
              helicopter.hitBeginTime = millis();
         }
        asteriods.setRange((int)random(300));
        asteriods.move();
        if(asteriods.isOutOfBound(asteriods.topImagesPos[i][0])){
          asteriods.topImagesPos[i][0] = width+(int)random(300);
          asteriods.topImagesPos[i][1] = (int)random(asteriods.range)-100;
        }
        if(asteriods.isOutOfBound(asteriods.botImagesPos[i][0])){
          //asteriods.botImagesPos[i][0] = (int)random(width)+50;
          asteriods.botImagesPos[i][0] = width+(int)random(300);
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
        int posX =  width-100+i*(int)random(300);
        coins[i].curX = posX;
        coins[i].curY = posY;
      }
    }
    
    private void initUfos(){
      for(int i=0;i<ufos.length;i++){
        ufos[i] = new Ufo();
        ufos[i].isVisiable = true;
        int posY = (int)random(height-100);
        int posX =  width+(int)random(2000)+(int)(i*random(100));
        ufos[i].curX = posX;
        ufos[i].curY = posY;
      }
    }

    
    public boolean isGameEnd(){
      if(helicopter.health==0){
        return true;
      }
      return false;
    }
    
    public void drawGamePanel(){
       fill(255);
       textSize(30);
       textAlign(LEFT);
       text("Score:",0,50);
       text(scorePanel.score,160,50);
       text("Mineral:",0,100);
       text(scorePanel.goldCount,210,100);
       scorePanel.updateScore();
    }
    
    public void drawSpaceship(){
      if(helicopter.hitBeginTime!=0){
         tint(150,100); 
      }
      if(mousePressed){
        image(helicopter.images[1],helicopter.curX,helicopter.curY,100,100);
      }else{
        image(helicopter.images[0],helicopter.curX,helicopter.curY,100,100);
      }
      noTint();
    }
    
    public void updateSpaceshipHitTime(){
      if(millis()-helicopter.hitBeginTime>=helicopter.invincibleTimeWhenLoseHp){
        helicopter.hitBeginTime = 0;
      }
    }
    
    public void drawUfos(){
       for(Ufo ufo:ufos){
            for(Bullet bullet:helicopter.bullets){
               if((bullet.isIntersectWithUfo(ufo)&&ufo.isVisiable)||ufo.isDestoryed){
                 ufo.isVisiable = false;
                 ufo.isDestoryed = true;
                 ufo.explode.drawExplode(0.5,ufo.curX+40,ufo.curY+20);
                 if(ufo.explode.isEnd==true){
                   ufo.move();
                   ufo.isVisiable = true;
                   ufo.explode.isEnd = false;
                   ufo.explode.isVisible = true;
                   ufo.explode.curIndx = 0;
                   ufo.isDestoryed = false;
                 }
               } 
            }
            
            for(Missile missile:missiles){
               if((missile.isIntersectWithUfo(ufo)&&ufo.isVisiable)||ufo.isDestoryed){
                 ufo.isVisiable = false;
                 ufo.isDestoryed = true;
                 ufo.explode.drawExplode(0.5,ufo.curX+40,ufo.curY+20);
                 if(ufo.explode.isEnd==true){
                   ufo.move();
                   ufo.isVisiable = true;
                   ufo.explode.isEnd = false;
                   ufo.explode.isVisible = true;
                   ufo.explode.curIndx = 0;
                   ufo.isDestoryed = false;
                 }
               } 
            }
            if(lazor.isVisiable==true&&lazor.intersectWithUfo(ufo)){
                ufo.isVisiable = false;
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
              card.isVisiable = false;
              helicopter.setHealth(helicopter.getHealth()+1);
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
        case 1: image(health.images[0],0,120,200,40); break;
        case 2: image(health.images[1],0,120,200,40); break;
        case 3: image(health.images[2],0,120,200,40); break;
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
        image(shield.image,helicopter.curX-15,helicopter.curY-25,150,150);
      }
    }
    
    public void drawMissiles(){
      updateMissiles();
      for(Missile missile:missiles){
        if(missile.isVisiable){
          missile.drawMissile(100,missile.curX+90,missile.curY+50);
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
}
