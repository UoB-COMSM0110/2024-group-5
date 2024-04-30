void mousePressed(){
  
  if (!gameStarted && textFullyExpanded()&&gameStatus.curLevel == Level.LEVEL_START) {
    gameStarted = true;
    textVisible = false;
    starsFormingMiracle = true; 
  }
  
  if(gameStarted){
     if(!playerStart.isPlaying()){
       playerStart.rewind();
     }
  }
  
  if(isMouseInButtonStart()&&gameStatus.curLevel==Level.LEVEL_BEGIN){
    System.out.println("start button is clicked");
    gameStatus.curLevel = Level.LEVEL_MODECHOOSE;
    return;
  }
  
  if(gameStatus.curLevel==Level.LEVEL_MODECHOOSE){
    //TO DO
    if(mouseX>=213&&mouseX<=473&&mouseY>=152&&mouseY<=559){
      gameStatus.curLevel = Level.LEVEL_MAP1;
      return;
    }
    if(mouseX>=679&&mouseX<=933&&mouseY>=152&&mouseY<=559){
      gameStatus.curLevel = Level.LEVEL_MAP2;
      return;
    }
    if(mouseX>=495&&mouseX<=641&&mouseY>=551&&mouseY<=603){
      gameStatus.curLevel = Level.LEVEL_BEGIN;
      return;
    }
  }
  
  if(isMouseInButtonSet()&&gameStatus.curLevel==Level.LEVEL_BEGIN){
    System.out.println("set button is clicked");
    gameStatus.curLevel = Level.LEVEL_SET;
    return;
  }
  
  //bug 
  if(gameStatus.curLevel==Level.LEVEL_BEGIN){
    if(mouseX>=1020&&mouseX<=1150&&mouseY>=20&&mouseY<=80){
      System.out.println("settag button is clicked");
      gameStatus.curLevel = Level.LEVEL_SET;
      return;
    }
    //if(isMouseInButtonLAN()){
    //  gameStatus.curLevel = Level.LEVEL_LOGIN;
    //  isLogin = true;
    //  return;
    //}
     if(isMouseInButtonStory()){
      gameStatus.curLevel = Level.LEVEL_STORY;
      return;
    }
  }
  
  if(gameStatus.curLevel==Level.LEVEL_END){
     if(mouseX>=458&&mouseX<=700&&mouseY>=521&&mouseY<=566){
       gameStatus.curLevel = Level.LEVEL_BEGIN;
       return;
     }
  }
  
  if(gameStatus.curLevel==Level.LEVEL_MAP1){
    
  }
  
  if(gameStatus.curLevel==Level.LEVEL_STORY){
    if(mouseX>=445&&mouseX<=600&&mouseY>=580&&mouseY<=630){
       gameStatus.curLevel = Level.LEVEL_TOTURIAL;
       return;
     }
  }
  
   if(gameStatus.curLevel==Level.LEVEL_TOTURIAL){
    if(mouseX>=464&&mouseX<=700&&mouseY>=540&&mouseY<=600){
       gameStatus.curLevel = Level.LEVEL_BEGIN;
       return;
     }
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
      return;
    }
  }
  
  if(gameStatus.curLevel==Level.LEVEL_SET){
    if(mouseX>=476&&mouseX<=677&&mouseY>=490&&mouseY<=590){
      gameStatus.curLevel = Level.LEVEL_BEGIN;
      return;
    }
   }
   if(gameStatus.curLevel==Level.LEVEL_END2){
     if(mouseX>=455&&mouseX<=700&&mouseY>=530&&mouseY<=600){
        gameStatus.curLevel = Level.LEVEL_BEGIN;
        return;
     }
   }
   if(gameStatus.curLevel==Level.LEVEL_ROGUE){
     if(mouseX>=220&&mouseX<=420&&mouseY>=170&&mouseY<=490){
        gameStatus.curLevel = Level.LEVEL_MAP1;
        rogue.trigger(rogue.options[0]);
        return;
     }
      if(mouseX>=468&&mouseX<=663&&mouseY>=170&&mouseY<=490){
        gameStatus.curLevel = Level.LEVEL_MAP1;
        rogue.trigger(rogue.options[1]);
        return;
     }
      if(mouseX>=716&&mouseX<=910&&mouseY>=170&&mouseY<=490){
        gameStatus.curLevel = Level.LEVEL_MAP1;
        rogue.trigger(rogue.options[2]);
        return;
     }
   }
   
}

boolean isMouseInButtonLAN(){
  return mouseX>=width/2-150 && mouseX<=width/2+150 && mouseY>=height/1.4-75 && mouseY<=height/1.4;
}

boolean isMouseInButtonStory(){
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
