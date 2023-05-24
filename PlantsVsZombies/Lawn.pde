public static int LEFTBORDER = 125;
public static int TOPBORDER = 120;
public static int BOTTOMBORDER = 870;
public static int RIGHTBORDER = 1475;

public class Lawn {
  int[][] grid;
  ArrayList<Projectile> projectiles;
  ArrayList<Zombie> zombies;
  public Lawn() {
    grid = new int[5][9];
    projectiles = new ArrayList<Projectile>();
    zombies = new ArrayList<Zombie>();
  }
  void placePlant(int x, int y, int plant) {
    int row = (y-120) / 150;
    if(row > 4) {
      row = 4;
    }
    int col = (x-125) / 150;
    if(col > 8) {
      col = 8;
    }
    grid[row][col] = plant;
    image(loadImage(plantImageNames[plant]), col * 150 + 125, row * 150 + 120, 150, 150);
  }
  void display() {
    int offset = 0;
    for(int i = 0; i < grid.length; ++i) {
      offset = 0;
      for(int j = 0; j < grid[0].length; ++j) {
        stroke(0, 200 - offset + (i % 2) * 50, 0);
        fill(0, 200 - offset + (i % 2) * 50, 0);
        rect(125 + 150 * j, 120 + 150 * i, 150, 150);
        stroke(0);
        fill(0);
        text(plantNames[grid[i][j]], j * 150 + 125, i * 150 + 130);
        switch(offset) {
          case 0:  offset = 50;
                   break;
          case 50: offset = 0;
                   break;
        }
      }
    }
  }
}
