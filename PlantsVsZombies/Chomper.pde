public class Chomper extends ShootingPlant {
  public Chomper() {
    super(CHOMPER);
  }
  public Object tick() {
    if(getCooldown() != 0) {
      tickCooldown();
    }
    return null;
  }
}
