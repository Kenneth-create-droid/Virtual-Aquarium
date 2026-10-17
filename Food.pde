
/*
 * Food Class
 *
 * Represents a food particle dropped
 * into the aquarium by a mouse click.
 */

class Food {

  float x;
  float y;

  float size = 12;
  float fallSpeed = 1;

  // Constructor
  Food(float startX, float startY) {
    x = startX;
    y = startY;
  }

  // Move food downward
  void move() {

    y += fallSpeed;

    // Stop at the bottom of the aquarium
    if (y > height - size / 2) {
      y = height - size / 2;
    }
  }

  // Draw orange food particle
  void display() {

    noStroke();
    fill(255, 140, 0);
    ellipse(x, y, size, size);
  }
}
