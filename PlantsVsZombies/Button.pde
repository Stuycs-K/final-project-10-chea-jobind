int BLANK = 0;
int PEASHOOTER = 1;
int SUNFLOWER = 2;
int CHERRYBOMB = 3;
int WALLNUT = 4;
int POTATOMINE = 5;
int SNOWPEA = 6;
int CHOMPER = 7;
int REPEATER = 8;

public class Button {
  private int x0, y0, x1, y1;
  private int plantType;
  public Button(int a, int b, int c, int d, int type) {
    x0 = a;
    y0 = b;
    x1 = c;
    y1 = d;
    plantType = type;
  }
  boolean isInButton(int x, int y) {
    return x > x0 && x < x1 && y > y0 && y < y1;
  }
  int press(int previous) {
    if(plantType != BLANK) {
      return plantType;
    } else {
      return previous;
    }
  }
}
