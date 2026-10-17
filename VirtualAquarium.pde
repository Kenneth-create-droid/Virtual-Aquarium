// ==========================================
// Virtual Aquarium Simulation
//
// Course: Interactive Systems
//
// Description:
// An animated aquarium simulation where
// fish objects move independently using
// object-oriented programming.
//
// Current Features:
// - Multiple fish objects
// - Random swimming behaviour
// - Wall avoidance
// - Animated aquarium environment
//
// Developers:
// Kenneth Nnah (100856333)
// ==========================================
ArrayList<Fish> fishList;



// Runs once when the program starts
void setup() {

  // Create the aquarium window
  size(900, 600);


  // Initialize the ArrayList
  fishList = new ArrayList<Fish>();


  // Create 15 fish objects
  // Each fish starts at a random position
  for(int i = 0; i < 15; i++){

    Fish newFish = new Fish(
      random(width),   // random x position
      random(height)   // random y position
    );


    // Add the fish object to our list
    fishList.add(newFish);

  }

}



// Runs repeatedly (60 frames per second by default)
// This creates the animation loop
void draw() {


  // Draw the water background
  background(20,120,180);



  // Draw decorative bubbles
  drawBubbles();



  // Loop through every fish in the aquarium
  for(Fish fish : fishList){


    // Update fish position
    fish.move();


    // Draw the fish
    fish.display();


  }


}



// Creates bubbles for aquarium appearance
void drawBubbles(){


  // Make bubbles transparent white
  fill(255,150);


  // Create 20 random bubbles
  for(int i = 0; i < 20; i++){


    ellipse(
      random(width),   // x position
      random(height),  // y position
      8,               // bubble width
      8                // bubble height
    );


  }


}
