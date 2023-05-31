public class BucketZombie extends Zombie{
  static final int COOLDOWN_=25;
  static final float SPEED = 0.5;
  static final color ZCOL = #CECECE;
  static final int ID = 3;
  public BucketZombie(int h, PImage sprite, PVector pos){
    super(h,COOLDOWN_,SPEED,sprite,pos,ZCOL);
    setID(ID);
  }
  public BucketZombie(int h, PVector pos){
    super(h,COOLDOWN_,SPEED,null,pos,ZCOL);
    setID(ID);
  }
  public BucketZombie(){
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
}
