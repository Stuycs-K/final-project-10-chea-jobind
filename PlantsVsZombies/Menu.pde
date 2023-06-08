public float[] costCooldowns /*IN SECONDS*/ = {0,7.5,7.5,50,30,30,7.5,7.5,7.5};
public float[] curCooldowns = {0,0,0,0,0,0,0,0,0};

public class Menu {
  private ArrayList<Button> buttons;
  private int border;
  private int currentPlant;
  public Menu(int level) {
    for(int i=0; i<costCooldowns.length; i++){
      curCooldowns[i] = costCooldowns[i];
    }
    buttons = new ArrayList<Button>();
    border = 120;
    int i = 0;
    for(; i < level && i < 8; ++i) {
      buttons.add(new Button(LEFTBORDER + 10 + 110 * i, LEFTBORDER + 110 + 110 * i, 10, 110, i + 1));
    }
    for(; i < 8; ++i) {
      buttons.add(new Button(LEFTBORDER + 10 + 110 * i, LEFTBORDER + 110 + 110 * i, 10, 110, BLANK));
    }
    buttons.add(new Button(LEFTBORDER + 50 + 110 * i, LEFTBORDER + 150 + 110 * i, 10, 110, REMOVE));
    currentPlant = BLANK;
  }
  void processClick(Lawn l) {
    if(mouseX < LEFTBORDER || mouseY > BOTTOMBORDER || mouseX > RIGHTBORDER) {
      return;
    }
    if(mouseY > border) {
      l.placePlant(mouseX, mouseY, currentPlant);
      curCooldowns[currentPlant]=0;
      currentPlant = BLANK;
      return;
    }
    for(int i = 0; i < buttons.size(); ++i) {
      if(buttons.get(i).isInButton(mouseX, mouseY)) {
        currentPlant = buttons.get(i).press(currentPlant);
        if(curCooldowns[currentPlant]<costCooldowns[currentPlant]){
          currentPlant = BLANK;
        }
        return;
      }
    }
  }
  void display() {
    stroke(160, 82, 45);
    fill(139, 69, 19);
    rect(0, 0, LEFTBORDER + buttons.size() * 120, border);
    for(int i = 0; i < buttons.size(); ++i) {
      buttons.get(i).display();
    }
    if(currentPlant == -1) {
      text("remove", 0, border);
    } else {
      text(plantNames[currentPlant], 0, border);
    }
  }
  void update() {
    for(int i=0; i<costCooldowns.length; i++){
      curCooldowns[i]+= 1.0/FRAMERATE;
      if(curCooldowns[i]>costCooldowns[i]){
        curCooldowns[i]=costCooldowns[i];
      }
      buttons.get(i).display();
    }
    stroke(160, 82, 45);
    fill(139, 69, 19);
    rect(0, 110, 120, 10);
    stroke(255);
    fill(255);
    if(currentPlant == -1) {
      text("remove", 0, border);
    } else {
      text(plantNames[currentPlant], 0, border);
    }
  }
}
