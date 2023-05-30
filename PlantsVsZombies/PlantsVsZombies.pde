Lawn lawn;
Menu menu;
int level;
SunManager sm;
//ProgressReader r;
public static final int FRAMERATE = 30;

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
  menu.display();
  //lawn.spawnZombie(1);
  //lawn.spawnZombie(3);
  lawn.spawnZombie(4);
}

void draw() {
  //background(100);
  lawn.processPlants();
  lawn.display();
  lawn.renderZombies();
  lawn.tickZombies();
  lawn.tickProjectiles();
  sm.add(sm.findSun());
}

void mouseReleased() {
  menu.processClick(lawn);
  menu.update();
}
