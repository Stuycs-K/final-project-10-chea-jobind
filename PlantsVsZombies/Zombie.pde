public abstract class Zombie {
  private int health;
  private int damage;
  private int cooldown;
  private double speed;
  private PImage sprite;
  private int ID;
  public Zombie(int health_, int damage_, int cooldown_, double speed_, PImage sprite_){
    health=health_;
    damage=damage_;
    cooldown=cooldown_;
    speed=speed_;
    sprite=sprite_;
  }
  public abstract int takeDamage(int damage);
  public abstract void eatPlant(Plant p);
  public int getHealth(){
    return health;
  }
  public int getDamage(){
    return damage;
  }
  public int getCoolDown(){
    return cooldown;
  }
  public int getID(){
    return ID;
  }
  public double getSpeed(){
    return speed;
  }
  public PImage getSprite(){
    return sprite;
  }
  public void setHealth(int h){
    health = h;
  }
  public void setID(int i){
    ID=i;
  }
}
