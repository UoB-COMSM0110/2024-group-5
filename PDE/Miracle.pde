import gifAnimation.*;
import ddf.minim.*;

// LAN BATTLE
Client client;
Player player2;
Player player1;
ProtocolDataFormat protocolDataFormat;
PApplet sketch = this;
String ip;
String msgFromServer;

// time
int now;

// Login UI
GButton loginButton;
LoginUnit loginUnit;
boolean isLogin = false;

// declaration of GameConstant
GameConstant gameConstant;

// declaration of ButtonImage
ButtonImage buttonImage;

// declaration of BackgroundImage
BackgroundImage backgroundImage;

// declaration of Level
Level level;

// start background
Gif gif;
PImage backgroundStart;

// start font
// PFont font;

// gameName miracle
PImage gameName;

// bgm starter
Minim minim;

// GameStatus
GameStatus gameStatus;

// SetPanel
SetPanel setPanel;

// GameLevel
static GameLevel1 gameLevel1;
static GameLevelLAN gameLevelLAN;

void setup() {
    // start record time
    now = millis();

    // init GameConstant
    gameConstant = new GameConstant();

    // init ButtonImage
    buttonImage = new ButtonImage();

    // init BackgroundImage
    backgroundImage = new BackgroundImage();

    // init gameName
    gameName = loadImage("miracle.png");

    // init gif
    gif = new Gif(this, "background_start2.gif");
    gif.play();

    // init bgm
    minim = new Minim(this);
    Bgm.setup(minim);  // Setup Bgm with Minim

    // init GameStatus
    gameStatus = new GameStatus();

    // init setPanel
    setPanel = new SetPanel();

    // init gameLevel1
    gameLevel1 = new GameLevel1();
    gameLevelLAN = new GameLevelLAN();

    // client
    client = new Client();
    try {
        InetAddress localhost = InetAddress.getLocalHost();
        ip = localhost.getHostAddress();
    } catch (UnknownHostException e) {
        e.printStackTrace();
    }

    size(1125, 630);  // Adjust the size of the game window
}

void draw() {
    // show background with level
    cursor(buttonImage.cursor);
    if (gameStatus.curLevel == Level.LEVEL_BEGIN) {
        gameLevel1 = new GameLevel1();
        // play music
        Bgm.bgmStart(gameStatus.curLevel);
        imageMode(CORNER);
        image(gif, 0, 0, width, height);
        imageMode(CORNER);
        image(buttonImage.BTN_SETTAG, width - 70, 30, 40, 40);
        drawButton(level.LEVEL_BEGIN);
        imageMode(CENTER);
        image(gameName, width / 2, height / 5, gameName.width, gameName.height);
    }
    if (gameStatus.curLevel == Level.LEVEL_SET) {
        setPanel.createPanel();
    }
    if (gameStatus.curLevel == Level.LEVEL_MAP1) {
        Bgm.bgmStart(gameStatus.curLevel);
        gameLevel1.startLevel1();
    }
    if (isLogin && gameStatus.curLevel == Level.LEVEL_LOGIN) {
        Bgm.bgmStart(Level.LEVEL_BEGIN);
        loginUnit = new LoginUnit(this);
    }
    if (gameStatus.curLevel == Level.LEVEL_LANBATTLE) {
        if (player2 != null) {
            gameLevelLAN.setPlayer2(player2);
            gameLevelLAN.startLevelLanBattle();
        }
        player1 = gameLevelLAN.player1;
        if (client != null) {
            client.send();
        }
    }
}
