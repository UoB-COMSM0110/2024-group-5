public class Bgm{
  public static final String bgmLevelBegin = "mainMenu.wav";
  public static final String bgmLevelMap1 = "bgmLevelMap1.mp3";
  public static final String bgmBullet1 = "bullet1.mp3";
}

void bgmStart(Level level){
  if(level == Level.LEVEL_BEGIN){
    if(!playerLevelBegin.isPlaying()){
        playerLevelBegin.rewind();
        playerLevelBegin.play();
    }
  }else{
    playerLevelBegin.pause();
  }
  
  if(level == Level.LEVEL_SET){
    if(!playerLevelSet.isPlaying()){
        playerLevelSet.rewind();
        playerLevelSet.play();
    }
  }else{
    playerLevelSet.pause();
  }
  
  if(level == Level.LEVEL_MAP1){
    if(!playerLevelMap1.isPlaying()){
        playerLevelMap1.rewind();
        playerLevelMap1.play();
    }
  }else{
    playerLevelMap1.pause();
  }
   
  //to do
}
