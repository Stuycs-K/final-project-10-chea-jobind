public class Menu {
  private ArrayList<Button> buttons;
  private int border;
  private int currentPlant;
  public Menu(int level) {
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
    currentPlant = 1;
  }
  void processClick(Lawn l) {
    if(mouseX < LEFTBORDER || mouseY > BOTTOMBORDER || mouseX > RIGHTBORDER) {
      return;
    }
    if(mouseY > border) {
      l.placePlant(mouseX, mouseY, currentPlant);
      return;
    }
    for(int i = 0; i < buttons.size(); ++i) {
      if(buttons.get(i).isInButton(mouseX, mouseY)) {
        currentPlant = buttons.get(i).press(currentPlant);
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
