public class Sun {
  private PVector position;
  private int amount;
  private boolean moving;
  public Sun(PVector p, int a, boolean m) {
    position = p;
    amount = a;
    moving = m;
  }
  public PVector getPos() {
    return position;
  }
  public void setPos(PVector p) {
    position = p;
  }
  public PVector move() {
    if(moving) {
      position.y += 2.5;
    }
    return position;
  }
  public int getSun() {
    return amount;
  }
  public void display() {
    stroke(255, 255, 0);
    fill(255, 255, 0);
    circle(position.x, position.y, 50);
  }
}
