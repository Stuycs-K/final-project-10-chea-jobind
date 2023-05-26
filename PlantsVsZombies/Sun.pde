public class Sun {
  PVector position;
  int amount;
  public Sun(PVector p, int a) {
    position = p;
    amount = a;
  }
  public PVector getPos() {
    return position;
  }
  public PVector move() {
    position.y += 2.5;
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
