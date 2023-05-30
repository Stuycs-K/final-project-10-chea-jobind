public class PotatoMine extends ExplodingPlant {
  private boolean armed;
  public PotatoMine() {
    super(POTATOMINE);
    armed = false;
  }
  public Object tick() {
    println(getCooldown());
    if(getCooldown() != 0) {
      tickCooldown();
    }
    return null;
  }
}
