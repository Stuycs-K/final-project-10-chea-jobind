public class SunManager {
  private int sunAmount;
  private ArrayList<Sun> sunList;
  public SunManager() {
    sunAmount = 50;
    sunList = new ArrayList<Sun>();
  }
  public void display() {
    stroke(160, 82, 45);
    fill(139, 69, 19);
    rect(0, 0, 50, 50);
    fill(255);
    text(sunAmount, 10, 10);
  }
  private boolean sunPresent() {
    return sunList.size() > 0;
  }
  public int findSun() {
    if(!sunPresent()) {
      return 0;
    }
    for(int i = 0; i < sunList.size(); ++i) {
      Sun s = sunList.get(i);
      if(s.getPos().y > BOTTOMBORDER) {
        sunList.remove(i);
      } else if(abs(s.getPos().x - mouseX) < 60 && abs(s.getPos().y - mouseY) < 55) {
        return sunList.remove(i).getSun();
      } else {
        s.display();
        s.move();
      }
    }
    return 0;
  }
  public void add(Sun s) {
    sunList.add(s);
  }
  public void add(int i) {
    sunAmount += i;
    display();
  }
  public boolean remove(int i) {
    if(sunAmount - i >= 0) {
      sunAmount -= i;
      display();
      return true;
    }
    return false;
  }
}