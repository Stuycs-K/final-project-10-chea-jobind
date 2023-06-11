public static int[] plantHealths = {-1, 6, 6, 99999, 72, 6, 6, 6, 6};
public static int[] plantCooldowns = {-1, int(2.5 * FRAMERATE), 18 * FRAMERATE, 1 * FRAMERATE, 9999, 15 * FRAMERATE, int(2.5 * FRAMERATE), 42 * FRAMERATE, int(2.5 * FRAMERATE)};
public static int[] plantCosts = {0, 100, 50, 150, 50, 25, 175, 150, 200};
public static int[] plantColors = {0,#93F787,#E38509,#FC0D3D,#504117,#B2B1B0,#1EE5E4,#A40FCE,#125A15};
//public static float[] costCooldowns /*IN SECONDS*/ = {0,7.5,7.5,50,30,30,7.5,7.5,7.5};

public abstract class Plant {
  int size = 75;
  private int health;
  private int id;
  private int cooldown;
  //float costCooldown;
  //float curCostCooldown;
  public Plant(int i) {
    health = plantHealths[i];
    id = i;
    cooldown = plantCooldowns[i] / 2;
    //costCooldown = costCooldowns[i];
    //curCostCooldown = 0;
  }
  public void takeDamage() {
    --health;
    if(health < 0) {
      health = 0;
    }
  }
  public int getHealth() {
    return health;
  }
  public int getCooldown() {
    return cooldown;
  }
  public int tickCooldown() {
    if(cooldown > 0) {
      return --cooldown;
    }
    //curCostCooldown -= 1/FRAMERATE;
    return 0;
  }
  public int getID() {
    return id;
  }
  public void resetCooldown() {
    cooldown = plantCooldowns[id];
  }
  public Object tick() {
    return null;
  }
  public void skipCooldown() {
    cooldown = 0;
  }
}
