public class PotatoMine extends ExplodingPlant {
  public PotatoMine() {
    super(POTATOMINE);
  }
  public Object tick() {
    //println(getCooldown());
    if(getCooldown() != 0) {
      tickCooldown();
    } else if(getHealth() < 6 * FRAMERATE) {
      return new Projectile(new PVector(0, 0), new PVector(0, 0), radius, damage, false,false);
    }
    return null;
  }
}
