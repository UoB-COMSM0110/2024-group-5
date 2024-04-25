class ModeChoosePanel{
  public PImage playMode;
  public ModeChoosePanel(){
     playMode = loadImage("playMode.png");
   }
   
   public void createPanel(){
      imageMode(CORNER);
      image(playMode,0,0,width,height);
      fill(255);
   }

}
