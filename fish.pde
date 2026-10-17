
/*
 * Fish Class
 *
 * Each fish has:
 * - Position and swimming velocity
 * - Random size and colour
 * - Random wandering behaviour
 * - Wall avoidance
 * - Food chasing and eating
 * - Predator avoidance
 * - Energy-dependent movement
 */

class Fish {

  // Position
  float x;
  float y;

  // Movement velocity
  float speedX;
  float speedY;

  // Appearance
  float fishSize;
  color fishColor;

  // Energy level (0 to 100)
  float energy;

  // Last horizontal facing direction
  int facingDirection = 1;

  // Constructor
  Fish(float startX, float startY) {

    x = startX;
    y = startY;

    // Random initial movement
    speedX = random(-2, 2);
    speedY = random(-1, 1);

    // Random appearance
    fishSize = random(25, 50);

    fishColor = color(
      random(100, 255),
      random(100, 255),
      random(100, 255)
    );

    // Start with full energy
    energy = 100;
  }

  // Randomly adjust swimming direction
  void wander() {

    // Small random steering changes
    speedX += random(-0.05, 0.05);
    speedY += random(-0.05, 0.05);

    // Prevent excessive swimming speed
    speedX = constrain(speedX, -2, 2);
    speedY = constrain(speedY, -2, 2);
  }

  // Update position and energy
  void move() {

    // Gradually lose energy
    energy -= 0.01;
    energy = constrain(energy, 0, 100);

    // Tired fish swim more slowly
    float movementFactor = map(
      energy, 0, 100, 0.3, 1.0
    );

    x += speedX * movementFactor;
    y += speedY * movementFactor;

    // Wall avoidance
    if (x < fishSize || x > width - fishSize) {
      speedX *= -1;
      x = constrain(x, fishSize, width - fishSize);
    }

    if (y < fishSize || y > height - fishSize) {
      speedY *= -1;
      y = constrain(y, fishSize, height - fishSize);
    }

    // Update fish facing direction
    if (speedX > 0.1) {
      facingDirection = 1;
    } else if (speedX < -0.1) {
      facingDirection = -1;
    }
  }

  // Find and chase nearest food
  void chaseFood(ArrayList<Food> foodList) {

    Food nearestFood = null;
    float closestDistance = Float.MAX_VALUE;

    // Search for nearest food
    for (Food food : foodList) {

      float distance = dist(x, y, food.x, food.y);

      if (distance < closestDistance) {
        closestDistance = distance;
        nearestFood = food;
      }
    }

    // Eat food when close enough
    if (nearestFood != null &&
        closestDistance < fishSize / 2 + 4) {

      foodList.remove(nearestFood);

      // Restore energy
      energy += 25;
      energy = constrain(energy, 0, 100);

      return;
    }

    // Chase food within 200 pixels
    if (nearestFood != null &&
        closestDistance < 200) {

      float directionX = nearestFood.x - x;
      float directionY = nearestFood.y - y;

      float magnitude = sqrt(
        directionX * directionX +
        directionY * directionY
      );

      if (magnitude > 0) {

        directionX /= magnitude;
        directionY /= magnitude;

        // Smoothly steer toward food
        speedX = lerp(speedX, directionX * 2, 0.05);
        speedY = lerp(speedY, directionY * 2, 0.05);
      }
    }
  }

  // Swim away from mouse cursor
  void avoidPredator() {

    float distance = dist(x, y, mouseX, mouseY);

    if (distance < 100) {

      float directionX = x - mouseX;
      float directionY = y - mouseY;

      float magnitude = sqrt(
        directionX * directionX +
        directionY * directionY
      );

      if (magnitude > 0) {

        directionX /= magnitude;
        directionY /= magnitude;

        // Quickly steer away from predator
        speedX = lerp(speedX, directionX * 4, 0.15);
        speedY = lerp(speedY, directionY * 4, 0.15);
      }
    }
  }

  // Draw fish and energy bar
  void display() {

    pushMatrix();

    // Move drawing origin to fish position
    translate(x, y);

    // Flip fish when swimming left
    scale(facingDirection, 1);

    noStroke();
    fill(fishColor);

    // Fish body
    ellipse(0, 0, fishSize, fishSize / 2);

    // Fish tail
    triangle(
      -fishSize / 2, 0,
      -fishSize, -fishSize / 4,
      -fishSize, fishSize / 4
    );

    // Fish eye
    fill(0);
    ellipse(
      fishSize / 3,
      -fishSize / 6,
      5,
      5
    );

    popMatrix();

    // Energy bar dimensions
    float barWidth = fishSize;
    float barHeight = 5;

    float barX = x - barWidth / 2;
    float barY = y - fishSize / 2 - 15;

    // Energy bar background
    noStroke();
    fill(60);
    rect(barX, barY, barWidth, barHeight);

    // Energy bar colour
    if (energy > 60) {
      fill(0, 255, 0);
    } else if (energy > 30) {
      fill(255, 200, 0);
    } else {
      fill(255, 50, 50);
    }

    // Energy bar fill
    float currentWidth = map(
      energy, 0, 100, 0, barWidth
    );

    rect(barX, barY, currentWidth, barHeight);
  }
}
