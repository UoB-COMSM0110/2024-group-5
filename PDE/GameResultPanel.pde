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
   }
}
