public class Chomper extends ShootingPlant {
  public Chomper() {
    super(CHOMPER);
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(0, 0), 50, 120, false);
    } 
    tickCooldown();
    return null;
  }
}
