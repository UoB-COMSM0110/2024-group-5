void keyPressed(){
   if(key=='C'||key=='c'&&gameStatus.curLevel==Level.LEVEL_MAP1){
      Helicopter helicopter = gameLevel1.helicopter;
      if(helicopter.curBulletCount>0){
        if(!playerBullet1.isPlaying()){
          playerBullet1.rewind();
          playerBullet1.play();
        }else{
          playerBullet1.pause();
        }
        println("shoot!");
        ArrayList<Bullet> bullets = helicopter.bullets;
        for(int i=bullets.size()-1;i>=0;i--){
          if(!bullets.get(i).isVisiable){
            bullets.get(i).isVisiable = true;
            bullets.get(i).curX = gameLevel1.helicopter.curX;
            bullets.get(i).curY = gameLevel1.helicopter.curY;
            break;
          }
        }
        helicopter.shoot();
      }
   }
   
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
   if(key=='X'||key=='x'&&gameStatus.curLevel==Level.LEVEL_MAP1){
     gameLevel1.lazor.isVisiable = true;
   }
   if(key=='q'||key=='Q'){
     gameStatus.curLevel = Level.LEVEL_BEGIN;
   }
}
