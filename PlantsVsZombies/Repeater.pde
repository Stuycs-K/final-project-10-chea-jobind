public class Repeater extends ShootingPlant {
  public Repeater() {
    super(REPEATER);
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(450 / FRAMERATE, 0), 25, 2);
    } 
    tickCooldown();
    return null;
  }
}
