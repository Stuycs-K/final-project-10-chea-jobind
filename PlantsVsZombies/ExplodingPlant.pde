public class ExplodingPlant extends Plant {
  private int radius;
  private int damage;
  public ExplodingPlant(int i) {
    super(i);
    if(i == CHERRYBOMB) {
      damage = 90;
      radius = 225; // 1.5 squares
    } else {
      damage = 90;
      damage = 75;
    }
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(0, 0), radius * 2, damage, false);
    }
    tickCooldown();
    return null;
  }
}
