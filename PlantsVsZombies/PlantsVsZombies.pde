Lawn lawn;
Menu menu;
int level;

void setup() {
  size(1600, 900);
  /*
  Zombie john = new TestZombie(100,1,1,1.0,null);
  print(john.getHealth());
  print(john.takeDamage(10));
  */
  lawn = new Lawn();
  level = 11;
  menu = new Menu(level);
  lawn.display();
  menu.display();
  lawn.spawnZombie(-1);
}

void draw() {
  lawn.renderZombies();
}

void mouseClicked() {
  menu.processClick(lawn);
  menu.display();
}
