public class ProducingPlant extends Plant {
  private int sunAmount;
  public ProducingPlant(int i) {
    super(i);
    if(i == SUNFLOWER) {
      sunAmount = 25;
    }
    if(i == WALLNUT) {
      sunAmount = 0;
    }
  }
  public Object tick() {
    if(getCooldown() == 0 && sunAmount > 0) {
      resetCooldown();
      return new Sun(new PVector(0, 0), sunAmount, false);
    }
    tickCooldown();
    return null;
  }
}
