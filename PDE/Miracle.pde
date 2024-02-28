import gifAnimation.*;
import ddf.minim.*;



//LAN BATTLE
Client client;
Player player2;
Player player1;
ProtocolDataFormat protocolDataFormat; 
PApplet sketch = this;
String ip;
String msgFromServer;

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

//GameStatus
GameStatus gameStatus;

//SetPanel
SetPanel setPanel;

//GameLevel
static GameLevel1 gameLevel1;
static GameLevelLAN gameLevelLAN;

void setup(){  
  //start record time
  now = millis();
  
  //init GameConstant
  gameConstant = new GameConstant(); 
  
  //init ButtonImage
  buttonImage = new ButtonImage();
  
  //init BackgroundImage
  backgroundImage = new BackgroundImage();
  
  //init gameName
  gameName = loadImage("miracle.png");
  
  //init gif 
  gif = new Gif(this,"background_start2.gif");
  //backgroundStart = loadImage("background_start.gif");
  gif.play();
  
  //font
  //font = createFont("monaco.ttf",50);
  //draw welcome screen
  
  //init bgm
  minim = new Minim(this);
  playerLevelBegin = minim.loadFile(Bgm.bgmLevelBegin);
  playerLevelSet = minim.loadFile(Bgm.bgmLevelBegin);
  playerLevelMap1 = minim.loadFile(Bgm.bgmLevelMap1);
  playerBullet1 = minim.loadFile(Bgm.bgmBullet1);
  
  //init GameStatus
  gameStatus = new GameStatus();
  
  //init setPanel
  setPanel = new SetPanel();
  
  //init gameLevel1
  gameLevel1 = new GameLevel1();
  gameLevelLAN = new GameLevelLAN();
  
  //client
  client = new Client();
  try{
     InetAddress localhost = InetAddress.getLocalHost();
     ip = localhost.getHostAddress();
  }catch (UnknownHostException e) {
     e.printStackTrace();
  }
  
  size(1125,630);
}

void draw(){
  // show background with level
  //init cursor
  cursor(buttonImage.cursor);
  if(gameStatus.curLevel == Level.LEVEL_BEGIN){
    gameLevel1 = new GameLevel1();
    // play music
    bgmStart(gameStatus.curLevel);
    imageMode(CORNER);
    image(gif, 0,0 ,width,height);
    imageMode(CORNER);
    image(buttonImage.BTN_SETTAG,width-70,30,40,40);
    drawButton(level.LEVEL_BEGIN);
    imageMode(CENTER);
    // need to be confirmed(design a function matched with level)
    image(gameName,width/2,height/5,gameName.width,gameName.height);
  }
  if(gameStatus.curLevel == Level.LEVEL_SET){
    //// play music
    //bgmStart(gameStatus.curLevel);
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
      println("yes!");
    }
    
    if(mousePressed&&mouseX>=setPanel.diffPointerX-20&&mouseX-10<=setPanel.diffPointerX+80&&mouseY>=setPanel.diffPointerY-20&&mouseY<=setPanel.diffPointerY+40){
      if(mouseX<400){
        setPanel.diffPointerX = 400;
      }
      else if(mouseX>695){
        setPanel.diffPointerX = 695;
      }
      else{
         setPanel.diffPointerX = mouseX-40;
      }
      println("yes!");
    }
    
  println("setPanel.volumePointerX:"+setPanel.volumePointerX+",setPanel.volumePointerY:"+setPanel.volumePointerY);
  }
  if(gameStatus.curLevel == Level.LEVEL_MAP1){
    // play music
    bgmStart(gameStatus.curLevel);
    gameLevel1.startLevel1();
  }
  if(isLogin&&gameStatus.curLevel == Level.LEVEL_LOGIN){
    // play music
    bgmStart(Level.LEVEL_BEGIN);
    //init loginUi
    loginUnit = new LoginUnit(this);
  }
  if(gameStatus.curLevel == Level.LEVEL_LANBATTLE){
     if(player2!=null){
      gameLevelLAN.setPlayer2(player2);
      gameLevelLAN.startLevelLanBattle();
    }
    player1 = gameLevelLAN.player1;
    if(client!=null){
      client.send();
    }
  }
}
