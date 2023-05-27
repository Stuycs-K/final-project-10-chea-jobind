public static int LEFTBORDER = 125;
public static int TOPBORDER = 120;
public static int BOTTOMBORDER = 870;
public static int RIGHTBORDER = 1475;
public static int TILE = 150;

public class Lawn {
  Plant[][] grid;
  ArrayList<Projectile> projectiles;
  ArrayList<Zombie> zombies;
  SunManager sunM;
  //ProgressReader r;
  boolean finished;
  
  public Lawn(SunManager s /*, ProgressReader r_*/) {
    finished=false;
    grid = new Plant[5][9];
    projectiles = new ArrayList<Projectile>();
    zombies = new ArrayList<Zombie>();
    sunM = s;
    //r = r_;
  }
  //Places a plant where the user clicks.
  void placePlant(int x, int y, int plant) {
    int[] plantCoord = mouseToArr(x,y);
    Plant p;
    if(plant == BLANK) {
      p = null;
    } else {
      if(plant == PEASHOOTER || plant == SNOWPEA || plant == CHOMPER || plant == REPEATER) {
        p = new ShootingPlant(plant);
      } else if(plant == CHERRYBOMB || plant == POTATOMINE) {
        p = new ExplodingPlant(plant);
      } else if(plant == SUNFLOWER || plant == WALLNUT) {
        p = new ProducingPlant(plant);
      } else {
        p = null;
      }
    }
    grid[plantCoord[0]][plantCoord[1]] = p;
  }
  //Converts from mouseX mouseY to row-column paradigm.
  int[] mouseToArr(int x, int y){
    int row = (y-120) / 150;
    if(row > 4) {
      row = 4;
    }
    int col = (x-125) / 150;
    if(col > 8) {
      col = 8;
    }
    return new int[] {row,col};
  }
  //Converts from row-column to top left x y coords on screen
  int[] arrToMouse(int i, int j) {
    int x = j * 150 + 125;
    int y = i * 150 + 120;
    return new int[] {x, y};
  }
  //Displays grass tiles, making some lighter and some darker.
  //Will eventually display sprites.
  void display() {
    int offset = 0;
    for(int i = 0; i < grid.length; ++i) {
      offset = 0;
      for(int j = 0; j < grid[0].length; ++j) {
        stroke(0, 200 - offset + (i % 2) * 50, 0);
        fill(0, 200 - offset + (i % 2) * 50, 0);
        rect(125 + 150 * j, 120 + 150 * i, 150, 150);
        if(grid[i][j] != null) {
          int[] imageCoord = arrToMouse(i, j);
          //image(loadImage(plantImageNames[grid[i][j].getID()]), imageCoord[0], imageCoord[1], 150, 150);
          fill(255);
          stroke(255);
          circle(imageCoord[0] + 75, imageCoord[1] + 75, 75);
        }
        /*
        if(grid[i][j] == null) {
          text(plantNames[BLANK], j * 150 + 125, i * 150 + 130);
        } else {
          text(plantNames[grid[i][j].getID()], j * 150 + 125, i * 150 + 130);
        }
        */
        switch(offset) {
          case 0:  offset = 50;
                   break;
          case 50: offset = 0;
                   break;
        }
      }
    }
  }
  Zombie spawnZombie(int ID){
    int row = (int)random(5);
    PVector pos = new PVector(RIGHTBORDER,TOPBORDER+TILE*row);
    Zombie z = new DefaultZombie();
    switch(ID){
      //case -1: z = new TestZombie(5,5.0,null,pos);
      case 1:
        z = new DefaultZombie(5,pos);
        break;
      case 2:
        z = new ConeZombie(10,pos);
        break;
      case 3:
        z = new BucketZombie(35,pos);
        break;
    }
    zombies.add(z);
    return z;
  }
  void renderZombies(){
    lawn.display();
    for(Zombie z: zombies){
      //print(z.getHealth());
      fill(z.getColor());
      ellipse(z.getPos().x,z.getPos().y+TILE/2,TILE*2/3,TILE*5/6);
    }
  }
  void tickZombies(){
    for(int i = 0; i < zombies.size(); ++i) {
      Zombie z = zombies.get(i);
      int[] pos = mouseToArr((int)z.getPos().x,(int)z.getPos().y);
      if(grid[pos[0]][pos[1]]!=null){
        z.decrement();
        //print(z.getCurrentCooldown());
        z.eatPlant(grid[pos[0]][pos[1]]);
      } else{
        z.move();
      }
      if(z.getPos().x < 0) {
        zombies.remove(i);
        //END GAME
      }
    }
    //This line calls the "ProgressReader" which helps encapsulate File management
    //spawnZombie(r.next());
  }
  void processPlants() {
    for(int i = 0; i < grid.length; ++i) {
      for(int j = 0; j < grid[0].length; ++j) {
        if(grid[i][j] != null && grid[i][j].getHealth() == 0) {
          grid[i][j] = null;
          break;
        }
        int id = grid[i][j] != null ? grid[i][j].getID() : BLANK;
        if(id == PEASHOOTER || id == SNOWPEA || id == CHOMPER || id == REPEATER) {
          Projectile p = (Projectile)(grid[i][j].tick());
          if(p != null) {
            projectiles.add(p);
          }
        }
        if(id == CHERRYBOMB || id == POTATOMINE) {
          Projectile p = (Projectile)(grid[i][j].tick());
          if(p != null) {
            projectiles.add(p);
            grid[i][j] = null;
          }
        }
        if(id == SUNFLOWER || id == WALLNUT) {
          println(grid[i][j].getCooldown());
          Sun s = (Sun)(grid[i][j].tick());
          if(s != null) {
            sunM.add(s);
          }
        }
      }
    }
  }
}
