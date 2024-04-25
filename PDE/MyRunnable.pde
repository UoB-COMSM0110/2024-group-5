class MyRunnable implements Runnable{
  @Override
  public void run(){
      //init ButtonImage
    buttonImage = new ButtonImage();
    
    //init BackgroundImage
    backgroundImage = new BackgroundImage();
    
    //init gameName
    gameName = loadImage("miracle.png");
    
    //init gif 
    gif = new Gif(sketch,"background_start2.gif");
    //backgroundStart = loadImage("background_start.gif");
    
    //init bgm
    //minim = new Minim(this);
    playerLevelBegin = minim.loadFile(Bgm.bgmLevelBegin);
    playerLevelSet = minim.loadFile(Bgm.bgmLevelBegin);
    playerLevelMap1 = minim.loadFile(Bgm.bgmLevelMap1);
    playerBullet1 = minim.loadFile(Bgm.bgmBullet1);
    //playerStart = minim.loadFile(Bgm.bgmStart);
    playerClick = minim.loadFile(Bgm.bgmClick);
        //init setPanel
    setPanel = new SetPanel();
    
    //init gameLevel1
    gameLevel1 = new GameLevel1();
    gameLevel2 = new GameLevel2();
    gameLevelLAN = new GameLevelLAN();
    
    //init gameModeChoose;
    mcPanel = new ModeChoosePanel();
    
    //client
    client = new Client();
    try{
       InetAddress localhost = InetAddress.getLocalHost();
       ip = localhost.getHostAddress();
    }catch (UnknownHostException e) {
       e.printStackTrace();
    }
  }
}
