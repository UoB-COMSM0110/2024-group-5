public class SetPanel {
    private final PImage setPanel = loadImage("setting.png");
    private final PImage diffPointer = loadImage("diffPointer.png");
    private final PImage volumePointer = loadImage("volumePointer.png");
    private final PImage volumeUpButton = loadImage("volume_up.png");
    private final PImage volumeDownButton = loadImage("volume_down.png");

    public int volumePointerX = 551;
    public int volumePointerY = 230;
    public int diffPointerX = 545;
    public int diffPointerY = 365;

    public void createPanel() {
        imageMode(CENTER);
        image(setPanel, width / 2, height / 2, 700, 700);
        imageMode(CORNER);
        image(volumePointer, volumePointerX, volumePointerY, 40, 40);
        image(diffPointer, diffPointerX, diffPointerY, 50, 50);

        // Draw volume control buttons
        image(volumeUpButton, volumePointerX + 50, volumePointerY); // Position right of the volume slider
        image(volumeDownButton, volumePointerX - 50 - volumeDownButton.width, volumePointerY); // Position left of the volume slider
    }

    // Method to handle mouse clicks on the volume buttons
    public void checkMouseClick(float mouseX, float mouseY) {
        // Check for volume up button click
        if (mouseX >= volumePointerX + 50 && mouseX <= volumePointerX + 50 + volumeUpButton.width &&
            mouseY >= volumePointerY && mouseY <= volumePointerY + volumeUpButton.height) {
            Bgm.increaseVolume();
        }

        // Check for volume down button click
        if (mouseX >= volumePointerX - 50 - volumeDownButton.width && mouseX <= volumePointerX - 50 &&
            mouseY >= volumePointerY && mouseY <= volumePointerY + volumeDownButton.height) {
            Bgm.decreaseVolume();
        }
    }
}
