public class ExplodingPlant extends Plant {
  private int radius;
  private int damage;
  public ExplodingPlant(int i) {
    super(CHERRYBOMB);
    damage = 90;
    radius = 225; // 1.5 squares
  }
  public Projectile explode() {
    return new Projectile(new PVector(0, 0), new PVector(0, 0), radius * 2, damage, 0);
  }
}
