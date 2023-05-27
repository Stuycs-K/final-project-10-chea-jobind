public abstract class Zombie {
  public Plant currentPlant;
  private int health;
  //private int damage;
  private int cooldown;
  private int currentCooldown;
  private float speed;
  private PImage sprite;
  private int ID;
  private PVector position;
  private color zCol;
  
  public Zombie(int health_, /*int damage_,*/ int cooldown_, float speed_, PImage sprite_, PVector position_, color zCol_){
    health=health_;
    //damage=damage_;
    cooldown=cooldown_;
    currentCooldown = cooldown_;
    speed=speed_;
    sprite=sprite_;
    position = position_;
    currentPlant=null;
    zCol=zCol_;
  }
  //methods every
  public abstract int takeDamage(int damage);
  public abstract void eatPlant(Plant p);
  public abstract void move();
  
  public int getHealth(){
    return health;
  }
  /*
  public int getDamage(){
    return damage;
  }
  */
  public int getCooldown(){
    return cooldown;
  }
  public int getCurrentCooldown(){
    return currentCooldown;
  }
  public int getID(){
    return ID;
  }
  public float getSpeed(){
    return speed;
  }
  public PImage getSprite(){
    return sprite;
  }
  public PVector getPos(){
    return position;
  }
  public color getColor(){
    return zCol;
  }
  public void setPos(PVector p){
    position = p;
  }
  public void addPos(PVector p){
    position.add(p);
  }
  public void setSpeed(float s){
    speed = s;
  }
  public void setHealth(int h){
    health = h;
  }
  public void setID(int i){
    ID=i;
  }
  public void decrement(){
    currentCooldown--;
    if(currentCooldown<0){
      currentCooldown = cooldown;
    }
  }
  public void setCurPlant(Plant p){
    currentPlant = p;
  }
}
