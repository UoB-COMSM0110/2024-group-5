public class Bgm{
  public static final String bgmLevelBegin = "space1.mp3";
  public static final String bgmLevelMap1 = "bgmLevelMap1.mp3";
  public static final String bgmBullet1 = "bullet1.mp3";
  public static final String bgmStart = "start.wav";
  public static final String bgmClick = "click.wav";
}

void bgmStart(Level level){
  if(level == Level.LEVEL_START){
    if(gameStarted){
      if(!playerStart.isPlaying()){
          playerStart.play();
      }
    }
  }

  if(isAllDone){
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
    
    //if(level == Level.LEVEL_MAP1 || level == Level.LEVEL_MAP2){
    //  if(!playerLevelMap1.isPlaying()){
    //      playerLevelMap1.rewind();
    //      playerLevelMap1.play();
    //  }
    //}
    //else{
    //  playerLevelMap1.pause();
    //}
  }
  //to do
}

public void setVolume(float diff){
    playerLevelBegin.setGain(diff);
    playerLevelSet.setGain(diff);
    playerLevelMap1.setGain(diff); 
    playerBullet1.setGain(diff);
    playerStart.setGain(diff);
    playerClick.setGain(diff);
}
