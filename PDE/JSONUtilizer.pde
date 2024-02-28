class JSONUtilizer{
  public Helicopter JSONToHelicopter(JSONObject obj){
    int curX = obj.getInt("curX");
    int curY = obj.getInt("curY");
    int speed = obj.getInt("speed");
    boolean isVisiable = obj.getBoolean("isVisiable");
    Helicopter hp = new Helicopter();
    hp.curX = curX;
    hp.curY = curY;
    hp.speed = speed;
    hp.isVisiable = isVisiable;
    return hp;
  }
  
  public Player JSONToPlayer(JSONObject obj){
    JSONObject helicopter = obj.getJSONObject("helicopter");
    Helicopter hp = JSONToHelicopter(helicopter);
    boolean isGameEnd = obj.getBoolean("isGameEnd");
    Player player = new Player();
    player.isGameEnd = isGameEnd;
    player.helicopter = hp;
    return player;
  }
  
}
