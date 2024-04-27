void mousePressed() {
    if (isMouseInButtonStart() && gameStatus.curLevel == Level.LEVEL_BEGIN) {
        System.out.println("start button is clicked");
        gameStatus.curLevel = level.LEVEL_MAP1;
    }

    if (isMouseInButtonSet() && gameStatus.curLevel == Level.LEVEL_BEGIN) {
        System.out.println("set button is clicked");
        gameStatus.curLevel = Level.LEVEL_SET;
    }

    // Check for clicks when the game status is at the LEVEL_SET
    if (gameStatus.curLevel == Level.LEVEL_SET) {
        setPanel.checkMouseClick(mouseX, mouseY);  // This checks for volume button clicks
    }

    // Bug handling for setting button
    if (gameStatus.curLevel == Level.LEVEL_BEGIN) {
        if (mouseX >= 1020 && mouseX <= 1150 && mouseY >= 20 && mouseY <= 80) {
            System.out.println("settag button is clicked");
            gameStatus.curLevel = Level.LEVEL_SET;
        }
        if (isMouseInButtonLAN()) {
            gameStatus.curLevel = Level.LEVEL_LOGIN;
            isLogin = true;
        }
    }

    if (gameStatus.curLevel == Level.LEVEL_MAP1) {
        // Potential place for future functionality or extensions
    }

    if (gameStatus.curLevel == Level.LEVEL_LANBATTLE) {
        // Handling LAN battle interactions
    }

    // Additional checks can be placed here if more buttons or interactions are added
}

boolean isMouseInButtonLAN() {
    return mouseX >= width / 2 - 150 && mouseX <= width / 2 + 150 && mouseY >= height / 1.4 - 75 && mouseY <= height / 1.4;
}

boolean isMouseInButtonStart() {
    return mouseX >= width / 2 - 150 && mouseX <= width / 2 + 150 && mouseY >= height / 1.4 - 150 && mouseY <= height / 1.4 - 75;
}

boolean isMouseInButtonSet() {
    return mouseX >= width / 2 - 150 && mouseX <= width / 2 + 200 && mouseY >= height / 1.4 + 75 && mouseY <= height / 1.4 + 150;
}
