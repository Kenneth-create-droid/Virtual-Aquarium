
/*
 * Virtual Aquarium Simulation
 * Course: Interactive Systems (UI/UX)
 * Developer: Kenneth
 *
 * Features:
 * - 15 independently swimming fish
 * - Random wandering and wall avoidance
 * - Mouse clicks create sinking food
 * - Fish chase and eat nearby food
 * - Fish avoid the mouse cursor
 * - Day/night mode (N key)
 * - Energy bars that affect swimming speed
 * - Animated rising bubbles
 */

ArrayList<Fish> fishList;
ArrayList<Food> foodList;

// Day/night mode
boolean isNight = false;

// Bubble positions
float[] bubbleX = new float[20];
float[] bubbleY = new float[20];
float[] bubbleSpeed = new float[20];

void setup() {
  size(900, 600);
  frameRate(60);

  fishList = new ArrayList<Fish>();
  foodList = new ArrayList<Food>();

  // Create 15 fish at random positions
  for (int i = 0; i < 15; i++) {
    Fish newFish = new Fish(
      random(50, width - 50),
      random(50, height - 50)
    );

    fishList.add(newFish);
  }

  // Initialize bubbles
  for (int i = 0; i < bubbleX.length; i++) {
    bubbleX[i] = random(width);
    bubbleY[i] = random(height);
    bubbleSpeed[i] = random(0.5, 2);
  }
}

void draw() {

  // Aquarium background
  if (isNight) {
    background(5, 20, 50);
  } else {
    background(20, 120, 180);
  }

  // Draw animated bubbles
  drawBubbles();

  // Update food particles
  for (Food food : foodList) {
    food.move();
    food.display();
  }

  // Update fish
  for (Fish fish : fishList) {

    // Random wandering
    fish.wander();

    // Chase nearby food
    fish.chaseFood(foodList);

    // Avoid mouse cursor
    fish.avoidPredator();

    // Move based on energy
    fish.move();

    // Draw fish and energy bar
    fish.display();
  }

  // Display controls and current mode
  fill(255);
  textSize(18);
  textAlign(LEFT);

  if (isNight) {
    text("Night Mode - Press N for Day", 20, 30);
  } else {
    text("Day Mode - Press N for Night", 20, 30);
  }

  textSize(14);
  text("Click to feed fish | Move mouse to scare fish", 20, 52);
}

// Mouse click drops food
void mousePressed() {
  foodList.add(new Food(mouseX, mouseY));
}

// Animate bubbles rising through water
void drawBubbles() {

  noStroke();
  fill(255, 150);

  for (int i = 0; i < bubbleX.length; i++) {

    // Move bubble upward
    bubbleY[i] -= bubbleSpeed[i];

    // Reset bubble when it reaches the top
    if (bubbleY[i] < 0) {
      bubbleY[i] = height;
      bubbleX[i] = random(width);
    }

    ellipse(bubbleX[i], bubbleY[i], 8, 8);
  }
}

// Keyboard controls
void keyPressed() {

  // Toggle day/night mode
  if (key == 'n' || key == 'N') {
    isNight = !isNight;
  }
}
