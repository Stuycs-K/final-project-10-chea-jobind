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
  level = 123;
  menu = new Menu(level);
}

void draw() {
  lawn.display();
  menu.display();
}

void mouseClicked() {
  menu.processClick(lawn);
}
