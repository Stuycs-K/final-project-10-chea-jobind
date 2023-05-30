public class ShootingPlant extends Plant {
  public ShootingPlant(int i) {
    super(i);
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(450 / FRAMERATE, 0), 50, 1, false);
    } 
    tickCooldown();
    return null;
  }
}
