void setup() {
  size(1600, 900);
  Zombie john = new TestZombie(100,1,1,1.0,null);
  print(john.getHealth());
  print(john.takeDamage(10));
}
