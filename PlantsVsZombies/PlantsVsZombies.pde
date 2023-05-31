import java.util.Arrays;

Lawn lawn;
Menu menu;
int level;
SunManager sm;
//ProgressReader r;
public static final int FRAMERATE = 30;
PImage[] plantImages = new PImage[9];

void setup() {
  size(1600, 900);
  frameRate(FRAMERATE);
  /*
  Zombie john = new TestZombie(100,1,1,1.0,null);
  print(john.getHealth());
  print(john.takeDamage(10));
  */
  level = 11;
  sm = new SunManager();
  //r = new ProgressReader(level);
  lawn = new Lawn(sm /*, r*/);
  menu = new Menu(level);
  lawn.display();
  plantImages[0] = loadImage("noplant.png"); 
  plantImages[1] = loadImage("peashooter.png");
  plantImages[2] = loadImage("sunflower.png");
  plantImages[3] = loadImage("cherrybomb.png"); 
  plantImages[4] = loadImage("wallnut.png"); 
  plantImages[5] = loadImage("potatomine.png");
  plantImages[6] = loadImage("snowpea.png"); 
  plantImages[7] = loadImage("chomper.png");
  plantImages[8] = loadImage("repeater.png");
  menu.display();
  //lawn.spawnZombie(1);
  //lawn.spawnZombie(2);
  //lawn.spawnZombie(3);
  //lawn.spawnZombie(4);
}

void draw() {
  //background(100);
  int zSeed = 1+(int)random(8*24);
  if(zSeed-4<=0){
    lawn.spawnZombie(zSeed);
  }
  lawn.processPlants();
  lawn.display();
  lawn.renderZombies();
  lawn.tickZombies();
  lawn.tickProjectiles();
  lawn.renderProjectiles();
  sm.add(sm.findSun());
  //println(Arrays.toString(lawn.laneZombies));
}

void mouseReleased() {
  menu.processClick(lawn);
  menu.update();
}
