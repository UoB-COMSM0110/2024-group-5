class ToturialPanel{
  PImage image = loadImage("story.png");
  PImage rank = loadImage("rank.png");
  String[] story = {"this is our story","my story"};
  int currentLineIndex = 0;
  int currentCharacterIndex = 0;
  public void createPanel(){
    imageMode(CORNER);
    image(image,0,0,width,height);
    imageMode(CENTER);
    image(rank,width/2,height/2,900,700);
    fill(255);
    textSize(50);
    
    //read highest score from txt
    var list = gameLevel1.readHighestScoreFromTxt("score.txt");
    for(int i=0;i<list.size();i++){
      text(list.get(i),506,195+i*75);
    }
  //  textSize(32);
  //  textAlign(LEFT, TOP);
  //  for (int i = 0; i <= currentLineIndex; i++) {
  //   String line = story[i];
  //  if (i < currentLineIndex) {
  //    text(line, 20, 20 + i * 40);
  //  } else {
  //    String subString = line.substring(0, currentCharacterIndex);
  //    text(subString, 20, 20 + i * 40);
  //  }
  //}
  
  //  if (currentLineIndex < story.length) {
  //    String currentLine = story[currentLineIndex];
  //    if (currentCharacterIndex < currentLine.length()) {
  //      currentCharacterIndex++;
  //    } else {
  //      currentLineIndex++;
  //      currentCharacterIndex = 0;
  //    }
  //  }
  }  
}
