public class TestZombie extends Zombie{
  static final int COOLDOWN_=20;
  public TestZombie(int h,float s, PImage sprite, PVector pos){
    super(h,COOLDOWN_,s,sprite,pos,color(150,150,150));
    setID(-1);
  }
  public TestZombie(){
    super(0,0,0.0,null,null,0);
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
