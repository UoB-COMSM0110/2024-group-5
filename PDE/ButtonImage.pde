public class ButtonImage{
  public final PImage BTN_START;  //start button
  public final PImage BTN_SET;  //set button
  public final PImage BTN_SETTAG;
  public final PImage cursor;
  public final PImage BTN_MAINMENU; 
  public boolean HOVER_BTN_START;
  public boolean HOVER_BTN_SET;
  
  private int hotspotX = -10;
  private int hotspotY = -10;
  
  public ButtonImage(){
    BTN_START = loadImage("btn_start.png");
    BTN_SET = loadImage("btn_set.png");
    cursor = loadImage("2edit_crop.png");
    BTN_SETTAG= loadImage("btn_setIcon.png");
    BTN_MAINMENU = loadImage("mainMenu.png");
    HOVER_BTN_START = false;
    HOVER_BTN_SET = false;
  }
  
  public void drawCursor(int mouseX, int mouseY){
    image(cursor, mouseX - hotspotX, mouseY - hotspotY);
  }
}
