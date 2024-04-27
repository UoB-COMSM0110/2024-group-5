void keyPressed(){
  gameLevel1.keysInUse.add(keyCode);
  
//lasor
   if(key=='X'||key=='x'&&gameStatus.curLevel==Level.LEVEL_MAP1 && gameLevel1.scorePanel.goldCount > 0){
       gameLevel1.scorePanel.goldCount--;
       gameLevel1.lazor.isVisiable = true;
   }
   
   //quit and save game
   if(key=='q'||key=='Q'){
     gameStatus.curLevel = Level.LEVEL_BEGIN;
   }
   
   //shield
   if(keyCode == 90 && gameStatus.curLevel==Level.LEVEL_MAP1 && gameLevel1.scorePanel.goldCount > 0){
     gameLevel1.scorePanel.goldCount--;
     gameLevel1.shield.showShield(); 
     if (gameLevel1.scorePanel.goldCount == 0) {
       gameLevel1.shield.closeShield();
     }
   }
   
   //show start animation
   if(key=='r'||key=='R'){
     gameStatus.curLevel = Level.LEVEL_START;
     gameStarted = false;
    textVisible = true;
    starsFormingMiracle = false;
    isAnimationEnd = false;
    Arrays.fill(usedStars,false);
    spaceship.speed = 8;
   }
  
}

void keyReleased() {
   if (gameStatus.curLevel==Level.LEVEL_MAP1) {
     if (keyCode == 90) {
     gameLevel1.shield.closeShield(); 
     }
     gameLevel1.keysInUse.remove(keyCode);
   }
   
}
