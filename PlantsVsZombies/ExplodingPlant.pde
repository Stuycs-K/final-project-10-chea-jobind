public class ExplodingPlant extends Plant {
  int radius;
  int damage;
  public ExplodingPlant(int i) {
    super(i);
    resetCooldown();
    if(i == CHERRYBOMB) {
      damage = 90;
      radius = 225; // 1.5 squares
    } else {
      damage = 90;
      radius = 75;
    }
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(0, 0), radius, damage, false,false);
    }
    tickCooldown();
    return null;
  }
}
