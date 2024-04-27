// This class manages the images for buttons used throughout the game.
public class ButtonImage {
    // Images for various buttons in the game.
    public final PImage BTN_START;  // Image for the start button.
    public final PImage BTN_SET;    // Image for settings button.
    public final PImage BTN_SETTAG; // Image for setting tag, used perhaps in the main menu.
    public final PImage cursor;     // Custom cursor image for the game.
    public final PImage BTN_MAINMENU; // Image for the main menu button.

    // Hover states to change button appearance on mouse over.
    public boolean HOVER_BTN_START;  // Tracks if the start button is being hovered over.
    public boolean HOVER_BTN_SET;    // Tracks if the settings button is being hovered over.

    // Constructor initializes images and sets initial hover states.
    public ButtonImage() {
        // Load images from the disk. These should be placed in your project's "data" directory.
        BTN_START = loadImage("btn_start.png");
        BTN_SET = loadImage("btn_set.png");
        cursor = loadImage("cursor.png");
        BTN_SETTAG = loadImage("btn_setIcon.png");
        BTN_MAINMENU = loadImage("mainMenu.png");

        // Initially, no button is being hovered over.
        HOVER_BTN_START = false;
        HOVER_BTN_SET = false;
    }
}
