public class PoleZombie extends Zombie{
  static final int COOLDOWN_=40;
  static final float SPEED = 1.2;
  static final color ZCOL = #44E8DB;
  static final int ID = 4;
  private boolean jumped = false;
  public PoleZombie(int h, PImage sprite, PVector pos){
    super(h,COOLDOWN_,SPEED,sprite,pos,ZCOL);
    setID(ID);
  }
  public PoleZombie(int h, PVector pos){
    super(h,COOLDOWN_,SPEED,null,pos,ZCOL);
    setID(ID);
  }
  public PoleZombie(){
    super(0,0,0,null,null, 0);
    setID(ID);
  }
  public int takeDamage(int damage){
    setHealth(getHealth()-damage);
    return getHealth();
  }
  /*
  public void eatPlant(Plant p){
    if(p==null)return;
    if(getCurrentCooldown()==0){
      p.takeDamage();
    }
    //decrement();
  }
  */
  public void move(){
    if(getCurPlant()==null&&!jumped){
    addPos(new PVector(-getSpeed(),0));
    } else{
      addPos(new PVector(TILE,0));
      jumped=true;
      setSpeed(0.5);
    }
  }
}
