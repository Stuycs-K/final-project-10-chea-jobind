static int REMOVE = -1;
static int BLANK = 0;
static int PEASHOOTER = 1;
static int SUNFLOWER = 2;
static int CHERRYBOMB = 3;
static int WALLNUT = 4;
static int POTATOMINE = 5;
static int SNOWPEA = 6;
static int CHOMPER = 7;
static int REPEATER = 8;
public String[] plantNames = {"blank", "pea shooter", "sunflower", "cherry bomb", "wall-nut", "potato mine", "snow pea", "chomper" , "repeater"};
public String[] plantImageNames = {"noplant.png", "peashooter.png", "sunflower.png", "cherrybomb.png", "wallnut.png", "potatomine.png", "snowpea.png", "chomper.png", "repeater.png"};

public class Button {
  private int x0, y0, x1, y1;
  private int plantType;
  public Button(int a, int b, int c, int d, int type) {
    x0 = a;
    y0 = c;
    x1 = b;
    y1 = d;
    plantType = type;
  }
  boolean isInButton(int x, int y) {
    return x > x0 && x < x1 && y > y0 && y < y1;
  }
  int press(int previous) {
    if(plantType == REMOVE) {
      return BLANK;
    }
    if(plantType != BLANK) {
      return plantType;
    } else {
      return previous;
    }
  }
  void display() {
    stroke(255);
    fill(255);
    rect(x0, y0, x1 - x0, y1 - y0);
    if(plantType > 0) {
      //text(plantNames[plantType], x0, y0);
      image(plantImages[plantType], x0, y0, 100, 100);
    }
    if(plantType == -1) {
      text("remove", x0, y0);
    }
  }
}
