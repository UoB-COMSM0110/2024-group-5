class Player implements Serializable{
    public Helicopter helicopter = new Helicopter("helicopter.png",0,width/4,3,15);
    //public Lazor lazor = new Lazor();
    //public ScorePanel scorePanel = new ScorePanel();
    //public AbilityBox[] boxs = new AbilityBox[3];
    public boolean isGameEnd = false;
    
    public JSONObject toJSONObject(){
      JSONObject obj = new JSONObject();
      //JSONObject[] objsAbilityBox=  new JSONObject[3];
      //int i = 0;
      //for(AbilityBox box:boxs){
      //  objsAbilityBox[i] = box.toJSONObject(); 
      //  obj.setJSONObject("box"+i,objsAbilityBox[i]);
      //  i++;
      //}
      obj.setJSONObject("helicopter",helicopter.toJSONObject());
      //obj.setJSONObject("lazor",lazor.toJSONObject());
      //obj.setJSONObject("scorePanel",scorePanel.toJSONObject());
      obj.setBoolean("isGameEnd",isGameEnd);
      return obj;
    }
    
 
}
