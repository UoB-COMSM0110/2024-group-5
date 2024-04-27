import gifAnimation.*;
import ddf.minim.*;

//thread(to reduce objects loading time)
Thread thread;
boolean isAllDone = false;

//startAnimation
int numStars = 500; 
Star[] stars; 
Spaceship spaceship; 
String welcomeText = "Welcome to Group 5 Game!";
String startText = "Click to Start";
float textExpandSpeed = 5; 
boolean gameStarted = false;
boolean textVisible = true;
boolean starsFormingMiracle = false;
boolean[] usedStars; 
boolean isAnimationEnd = false;

//LAN BATTLE
Client client;
Player player2;
Player player1;
ProtocolDataFormat protocolDataFormat; 
PApplet sketch = this;
String ip;
String msgFromServer;

//font
PFont pfont;

//time
int now;

//Login UI
GButton loginButton;
LoginUnit loginUnit;
boolean isLogin=false;

//declaration of GameConstant
GameConstant gameConstant;

//declaration of ButtonImage
ButtonImage buttonImage; 

//declaration of BackgroundImage
BackgroundImage backgroundImage; 

//declaration of Level
Level level;

//start background 
Gif gif;
PImage backgroundStart;

//start font
//PFont font;

//gameName miracle
PImage gameName;

//bgm starter
Minim minim;
AudioPlayer playerLevelBegin;
AudioPlayer playerLevelSet;
AudioPlayer playerLevelMap1;
AudioPlayer playerBullet1;
AudioPlayer playerStart;
AudioPlayer playerClick;

//GameStatus
GameStatus gameStatus;

//SetPanel
SetPanel setPanel;

//GameLevel
static GameLevel1 gameLevel1;
static GameLevel2 gameLevel2;
static GameLevelLAN gameLevelLAN;

//Rogue
Rogue rogue;

//ModeChoosePanel
ModeChoosePanel mcPanel;

void setup(){  
  thread = new Thread(new MyRunnable());
  thread.start();
 
  ////init bgm
  minim = new Minim(this);
  playerStart = minim.loadFile(Bgm.bgmStart);
  
  //init GameStatus
  gameStatus = new GameStatus();
  
  //init stars
  stars = new Star[numStars];
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star();
  }
  
  //init usedStars
  usedStars = new boolean[numStars];
  Arrays.fill(usedStars,false);
  
  //font
  pfont = createFont("font/Boxy-Bold.ttf",50);
  textFont(pfont);
  size(1125,630);
  
  //init spaceship
  spaceship = new Spaceship();

}




void draw(){
  frameRate(180);
  isAllDone = !thread.isAlive();
  // show background with level
  // if all objects have been loaded
  if(isAllDone){
    //init cursor
     //cursor(buttonImage.cursor);
  }
  
  if(gameStatus.curLevel == Level.LEVEL_START){
    background(0);
    bgmStart(gameStatus.curLevel);
    drawStartAni();
    return;
  }
  
  if(gameStatus.curLevel == Level.LEVEL_BEGIN&&isAllDone){
    if(gameLevel1.isGameEnd == true||gameLevel1.isGameEnd()){
      gameLevel1 = new GameLevel1();
      gameLevel1.initByDifficulty();
    }
    
    if(gameLevel2.isGameEnd == true||gameLevel2.isGameEnd()){
      gameLevel2 = new GameLevel2();
      gameLevel2.initByDifficulty();
    }
    
    // play music
    bgmStart(gameStatus.curLevel);
    imageMode(CORNER);
    gif.play();
    image(gif, 0,0 ,width,height);
    imageMode(CORNER);
    image(buttonImage.BTN_SETTAG,width-70,30,40,40);
    drawButton(Level.LEVEL_BEGIN);
    imageMode(CENTER);
    // need to be confirmed(design a function matched with level)
    image(gameName,width/2,height/5,gameName.width,gameName.height);
    return;
  }
  
  if(gameStatus.curLevel == Level.LEVEL_SET&&isAllDone){
    setPanel.createPanel();
      if(mousePressed&&mouseX>=setPanel.volumePointerX-20&&mouseX-10<=setPanel.volumePointerX+80&&mouseY>=setPanel.volumePointerY-20&&mouseY<=setPanel.volumePointerY+40){
      if(mouseX<400){
        setPanel.volumePointerX = 400;
      }
      else if(mouseX>695){
        setPanel.volumePointerX = 695;
      }
      else{
         setPanel.volumePointerX = mouseX-40;
      }
      float diff = (setPanel.volumePointerX-400.0)/3.0-50;
      setVolume(diff);
    }
    
    //set difficulty
    if(mousePressed&&mouseY>=setPanel.diffPointerY-20&&mouseY<=setPanel.diffPointerY+40){
      if(mouseX<=500){
        setPanel.diffPointerX = 360;
        gameStatus.curDifficulty = Difficulty.EASY;
      }
      else if(mouseX>=600){
        setPanel.diffPointerX = 730;
         gameStatus.curDifficulty = Difficulty.HARD;
      }
      else{
         setPanel.diffPointerX = 550;
         gameStatus.curDifficulty = Difficulty.NORMAL;
      }
    }
    //println("setPanel.volumePointerX:"+setPanel.volumePointerX+",setPanel.volumePointerY:"+setPanel.volumePointerY);
    println(gameStatus.curDifficulty);
     gameLevel1.initByDifficulty();
    return;
  }
  if(gameStatus.curLevel == Level.LEVEL_MAP1&&isAllDone){
    // play music
    bgmStart(gameStatus.curLevel);
    gameLevel1.startLevel1();
    if(gameLevel1.isGameEnd||gameLevel1.isGameEnd){
      gameLevel1 = null;
    }
    return;
  }
  
  if(gameStatus.curLevel == Level.LEVEL_MAP2&&isAllDone){
    // play music
    bgmStart(gameStatus.curLevel);
    gameLevel2.startLevel2();
    if(gameLevel2.isGameEnd||gameLevel2.isGameEnd){
      gameLevel2 = null;
    }
    return;
  }
  
  if(isLogin&&gameStatus.curLevel == Level.LEVEL_LOGIN&&isAllDone){
    // play music
    bgmStart(Level.LEVEL_BEGIN);
    //init loginUi
    loginUnit = new LoginUnit(this);
    return;
  }
  if(gameStatus.curLevel == Level.LEVEL_LANBATTLE&&isAllDone){
     if(player2!=null){
      gameLevelLAN.setPlayer2(player2);
      gameLevelLAN.startLevelLanBattle();
    }
    player1 = gameLevelLAN.player1;
    if(client!=null){
      client.send();
    }
    return;
  }
  if(gameStatus.curLevel==Level.LEVEL_ROGUE){
     rogue.draw();
  }
  
  if(gameStatus.curLevel == Level.LEVEL_STORY){
     Story story = new Story();
     story.createPanel();
     return;
  }
  
  if(gameStatus.curLevel == Level.LEVEL_MODECHOOSE){
     mcPanel.createPanel();
  }
  
  if(gameStatus.curLevel == Level.LEVEL_TOTURIAL){
     Story story = new Story();
     story.createPanel();
     return;
  }
  
  if(gameStatus.curLevel == Level.LEVEL_END&&isAllDone){
    GameResultPanel gameResultPanel = new GameResultPanel();
    gameResultPanel.createPanel();
    return;
  }
  if(gameStatus.curLevel == Level.LEVEL_END2&&isAllDone){
    GameResultPanel2 gameResultPanel2 = new GameResultPanel2();
    gameResultPanel2.createPanel();
    return;
  }
  
  if(gameStatus.curLevel == Level.LEVEL_RANK&&isAllDone){
    ToturialPanel toturialPanel = new  ToturialPanel();
     toturialPanel.createPanel();
     return;
  }
}
