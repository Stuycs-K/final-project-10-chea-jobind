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


## DAVID JOBIN

### 2023-05-22

Began the abstract class Zombie, with accessor methods and damage management.

### 2023-05-23

Tweaked lawn constructor by abstracting coordinate converting. Added Documentation to the lawn methods.

### 2023-05-24

Wrote Zombie movement code using PVectors.
Zombies can now attack plants when the cooldown is ready.
