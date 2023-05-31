public static int[] plantHealths = {-1, 6, 6, 99999, 72, 6, 6, 6, 6};
public static int[] plantCooldowns = {-1, int(3.5 * FRAMERATE), 24 * FRAMERATE, 2 * FRAMERATE, 9999, 15 * FRAMERATE, int(1.5 * FRAMERATE), 42 * FRAMERATE, int(1.5 * FRAMERATE)};
public static int[] plantCosts = {0, 100, 50, 150, 50, 25, 175, 150, 200};

public abstract class Plant {
  private int health;
  private int id;
  private int cooldown;
  public Plant(int i) {
    health = plantHealths[i];
    id = i;
    cooldown = plantCooldowns[i];
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
}
