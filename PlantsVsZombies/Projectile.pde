public class Projectile {
  PVector position;
  PVector velocity;
  int size;
  int damage;
  boolean active;
  boolean slow;
  public Projectile(PVector pos, PVector vel, int siz, int dmg, boolean slo) {
    position = pos;
    velocity = vel;
    size = siz;
    damage = dmg;
    active = true;
    slow = slo;
  }
}
