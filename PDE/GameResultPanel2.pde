class GameResultPanel2 extends FixedObject{
   public int score1;
   public int score2; 
   public GameResultPanel2(){
     image = loadImage("score_panel2.png");
   }
   
   public void createPanel(){
      imageMode(CENTER);
      image(image,width/2,height/2,700,700);
      fill(255);
      textSize(50);
      
      text(gameLevel2.scorePanel.score+gameLevel2.scorePanel.goldCount*10,475,301);
      text(gameLevel2.scorePanel2.score+gameLevel2.scorePanel2.goldCount*10,475,405);
      String winner = gameLevel2.scorePanel.score+gameLevel2.scorePanel.goldCount*10>gameLevel2.scorePanel2.score+gameLevel2.scorePanel2.goldCount*10?"P1":"P2";
      text(winner,675,502);
   }
}
