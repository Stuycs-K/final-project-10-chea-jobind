public static int[] plantHealths = {-1, 6, 6, 999, 72, 6, 6, 6, 6};
public static int[] plantCooldowns = {-1, 90, 1440, 60, 9999, 900, 90, 2520, 90};

public abstract class Plant {
  private int health;
  private int id;
  private int cooldown;
  public Plant(int i) {
    health = plantHealths[i];
    id = i;
    cooldown = plantCooldowns[i];
  }
  void takeDamage() {
    --health;
  }
  public int getHealth() {
    return health;
  }
  public int getCooldown() {
    return cooldown;
  }
  public int tickCooldown() {
    return --cooldown;
  }
}
