void keyPressed() {
    // Prevent any key interaction until the main menu is reached or the game is in the ROGUE level
    if (gameStatus.curLevel == Level.LEVEL_START || gameStatus.curLevel == Level.LEVEL_ROGUE) {
        return;
    }

if (key == 'P' || key == 'p') {
    if (gameStatus.curLevel == Level.LEVEL_MAP1) {  
        gameLevel1.gamePaused = !gameLevel1.gamePaused;
        gameLevel1.showPauseScreen = gameLevel1.gamePaused; // Show or hide the pause screen based on the paused state
    }
}

    if (gameStatus.curLevel == Level.LEVEL_MAP1) {
        gameLevel1.keysInUse.add(keyCode);

        // Toggle between starting and resuming the game with space bar
        if (keyCode == 32) { // 32 is the ASCII code for space
            if (!gameLevel1.gameStarted) {
                gameLevel1.gameStarted = true;
                if (!playerLevelMap1.isPlaying()) {
                    playerLevelMap1.play();
                    playerLevelMap1.loop();
                }
            } else if (gameLevel1.gamePaused) {
                gameLevel1.gamePaused = false; // Resuming the game
                gameLevel1.showPauseScreen = false; 
            }
        }
    } else if (gameStatus.curLevel == Level.LEVEL_MAP2) {
        gameLevel2.keysInUse.add(keyCode);

        // Start game with space bar and manage the start image for Level 2
        if (keyCode == 32) {
            if (!gameLevel2.gameStarted) {
                gameLevel2.gameStarted = true;
                gameLevel2.showStartImage = false;
                if (!playerLevelMap1.isPlaying()) {
                    playerLevelMap1.play();
                    playerLevelMap1.loop();
                }
            }
        }
    }

    // Other controls
    if ((key == 'X' || key == 'x') && gameStatus.curLevel == Level.LEVEL_MAP1 && gameLevel1.scorePanel.goldCount > 0) {
        gameLevel1.scorePanel.goldCount--;
        gameLevel1.lazor.isVisiable = true;
    }

    if (key == 'q' || key == 'Q') {
        gameStatus.curLevel = Level.LEVEL_BEGIN;
        playerLevelMap1.pause(); // Stop the music when quitting to main menu
    }

    if (keyCode == 90 && gameStatus.curLevel == Level.LEVEL_MAP1 && gameLevel1.scorePanel.goldCount > 0) {
        gameLevel1.scorePanel.goldCount--;
        gameLevel1.shield.showShield();
        if (gameLevel1.scorePanel.goldCount == 0) {
            gameLevel1.shield.closeShield();
        }
    }

    if (key == 'r' || key == 'R') {
        gameStatus.curLevel = Level.LEVEL_START;
        gameStarted = false;
        textVisible = true;
        starsFormingMiracle = false;
        isAnimationEnd = false;
        Arrays.fill(usedStars, false);
        spaceship.speed = 8;
        playerLevelMap1.pause(); // Ensure music stops on reset
    }
}

void keyReleased() {
    if (gameStatus.curLevel == Level.LEVEL_MAP1) {
        gameLevel1.keysInUse.remove(keyCode);
        if (keyCode == 90) {
            gameLevel1.shield.closeShield();
        }
    } else if (gameStatus.curLevel == Level.LEVEL_MAP2) {
        gameLevel2.keysInUse.remove(keyCode);
    }
}
