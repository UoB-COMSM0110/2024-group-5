import websockets.*;
import java.net.*;

final class Client{
   WebsocketClient wsc;
   public Client(){
     
   }
    
   public void connect(PApplet miracle){
      wsc= new WebsocketClient(miracle, "ws://localhost:8025/john");
   }
   public void send(){
        if(millis()>now+100){
          ProtocolDataFormat protocolDataFormat = new ProtocolDataFormat();
          protocolDataFormat.player = player1;
          protocolDataFormat.ip = ip;
          JSONObject msgFromClient = protocolDataFormat.toJSONObject();
          wsc.sendMessage(msgFromClient.toString());
        }
        now=millis();
   }
   
}

   //This is an event like onMouseClicked. If you chose to use it, it will be executed whenever the server sends a message 
    public void webSocketEvent(String msg){
      synchronized(this){
        println("getMessage from server");
        try{
        String[] msgClients = msg.split(","); 
        String msgFromAnotherClient = "";
        for(String s:msgClients){
          if(ip!=msgToProtocolDataFormat(s).ip){
            msgFromAnotherClient = s;
            break;
          }
        }
        protocolDataFormat = msgToProtocolDataFormat(msgFromAnotherClient);
        player2 = protocolDataFormat.player; 
        }catch(Exception e){
           e.printStackTrace();
        }
      }
    }
    
    ProtocolDataFormat msgToProtocolDataFormat(String msgFromServer){
      JSONUtilizer tool = new JSONUtilizer();
      ProtocolDataFormat protocolDataFormat = new ProtocolDataFormat();
      JSONObject obj = JSONObject.parse(msgFromServer);
      JSONObject player = obj.getJSONObject("player");
      Player player2 = tool.JSONToPlayer(player);
      protocolDataFormat.player = player2;
      return protocolDataFormat;
    }
    
    
