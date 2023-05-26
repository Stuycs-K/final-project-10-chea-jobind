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
}

void draw() {
  lawn.processPlants();
  lawn.display();
  sm.add(sm.findSun());
}

void mouseClicked() {
  menu.processClick(lawn);
  lawn.display();
  menu.update();
}
