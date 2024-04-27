// Defines a special object in the game that gives the player abilities when collected.
public class AbilityBox extends FixedObject implements Serializable {
   
   // Constructor: Sets up the image for the ability box when it is created.
   public AbilityBox() {
     PImage image = loadImage("abilityBox.png");  // Load the image file for the ability box.
     this.setImage(image);  // Set the image for this object.
   }
}
