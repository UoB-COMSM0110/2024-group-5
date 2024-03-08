void mousePressed(){
  if(isMouseInButtonStart()&&gameStatus.curLevel==Level.LEVEL_BEGIN){
    System.out.println("start button is clicked");
    gameStatus.curLevel = level.LEVEL_MAP1;
  }
  
  if(isMouseInButtonSet()&&gameStatus.curLevel==Level.LEVEL_BEGIN){
    System.out.println("set button is clicked");
    gameStatus.curLevel = Level.LEVEL_SET;
  }
  
  //bug 
  if(gameStatus.curLevel==Level.LEVEL_BEGIN){
    if(mouseX>=1020&&mouseX<=1150&&mouseY>=20&&mouseY<=80){
      System.out.println("settag button is clicked");
      gameStatus.curLevel = Level.LEVEL_SET;
    }
    if(isMouseInButtonLAN()){
      gameStatus.curLevel = Level.LEVEL_LOGIN;
      isLogin = true;
    }
  }
  
  if(gameStatus.curLevel==Level.LEVEL_MAP1){
    
  }
  
  if(gameStatus.curLevel==Level.LEVEL_LANBATTLE){
      
  }
  
  
  if(gameStatus.curLevel==Level.LEVEL_SET){
    if(mouseX>=476&&mouseX<=677&&mouseY>=490&&mouseY<=590){
      gameStatus.curLevel = Level.LEVEL_BEGIN;
    }
    if(mouseX>=setPanel.volumePointerX&&mouseX<=setPanel.volumePointerX+40&&mouseY>=setPanel.volumePointerY&&mouseY<=setPanel.volumePointerY+40){

    }
  }
}

boolean isMouseInButtonLAN(){
  return mouseX>=width/2-150 && mouseX<=width/2+150 && mouseY>=height/1.4-75 && mouseY<=height/1.4;
}

boolean isMouseInButtonStart(){
  return mouseX>=width/2-150 && mouseX<=width/2+150 && mouseY>=height/1.4-150 && mouseY<=height/1.4-75;
}

boolean isMouseInButtonSet(){
  return mouseX>=width/2-150 && mouseX<=width/2+200 && mouseY>=height/1.4+75 && mouseY<=height/1.4+150;
}
