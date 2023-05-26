Lawn lawn;
Menu menu;
int level;
SunManager sm;

void setup() {
  size(1600, 900);
  /*
  Zombie john = new TestZombie(100,1,1,1.0,null);
  print(john.getHealth());
  print(john.takeDamage(10));
  */
  sm = new SunManager();
  lawn = new Lawn(sm);
  level = 11;
  menu = new Menu(level);
  lawn.display();
  menu.display();
  lawn.spawnZombie(-1);
}

void draw() {
  lawn.processPlants();
  lawn.display();
  lawn.renderZombies();
  lawn.tickZombies();
  sm.add(sm.findSun());
}

void mouseClicked() {
  menu.processClick(lawn);
  menu.update();
}
