# Work Log

## ANDREW CHE

### 2023-05-22

I started working on the menu in class, and finished it at home.
I also made a display function for the lawn and menu and put it in the driver's draw function so I can see everything works so far.

### 2023-05-23

I made the remove button turn the squares blank.
I shifted the buttons over to make space for the sun counter.
I turned some magic numbers into variables.
I added basic sprite drawing and optimized the driver so it doesn't draw every tick.

### 2023-05-24

Created 2 of the 3 plant subclasses and changed the lawn grid to Plant instead of int.
I then had to change plant placing and processing to make sure an empty space (null) doesn't cause problems.

### 2023-05-25

I made the ProducingPlant class and of course the Sun class to go with it.
I also came up with a SunManager class (not on UML) to manage everything sun-related instead of the Lawn having to do it.
I made shoot, explode, and produce into a single abstract Plant method called tick. This is because grid is a Plant array, so I need to have a method that all Plants have to proccess the array properly.
Speaking of which, I added a processPlants function in Lawn which makes every plant spawn a projectile, sun, etc.
Lastly, I reorganized the main/driver program to draw lawns each tick in order to stop suns drawing over each other. However, this increases CPU demand significantly. I can't think of a better solution.

### 2023-05-26

I made a manual framerate setting and adjusted plant cooldowns based on that variable.
I also made plants display as circles instead of images to improve performance.
David and I made the plants die when a zombie stops in front of them and deal enough damage.

### 2023-05-27

I fixed a bug where clicking while moving the mouse would not place a plant.
I also made the suns produced by sunflowers accurate (not moving and 25 instead of 50).

### 2023-05-29

I made SunManager spawn the sun that falls every 10 seconds without sunflowers during the day.
I also cleaned up some code and fixed some minor bugs like framerate not being set properly.

### 2023-05-30

I made all the plant classes, adding special tick functions where necessary.
I then changed the parent classes (e.g. ShootingPlant) to adjust for these new subclasses.
I also made the sun currency system fully work and increased starting sun to 500 for testing.
I made natural suns spawn slightly lower and Lawn.display draw beige rectangles on the sides to cover up the sprites that spill over.

### 2023-05-31

I moved image loading to main, made it more efficient in menu and lawn, and changed Chomper processing.

### 2023-06-01

I added a game over system and level progression (not game-accurate).
I also added zombie sprites and zombie displaying, including special handling of PoleZombie and zombies with hats.
I also made plants spawn with half their normal cooldown except chomper which spawns with 0 cooldown.

### 2023-06-06

I made a new zombie spawning system similar to the original game with waves and a grace period at the start.

### 2023-06-07

I added the shovel and lawnmower sprites and loaded them in the game.
I also fixed potatomine to actually explode and kill all zombies in radius instead of just deleting the zombie that triggers it.
I improved the game over screen and fixed things drawing over it.

### 2023-06-09

I made zombie spawning slightly more balanced by scaling zombie frequency based on the level.
I also gave more sun on round 1 since sunflowers aren't available and displayed plant costs on their buttons.



## DAVID JOBIN

### 2023-05-22

Began the abstract class Zombie, with accessor methods and damage management.

### 2023-05-23

Tweaked lawn constructor by abstracting coordinate converting. Added Documentation to the lawn methods.

### 2023-05-24

Wrote Zombie position code using PVectors.
Zombies can now attack plants when the cooldown is ready.

### 2023-05-25

Animated Zombie movement

### 2023-05-26

Made Zombies stop and eat when they reach a plant. Attempted to create a file reading system to
pace the spawning of zombies throughout the level. Unfortunately, Processing does not seem to play nicely with scanners.

### 2023-05-27

Coded adjustable eating speeds for different Zombies.
Added Default and Cone zombies, with different colors and health.
Added Pole vaulting and Bucket head zombies.
Pole vaulters now have their appropriate movement phases.
Reworked how zombies stop to eat plants.

### 2023-05-30

Added projectile movement.
Projectiles collide with zombies and are removed from the lawn.
Added projectile rendering.
Tweaked shooting speed and zombie health.
Bugfixes on zombie & projectile collision.

### 2023-05-31

Tweaked zombie eating speed.
Added distinct plant colors. Changed stroke to black.
Tweaked shooting speed (again).
Fixed Explosives not dealing collateral damage.
Made shooting plants wait until a zombie is in their lane to shoot,
which should keep the game from lagging (n^2 behavior).
Added different colors for different projectiles.
Cherry bomb now grows bigger before exploding.
Zombies now spawn randomly on their own.
Snow pea slows zombies and makes them blue until thawed (time-based).

### 2023-06-01

Added lawnmowers

### 2023-06-05

Added basic level selecting screen.

### 2023-06-07

Added plant buying cooldowns so the player can't
spam plants, even when he/she has enough sun.
Added a visual aid to indicate when a plant's purchase
cooldown has finished.
