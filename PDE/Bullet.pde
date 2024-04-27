class Bullet extends MoveObject {
  
  // Constructor to create a bullet
  public Bullet() {
    // Load the bullet image to display
    image = loadImage("bullet1.png");
    // Set bullet speed
    speed = 20;
  }

  // Method to update the bullet's position
  @Override
  public void move() {
    // Check if the bullet is still within the game window and visible
    if (!isOutOfBound() && isVisiable) {
      // Move the bullet forward by its speed
      curX += speed;
    } else {
      // If the bullet goes off screen or is not visible, reset position
      curX = gameLevel1.helicopter.curX - 1000;
      curY = gameLevel1.helicopter.curY;
      isVisiable = false;
    }
  }
  
  // Method to check if the bullet has gone off the edge of the screen
  @Override
  public boolean isOutOfBound() {
    // Check if bullet's current position plus its length is outside the game width
    if (curX + 75 > width) {
      return true;
    }
    return false;
  }
  
  // Check if the bullet intersects with a UFO
  public boolean isIntersectWithUfo(Ufo ufo) {
    // Multiple checks to cover different angles of intersection between bullet and UFO
    if (ufo.curX >= curX && ufo.curX <= curX + 50 && ufo.curY >= curY && ufo.curY <= curY + 50) {
      return true;
    }
    if (ufo.curX + 100 >= curX && ufo.curX + 100 <= curX + 50 && ufo.curY >= curY && ufo.curY <= curY + 50) {
      return true;
    }
    if (ufo.curX >= curX && ufo.curX <= curX + 50 && ufo.curY + 50 >= curY && ufo.curY + 50 <= curY + 50) {
      return true;
    }
    if (ufo.curX + 50 >= curX && ufo.curX + 50 <= curX + 50 && ufo.curY + 50 >= curY && ufo.curY + 50 <= curY + 50) {
      return true;
    }
    return false;
  }
}
