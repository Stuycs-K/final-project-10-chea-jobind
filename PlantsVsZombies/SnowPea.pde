public class SnowPea extends ShootingPlant {
  public SnowPea() {
    super(SNOWPEA);
  }
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      Projectile p = new Projectile(new PVector(0, 0), new PVector(450 / FRAMERATE, 0), 25, 1, true);
      p.setColor(color(0,0,150));
      return p;
    } 
    tickCooldown();
    return null;
  }
}
