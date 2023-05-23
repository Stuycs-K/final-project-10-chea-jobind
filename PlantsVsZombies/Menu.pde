public class Menu {
  ArrayList<Button> buttons;
  int border;
  int currentPlant;
  public Menu(int level) {
    buttons = new ArrayList<Button>();
    border = 120;
    int i = 0;
    for(; i < level && i < 8; ++i) {
      buttons.add(new Button(10 + 110 * i, 110 + 110 * i, 10, 110, i + 1));
    }
    for(; i < 8; ++i) {
      buttons.add(new Button(10 + 110 * i, 110 + 110 * i, 10, 110, 0));
    }
    buttons.add(new Button(10 + 110 * i, 110 + 110 * i, 10, 110, 9));
    currentPlant = 1;
  }
  void processClick(Lawn l) {
    for(int i = 0; i < buttons.size(); ++i) {
      if(buttons.get(i).isInButton(mouseX, mouseY)) {
        currentPlant = buttons.get(i).press(currentPlant);
        return;
      }
    }
    if(mouseY > border) {
      l.placePlant(mouseX, mouseY, currentPlant);
    }
  }
  void display() {
    stroke(160, 82, 45);
    fill(139, 69, 19);
    rect(0, 0, buttons.size() * 120, border);
    for(int i = 0; i < buttons.size(); ++i) {
      buttons.get(i).display();
    }
    text(currentPlant, 0, border);
  }
}
