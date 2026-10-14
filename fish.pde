// ==========================================
// Fish Class
//
// Represents one fish object in the aquarium.
//
// Each fish has:
// - Position
// - Movement speed
// - Size
// - Colour
// - Drawing behaviour
// ==========================================


class Fish {


  // Fish position
  float x;
  float y;



  // Fish movement speed
  float speedX;
  float speedY;



  // Fish appearance
  float fishSize;
  color fishColor;




  // Constructor
  // Runs when a new fish is created
  Fish(float startX, float startY){


    // Set starting position
    x = startX;
    y = startY;



    // Give each fish a random movement speed
    speedX = random(-2,2);
    speedY = random(-1,1);



    // Give each fish a random size
    // Range: small to large fish
    fishSize = random(25,50);



    // Give each fish a random colour
    fishColor = color(
      random(100,255), // red value
      random(100,255), // green value
      random(100,255)  // blue value
    );


  }





  // Updates fish movement
  void move(){


    // Move fish
    x += speedX;
    y += speedY;



    // Wall avoidance

    if(x < 0 || x > width){

      speedX *= -1;

    }



    if(y < 0 || y > height){

      speedY *= -1;

    }


  }






  // Draws the fish
  void display(){



    // Use the fish's assigned colour
    fill(fishColor);



    // Fish body
    ellipse(
      x,
      y,
      fishSize,
      fishSize/2
    );



    // Tail
    triangle(

      x - fishSize/2,
      y,

      x - fishSize,
      y - fishSize/4,

      x - fishSize,
      y + fishSize/4

    );



    // Eye
    fill(0);

    ellipse(

      x + fishSize/3,
      y - fishSize/6,

      5,
      5

    );


  }


}
