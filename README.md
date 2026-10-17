# Virtual Aquarium with Fish Behavior

**Course:** Interactive Systems (UI/UX)  
**Developer:** Kenneth Nnah  
**Programming Language:** Java (Processing)  
**Project Type:** Individual Assignment 1

## Project Overview

Virtual Aquarium is an interactive aquarium simulation developed using Processing. The project demonstrates real-time animation, object-oriented programming, user input, and rule-based fish behavior.

The aquarium contains 15 independently moving fish that swim around the environment, avoid walls, search for food, and react to the user's mouse cursor as a predator.

The simulation also includes a day/night mode, animated bubbles, and an energy system that influences fish movement.

## Features

### 1. Fish Movement and Random Wandering
- 15 fish are created at random positions when the simulation starts.
- Each fish has a randomly assigned size, colour, and initial swimming velocity.
- Fish continuously adjust their movement using small random changes.
- Fish reverse direction when reaching the aquarium boundaries.

### 2. Food Interaction
- Clicking anywhere inside the aquarium creates an orange food particle.
- Food particles gradually sink toward the bottom.
- Fish detect and chase nearby food within a 200-pixel radius.
- When a fish reaches a food particle, the particle disappears and the fish gains energy.

### 3. Predator Avoidance
- The mouse cursor acts as a predator.
- Fish detect the cursor within a 100-pixel radius.
- Nearby fish change their swimming direction to move away from the cursor.

### 4. Day/Night Mode
- Users can switch between daytime and nighttime environments by pressing the `N` key.
- Day mode uses a bright blue background.
- Night mode uses a dark blue background.
- Fish animations and interactions continue in both modes.

### 5. Fish Energy System
- Every fish starts with 100 energy points.
- Energy gradually decreases as the simulation runs.
- Lower energy reduces the fish's swimming speed.
- Eating a food particle restores 25 energy points.
- An energy bar above each fish displays its current energy level:
  - Green: High energy (above 60)
  - Yellow: Medium energy (above 30 and up to 60)
  - Red: Low energy (30 or below)

### 6. Animated Aquarium Environment
- Transparent bubbles rise continuously through the aquarium.
- Bubbles reappear at the bottom after reaching the top.
- Fish have different colours and sizes, creating visual variety.

## How to Run

1. Install the Processing IDE from https://processing.org/download.
2. Open the project folder named `VirtualAquarium`.
3. Open `VirtualAquarium.pde` using Processing.
4. Ensure Processing is set to **Java Mode**.
5. Click the **Run** button to start the simulation.
6. Interact with the aquarium using the mouse and keyboard.

No additional libraries are required.

## Controls

| Input | Action |
|---|---|
| Mouse click | Drop food into the aquarium |
| Move mouse cursor | Cause nearby fish to swim away |
| `N` or `n` | Toggle between day and night mode |

## Project Structure

```text
VirtualAquarium/
├── VirtualAquarium.pde
├── fish.pde
├── Food.pde
├── README.md
└── screenshot.png
```

**VirtualAquarium.pde:** Main application file containing the animation loop, aquarium setup, bubble animation, and user input handling.

**fish.pde:** Defines the Fish class, including movement, wandering, food chasing, predator avoidance, and energy behavior.

**Food.pde:** Defines the Food class, including sinking movement and particle rendering.

**README.md:** Project overview, features, controls, and execution instructions.

**screenshot.png:** Example screenshot of the running aquarium (to be added).

## Technical Concepts Demonstrated

- **Object-Oriented Programming:** Separate Fish and Food classes represent individual simulation objects.
- **ArrayLists:** Dynamically store fish and food particles.
- **Animation Loop:** Processing's `draw()` function continuously updates the simulation.
- **Mouse and Keyboard Events:** `mousePressed()` and `keyPressed()` handle user interaction.
- **Rule-Based Behavior:** Fish respond to food, walls, and predator proximity.
- **Randomness:** Random positions, colours, sizes, velocities, and wandering adjustments.
- **Movement Calculations:** Distance calculations, vector normalization, and interpolation (`lerp()`) control fish steering.

## Example Output

The screenshot below shows the Virtual Aquarium running in Processing.

<img width="897" height="595" alt="image" src="https://github.com/user-attachments/assets/abc1725e-e611-4a19-8fdb-36ebaa45bade" />


## Conclusion

The Virtual Aquarium demonstrates how animation, object-oriented programming, and interactive controls can be combined to create a responsive simulation.

The project meets the core requirements of the Virtual Aquarium assignment by implementing multiple independently moving fish, random wandering, wall avoidance, food chasing, and predator avoidance. Additional day/night and energy systems enhance the user experience.
