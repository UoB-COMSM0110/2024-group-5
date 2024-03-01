void mousePressed(){
  if (!gameStarted && textFullyExpanded()&&gameStatus.curLevel == Level.LEVEL_START) {
    gameStarted = true;
    textVisible = false; // 点击鼠标后隐藏文本
    starsFormingMiracle = true; // 开始星星形成 miracle 文本的动画
  }
  
  if(isMouseInButtonStart()&&gameStatus.curLevel==Level.LEVEL_BEGIN){
    System.out.println("start button is clicked");
    gameStatus.curLevel = Level.LEVEL_MAP1;
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
  
  if(gameStatus.curLevel==Level.LEVEL_END){
     if(mouseX>=458&&mouseX<=700&&mouseY>=521&&mouseY<=566){
       gameStatus.curLevel = Level.LEVEL_BEGIN;
     }
  }
  
  if(gameStatus.curLevel==Level.LEVEL_MAP1){
    
  }
  
  if(gameStatus.curLevel==Level.LEVEL_LANBATTLE){
      
  }
  
  if(gameStatus.curLevel==Level.LEVEL_BEGIN&&isMouseInButtonToturial()){
    gameStatus.curLevel = Level.LEVEL_RANK;
       System.out.println("rank button is clicked");
  }
  if(gameStatus.curLevel==Level.LEVEL_RANK){
    if(mouseX>=425&&mouseX<=732&&mouseY>=525&&mouseY<=578){
      gameStatus.curLevel = Level.LEVEL_BEGIN;
    }
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

boolean isMouseInButtonToturial(){
  return mouseX>=width/2-150 && mouseX<=width/2+200 && mouseY>=height/1.4 && mouseY<=height/1.4+75;
}
