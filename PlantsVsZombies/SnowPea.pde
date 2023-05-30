public class SnowPea extends ShootingPlant {
  public SnowPea() {
    super(SNOWPEA);
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(450 / FRAMERATE, 0), 50, 1, true);
    } 
    tickCooldown();
    return null;
  }
}
