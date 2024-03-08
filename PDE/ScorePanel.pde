public class ScorePanel extends FixedObject implements Serializable{
   public int score;
   public int goldCount;
   public int time;
      
   public void updateScore(){
     score++;
   }
}
