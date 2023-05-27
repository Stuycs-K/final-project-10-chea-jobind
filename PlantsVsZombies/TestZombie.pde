static final int COOLDOWN=20;
public class TestZombie extends Zombie{
  public TestZombie(int h,int d,float s, PImage sprite, PVector pos){
    super(h,d,20,s,sprite,pos,color(150,150,150));
    setID(-1);
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
