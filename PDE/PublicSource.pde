class PublicSource implements Serializable{
    public final GoldCoin[] coins = new GoldCoin[10];
    public final Ufo[] ufos = new Ufo[5];
    
    public JSONObject toJSONObject(){
      JSONObject obj = new JSONObject();
      int i = 0;
      JSONObject[] objsCoins = new JSONObject[10];
      for(GoldCoin coin:coins){
        objsCoins[i] = coin.toJSONObject();
        obj.setJSONObject("coin"+i, objsCoins[i]);
        i++;
      }
      
      i = 0;
      JSONObject[] objsUfos = new JSONObject[10];
      for(Ufo ufo:ufos){
        objsUfos[i] = ufo.toJSONObject();
        obj.setJSONObject("ufo"+i, objsUfos[i]);
        i++;
      }
      return obj;
    }
}
