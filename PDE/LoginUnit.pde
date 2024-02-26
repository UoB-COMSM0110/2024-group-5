import g4p_controls.*;

class LoginUnit {
  GWindow gWindow ;
  GTextField usernameField, passwordField;
  public LoginUnit(PApplet window) {
      gWindow = GWindow.getWindow(window,"login",width/2,height/2,400,200,JAVA2D);
      usernameField = new GTextField(gWindow, 100, 50, 200, 30);
      usernameField.setPromptText("Username");
      
      passwordField = new GTextField(gWindow, 100, 100, 200, 30);
      passwordField.setPromptText("Your message to another player");
      passwordField.setOpaque(true);
      
      loginButton = new GButton(gWindow, 150, 150, 100, 40,"1");
      loginButton.setText("connect");
      isLogin = false;
  }
}

void handleButtonEvents(GButton button, GEvent event){
  if(button==loginButton&&event == GEvent.CLICKED){
    println("connect");
    loginUnit.gWindow.setVisible(false);
    loginUnit.gWindow.close();
    client.connect(sketch);
    gameStatus.curLevel = Level.LEVEL_LANBATTLE;
  }
}
