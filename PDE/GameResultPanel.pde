class GameResultPanel extends FixedObject{
   public int score;
   public int mineralCount;
   public int diedEnemyCount;     
   public GameResultPanel(){
     image = loadImage("result.png");
   }
   
   public void createPanel(){
      imageMode(CENTER);
      image(image,width/2,height/2,700,700);
      fill(255);
      textSize(50);
      text(gameLevel1.score,437,460);
      text(gameLevel1.scorePanel.goldCount,618,220);
   }
}
