class ProtocolDataFormat implements Serializable{
  public Player player;
  //public PublicSource publicSource;
  public String ip;
  public void setData(Player player, PublicSource publicSource, String ip){
    this.player = player;
    //this.publicSource = publicSource;
    this.ip = ip;
  }
  public JSONObject toJSONObject(){
    JSONObject obj = new JSONObject();
    obj.setJSONObject("player",player.toJSONObject());
    //obj.setJSONObject("publicSource",publicSource.toJSONObject());
    obj.setString("ip",ip);
    return obj;
  }
}
