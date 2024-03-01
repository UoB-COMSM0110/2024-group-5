class Star {
  float x;
  float y;
  float speed;
  boolean visible; 
  
  Star() {
    x = random(width);
    y = random(height);
    speed = random(0.1, 0.5);
    visible = true; 
  }
  
  void update() {
    y += speed;
    if (y > height) {
      y = 0;
      x = random(width);
      visible = true; 
    }
  }
  
  void display() {
    if (visible) { 
      noStroke();
      fill(255);
      ellipse(x, y, 2, 2);
    }
  }
  
  void hide() {
    visible = false; 
  }
}

void drawWelcomeText() {
  fill(255);
  textAlign(CENTER, CENTER);
  float textWidth = textWidth(welcomeText);
  float targetWidth = min(textWidth, width);
  float currentWidth = min(frameCount * textExpandSpeed, targetWidth);
  String currentText = welcomeText.substring(0, int(currentWidth / textWidth * welcomeText.length()));
  text(currentText, width/2, height/2 - 50);
}

boolean textFullyExpanded() {
  float textWidth = textWidth(welcomeText);
  float targetWidth = min(textWidth, width);
  float currentWidth = min(frameCount * textExpandSpeed, targetWidth);
  return currentWidth >= targetWidth;
}

void move(int[][] targetMap){
  float spacing = 15;
  float startX = 300+width / 4 - (targetMap[0].length * spacing) / 2;
  float startY = height / 2 - (targetMap.length * spacing) / 2;
   
  for (int i = 0; i < numStars; i++) {
    if (!usedStars[i]) {
      int row = i / targetMap[0].length;
      int col = i % targetMap[0].length;
      if (row < targetMap.length && col < targetMap[0].length && targetMap[row][col] == 1) {
        float targetX = startX + col * spacing;
        float targetY = startY + row * spacing;
        float dx = targetX - stars[i].x;
        float dy = targetY - stars[i].y;
        stars[i].x += dx * 0.05;
        stars[i].y += dy * 0.05;
        usedStars[i] = true;
      }
    }
  }
}

void updateToTarget() {
  int[][] targetMap = {
    {1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1 ,0, 0, 0, 0, 0, 1 ,1, 1, 1},
    {1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1 ,0, 0, 0, 0, 0, 1 ,0, 0, 0},
    {1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1 ,0, 0, 0, 0, 0, 1 ,1, 1, 1},
    {1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1 ,0, 0, 0, 0, 0, 1 ,0, 0, 0},
    {1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1 ,1, 1, 1, 0, 0, 1 ,1, 1, 1},
  };
  
  for (int i = 0; i < numStars; i++) {
    usedStars[i] = false; 
  }
  move(targetMap);

  for (int i = 0; i < numStars; i++) {
    if (!usedStars[i]) {
      stars[i].hide();
    }
  }
}

void drawStartAni(){
  
  if (!starsFormingMiracle) {
    for (int i = 0; i < numStars; i++) {
      stars[i].update();
      stars[i].display();
    }
  } else {
    updateToTarget(); 
    for (int i = 0; i < numStars; i++) {
      stars[i].display();
    }
  }
  
  if (textVisible) {
    textSize(50);
    drawWelcomeText();
  }
  
  if (textFullyExpanded() && !gameStarted) {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(startText, width/2, height/2 + 50);
  }
  
  if (gameStarted) {
    spaceship.update();
    spaceship.display();
  }
}
