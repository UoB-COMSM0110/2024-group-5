class GameLevelLAN{
  public final PImage imageHelicopter = loadImage("helicopter.png");
  public boolean isGameAllEnd = false;
  public Player player1;
  public Player player2;
  public PublicSource publicSource;
  public final Map map1 = new Map("map1.png",0,0,2);
  public GameLevelLAN(){
      initPlayer1();
  }
  
  public void initPlayer1(){
      player1 = new Player1();
  }
  
  public void setPlayer2(Player player2){
     this.player2 = player2;
  }
  
  public void initPublicSource(){
      
  }
  
    public void startLevelLanBattle(){
      if(isGameAllEnd){
        gameStatus.curLevel = Level.LEVEL_BEGIN;
        return;
      }
      if(!player1.isGameEnd||!player2.isGameEnd){
          imageMode(CORNER);
          //draw map
          image(map1.getImage(),map1.curX,map1.curY,width,height);
          if(!player1.isGameEnd){
            image(imageHelicopter,player1.helicopter.curX,player1.helicopter.curY,100,100);
          }
          if(!player2.isGameEnd){
            image(imageHelicopter,player2.helicopter.curX,player2.helicopter.curY,100,100);
          }
          player1.helicopter.move(mousePressed);
       }
       isGameAllEnd =  player1.isGameEnd&&player2.isGameEnd;
    }
    //public void drawCoins(){
    //   for(GoldCoin coin:publicSource.coins){
    //      if(player1.helicopter.intersectWithCoin(coin) && coin.isVisiable){
    //          coin.isVisiable = false;
    //          player1.scorePanel.goldCount++; 
    //        }
    //       if(coin.isVisiable){
    //          image(coin.getImage(),coin.curX,coin.curY,100,100);
    //       }
    //       coin.move();
    //      if(player2.helicopter.intersectWithCoin(coin) && coin.isVisiable){
    //          coin.isVisiable = false;
    //          player2.scorePanel.goldCount++; 
    //        }
    //       if(coin.isVisiable){
    //          image(coin.getImage(),coin.curX,coin.curY,100,100);
    //       }
    //       coin.move();
    //  }
    //}
}
