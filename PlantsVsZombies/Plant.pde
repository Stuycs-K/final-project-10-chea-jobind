public static int[] plantHealths = {-1, 6, 6, 999, 72, 6, 6, 6, 6};

public abstract class Plant {
  private int health;
  private int id;
  void takeDamage() {
    --health;
  }
  int getHealth() {
    return health;
  }
}
