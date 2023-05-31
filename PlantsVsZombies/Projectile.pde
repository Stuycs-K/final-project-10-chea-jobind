public class Projectile {
  PVector position;
  PVector velocity;
  int size;
  int damage;
  private int pColor=#10E331;
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
  public Projectile(PVector pos, PVector vel, int siz, int dmg){
    position = pos;
    velocity = vel;
    size = siz;
    damage = dmg;
    active = true;
    slow = false;
  }
  public void move(){
    position.add(velocity);
  }
  public PVector getPos(){
    return position;
  }
  public PVector getVelocity(){
    return velocity;
  }
  public int getSize(){
    return size;
  }
  public int getDamage(){
    return damage;
  }
  public void setPos(PVector p){
    position=p;
  }
  public void setColor(int c){
    pColor = c;
  }
  public int getColor(){
    return pColor;
  }
}
