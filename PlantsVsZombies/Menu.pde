public class Menu {
  ArrayList<Button> buttons;
  int border;
  int currentPlant;
  public Menu(int level) {
    buttons = new ArrayList<Button>();
    border = 120;
    int i = 0;
    for(; i < level; ++i) {
      buttons.add(new Button(10 + 110 * i, 110 + 110 * i, 10, 110, i + 1));
    }
    for(; i < buttons.size(); ++i) {
      buttons.add(new Button(10 + 100 * i, 110 + 110 * i, 10, 110, i + 1));
    }
  }
}
