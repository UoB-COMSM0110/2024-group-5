class ToturialPanel{
  PImage image = loadImage("story.png");
  String[] story = {"this is our story","my story"};
  int currentLineIndex = 0;
  int currentCharacterIndex = 0;
  public void createPanel(){
    imageMode(CORNER);
    image(image,0,0,width,height);
    textSize(32);
    textAlign(LEFT, TOP);
    for (int i = 0; i <= currentLineIndex; i++) {
     String line = story[i];
    if (i < currentLineIndex) {
      text(line, 20, 20 + i * 40);
    } else {
      String subString = line.substring(0, currentCharacterIndex);
      text(subString, 20, 20 + i * 40);
    }
  }
  
    if (currentLineIndex < story.length) {
      String currentLine = story[currentLineIndex];
      if (currentCharacterIndex < currentLine.length()) {
        currentCharacterIndex++;
      } else {
        currentLineIndex++;
        currentCharacterIndex = 0;
      }
    }
  }  
}
