void keyPressed(){
   //bullet
   //if(key=='C'||key=='c'&&gameStatus.curLevel==Level.LEVEL_MAP1){
   //   Helicopter helicopter = gameLevel1.helicopter;
   //   if(gameLevel1.bulletCount>0){
   //     if(!playerBullet1.isPlaying()){
   //       playerBullet1.rewind();
   //       playerBullet1.play();
   //     }else{
   //       playerBullet1.pause();
   //     }
   //     println("shoot!");
   //     ArrayList<Bullet> bullets = helicopter.bullets;
   //     for(int i=gameLevel1.bulletCount-1;i>=0;i--){
   //       if(!bullets.get(i).isVisiable){
   //         bullets.get(i).isVisiable = true;
   //         bullets.get(i).curX = gameLevel1.helicopter.curX;
   //         bullets.get(i).curY = gameLevel1.helicopter.curY;
   //         break;
   //       }
   //     }
   //     helicopter.shoot();
   //   }
   //   gameLevel1.bulletCount--;
   //}
   
   //missile
    if(key=='d'||key=='D'&&gameStatus.curLevel==Level.LEVEL_MAP1){
      Missile[] missiles = gameLevel1.missiles;
      if(gameLevel1.missileCount>0){
        println("shoot!Missile!");
        for(int i=gameLevel1.missileCount-1;i>=0;i--){
          if(!missiles[i].isVisiable){
            missiles[i].isVisiable = true;
            missiles[i].curX = gameLevel1.helicopter.curX;
            missiles[i].curY = gameLevel1.helicopter.curY;
            break;
          }
        }
      }
   }

//lasor
   if(key=='X'||key=='x'&&gameStatus.curLevel==Level.LEVEL_MAP1){
     if (gameLevel1.scorePanel.goldCount > 0) {
       gameLevel1.scorePanel.goldCount--;
       gameLevel1.lazor.isVisiable = true;
     }
     
   }
   
   //quit and save game
   if(key=='q'||key=='Q'){
     gameStatus.curLevel = Level.LEVEL_BEGIN;
   }
   
   //shield
   if(key=='Z'||key=='z'&&gameStatus.curLevel==Level.LEVEL_MAP1){
     gameLevel1.shield.showShield();
   }
   
   //close shield
   if(key=='S'||key=='s'&&gameStatus.curLevel==Level.LEVEL_MAP1){
     gameLevel1.shield.closeShield();
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
