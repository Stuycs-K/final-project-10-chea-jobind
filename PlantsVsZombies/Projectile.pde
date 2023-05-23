public class Projectile {
  PVector position;
  PVector velocity;
  int size;
  int damage;
  boolean active;
  int slow;
  public Projectile(PVector pos, PVector vel, int siz, int dmg, int slo) {
    position = pos;
    velocity = vel;
    size = siz;
    damage = dmg;
    active = true;
    slow = slo;
  }
}
