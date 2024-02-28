public class ButtonImage{
  public final PImage BTN_START;  //start button
  public final PImage BTN_SET;  //set button
  public final PImage BTN_SETTAG;
  public final PImage cursor;
  public final PImage BTN_MAINMENU; 
  public boolean HOVER_BTN_START;
  public boolean HOVER_BTN_SET;
  public ButtonImage(){
    BTN_START = loadImage("btn_start.png");
    BTN_SET = loadImage("btn_set.png");
    cursor = loadImage("cursor.png");
    BTN_SETTAG= loadImage("btn_setIcon.png");
    BTN_MAINMENU = loadImage("mainMenu.png");
    HOVER_BTN_START = false;
    HOVER_BTN_SET = false;
  }
}
