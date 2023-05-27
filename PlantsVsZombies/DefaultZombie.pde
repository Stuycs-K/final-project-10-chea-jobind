public class DefaultZombie extends Zombie{
  static final int COOLDOWN_=20;
  static final float SPEED = 1;
  static final color ZCOL = #969696;
  static final int ID = 1;
  public DefaultZombie(int h, PImage sprite, PVector pos){
    super(h,COOLDOWN_,SPEED,sprite,pos,ZCOL);
    setID(ID);
  }
  public DefaultZombie(int h, PVector pos){
    super(h,COOLDOWN_,SPEED,null,pos,ZCOL);
    setID(ID);
  }
  public DefaultZombie(){
    super(0,0,0,null,null, 0);
    setID(ID);
  }
  public int takeDamage(int damage){
    setHealth(getHealth()-damage);
    return getHealth();
  }
  public void eatPlant(Plant p){
    if(p==null)return;
    if(getCurrentCooldown()==0){
      p.takeDamage();
    }
    //decrement();
  }
  public void move(){
    addPos(new PVector(-getSpeed(),0));
  }
}
