public class TestZombie extends Zombie{
  public TestZombie(int h,int d,int c,float s, PImage sprite, PVector pos){
    super(h,d,c,s,sprite,pos,color(150,150,150));
    setID(-1);
  }
  public int takeDamage(int damage){
    setHealth(getHealth()-damage);
    return getHealth();
  }
  public void eatPlant(Plant p){
    if(p==null)return;
    p.takeDamage();
  }
  public void move(){
    addPos(new PVector(-getSpeed(),0));
  }
}
