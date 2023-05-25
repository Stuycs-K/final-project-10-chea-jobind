public class ShootingPlant extends Plant {
  public ShootingPlant(int i) {
    super(i);
  }
  public Projectile shoot() {
    return new Projectile(new PVector(0, 0), new PVector(7.5, 0), 50, 1, 0);
  }
}
