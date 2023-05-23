public class TestZombie extends Zombie{
  public TestZombie(int h,int d,int c,double s, PImage sprite){
    super(h,d,c,s,sprite);
  }
  public int takeDamage(int damage){
    setHealth(getHealth()-damage);
    return getHealth();
  }
  public void eatPlant(Plant p){
    return;
  }
}
