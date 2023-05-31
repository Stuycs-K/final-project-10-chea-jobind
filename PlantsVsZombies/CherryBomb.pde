public class CherryBomb extends ExplodingPlant {
  public CherryBomb() {
    super(CHERRYBOMB);
  }
  @Override
  public Object tick() {
    if(getCooldown() == 0) {
      resetCooldown();
      return new Projectile(new PVector(0, 0), new PVector(0, 0), radius, damage, false);
    }
    //radius++;
    size++;
    tickCooldown();
    return null;
  }
}
