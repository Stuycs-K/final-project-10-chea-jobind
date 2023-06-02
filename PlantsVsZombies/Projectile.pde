public class Projectile {
  PVector position;
  PVector velocity;
  int size;
  int damage;
  private int pColor=#10E331;
  boolean active;
  boolean slow;
  boolean persistent;
  public Projectile(PVector pos, PVector vel, int siz, int dmg, boolean slo, boolean persistent_) {
    position = pos;
    velocity = vel;
    size = siz;
    damage = dmg;
    active = true;
    slow = slo;
    persistent=persistent_;
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
  public void setVelocity(PVector v){
    velocity=v;
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
