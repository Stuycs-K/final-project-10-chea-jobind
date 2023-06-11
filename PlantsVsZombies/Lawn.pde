public static int LEFTBORDER = 125;
public static int TOPBORDER = 120;
public static int BOTTOMBORDER = 870;
public static int RIGHTBORDER = 1475;
public static int TILE = 150;

public class Lawn {
  private Plant[][] grid;
  private int[] laneZombies = new int[] {0,0,0,0,0};
  private ArrayList<Projectile> projectiles;
  private ArrayList<Zombie> zombies;
  private SunManager sunM;
  //ProgressReader r;
  private boolean finished;
  
  public Lawn(SunManager s /*, ProgressReader r_*/) {
    finished=false;
    grid = new Plant[5][9];
    projectiles = new ArrayList<Projectile>();
    zombies = new ArrayList<Zombie>();
    sunM = s;
    spawnLawnMowers();
    //r = r_;
  }
  //Returns a new plant based on the ID
  public void spawnLawnMowers(){
    Projectile mower;
    PVector pos;
    for(int i=0; i<5; i++){
      pos = new PVector(LEFTBORDER-50, TOPBORDER+i*TILE+TILE/2);
      mower = new Projectile(pos,new PVector(0,0), 40, 9999, false, true);
      mower.setColor(#312A2A);
      projectiles.add(mower);
    }
  }
  public Plant findPlant(int i) {
    if(i <= BLANK) {
      return null;
    }
    if(i == PEASHOOTER) {
      return new PeaShooter();
    }
    if(i == SUNFLOWER) {
      return new Sunflower();
    }
    if(i == CHERRYBOMB) {
      return new CherryBomb();
    }
    if(i == WALLNUT) {
      return new Wallnut();
    }
    if(i == POTATOMINE) {
      return new PotatoMine();
    }
    if(i == SNOWPEA) {
      return new SnowPea();
    }
    if(i == REPEATER) {
      return new Repeater();
    }
    if(i == CHOMPER) {
      return new Chomper();
    }
    return null;
  }
  
  //Places a plant where the user clicks.
  void placePlant(int x, int y, int plant) {
    int[] plantCoord = mouseToArr(x,y);
    if(grid[plantCoord[0]][plantCoord[1]] == null) {
      if(sunM.remove(plantCosts[plant])) {
        Plant p = findPlant(plant);
        grid[plantCoord[0]][plantCoord[1]] = p;
      }
    } else if(plant <= BLANK) {
      grid[plantCoord[0]][plantCoord[1]] = null;
    }
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
          image(plantImages[grid[i][j].getID()], imageCoord[0], imageCoord[1], 150, 150);
          fill(plantColors[grid[i][j].id]);
          stroke(0);
          //circle(imageCoord[0] + 75, imageCoord[1] + 75, grid[i][j].size);
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
    //renderProjectiles();
    fill(255, 248, 203);
    stroke(255, 248, 203);
    rect(0, TOPBORDER, LEFTBORDER, height - TOPBORDER);
    rect(RIGHTBORDER, 0, width - RIGHTBORDER, height);
  }
  Zombie spawnZombie(int ID){
    int row = (int)random(5);
    laneZombies[row]++;
    PVector pos = new PVector(RIGHTBORDER,TOPBORDER+TILE*row+TILE/2);
    Zombie z = new DefaultZombie();
    PImage p = zombieImages[ID - 1];
    switch(ID){
      //case -1: z = new TestZombie(5,5.0,null,pos);
      case 1:
        z = new DefaultZombie(7, p, pos);
        break;
      case 2:
        z = new ConeZombie(18, p, pos);
        break;
      case 3:
        z = new BucketZombie(27, p, pos);
        break;
      case 4:
        z = new PoleZombie(10, p, pos);
        break;
    }
    zombies.add(z);
    return z;
  }
  void renderZombies(){
    lawn.display();
    for(Zombie z: zombies){
      //print(z.getHealth());
      //fill(z.getColor());
      //ellipse(z.getPos().x,z.getPos().y,TILE*2/3,TILE*5/6);
      imageMode(CENTER);
      if(z.getID() != 4) {
        if(z.getHealth() > 10) {
          image(z.getSprite(), z.getPos().x, z.getPos().y, TILE*2/3, TILE*5/6);
        } else {
          image(zombieImages[0], z.getPos().x, z.getPos().y, TILE*2/3, TILE*5/6);
        }
      } else {
        PoleZombie p = (PoleZombie)(z);
        if(p.jumped()) {
          image(zombieImages[4], z.getPos().x, z.getPos().y, TILE*2/3, TILE*5/6);
        } else {
          image(zombieImages[3], z.getPos().x, z.getPos().y, TILE, TILE*5/6);
        }
      }
      imageMode(CORNER);
    }
  }
  void tickZombies(){
    if(zombies.size() == 0) {
      NEXTLEVEL = true;
      return;
    } else {
      NEXTLEVEL = false;
    }
    for(int i = 0; i < zombies.size(); ++i) {
      Zombie z = zombies.get(i);
      int[] pos = mouseToArr((int)z.getPos().x,(int)z.getPos().y);
      if(grid[pos[0]][pos[1]]!=null){
        z.decrement();
        //print(z.getCurrentCooldown());
        z.setCurPlant(grid[pos[0]][pos[1]]);
        if(z.getCurPlant().getID() == CHOMPER) {
          //println(z.getCurPlant().getCooldown());
          if(z.getCurPlant().getCooldown() == 0) {
            zombies.remove(i);
            grid[pos[0]][pos[1]].resetCooldown();
            continue;
          }
        }
        z.eatPlant();
      } else{
        z.setCurPlant(null);
      }
      //                                                                                                ZOMBIE MOVEMENT
      z.move();
      if(z.getPos().x < 0||z.getHealth()<1) {
        zombies.remove(i);
        laneZombies[mouseToArr((int)z.getPos().x,(int)z.getPos().y)[0]]--;
        i--;
        if(z.getPos().x < 0) {
          GAMEACTIVE = false;
          background(0);
          textSize(60);
          fill(255, 0, 0);
          text("THE ZOMBIES ATE YOUR BRAINS", width/3, height/2);
          textSize(12);
          text("CLICK TO RESTART LEVEL", width/3, height/2 + 60);
        }
      }
    }
    //This line calls the "ProgressReader" which (should) help encapsulate File management
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
          if(p != null && laneZombies[i]!=0) {
            p.setPos(new PVector(LEFTBORDER+j*TILE+TILE/2,TOPBORDER+i*TILE+TILE/2));
            projectiles.add(p);
          }
        }
        if(id == CHERRYBOMB || id == POTATOMINE) {
          Projectile p = (Projectile)(grid[i][j].tick());
          //println(p == null);
          if(p != null) {
            p.setPos(new PVector(LEFTBORDER+j*TILE+TILE/2,TOPBORDER+i*TILE+TILE/2));
            projectiles.add(p);
            grid[i][j] = null;
          }
        }
        if(id == SUNFLOWER || id == WALLNUT) {
          //println(grid[i][j].getCooldown());
          Sun s = (Sun)(grid[i][j].tick());
          if(s != null) {
            int[] coords = arrToMouse(i, j);
            s.setPos(new PVector(coords[0] + 75, coords[1] + 75));
            sunM.add(s);
          }
        }
      }
    }
  }
  void tickProjectiles(){
    boolean done;
    int ZRAD = TILE*1/4;
    for(int i=0; i<projectiles.size(); i++){
      done=false;
      Projectile p = projectiles.get(i);
      p.move();
      Zombie z;
      if(p.getPos().x>width){
        projectiles.remove(i);
        i--;
        continue;
      }
      /*
      if(p.getDamage() != 9999) {
        println(p.getDamage());
      }
      */
      //println(p.getPos().x);
      for(int j=0; j<zombies.size(); j++){
        z = zombies.get(j);
        if(PVector.sub(z.getPos(),p.getPos()).mag()<p.getSize()+ZRAD){
          z.takeDamage(p.getDamage());
          if(p.slow){
            z.freeze();
          }
          if(!p.persistent){
            done=true;
          } else{
            p.setVelocity(new PVector(10,0));
          }
        }
      }
      if(p.getVelocity().mag()==0||done){
        if(!p.persistent){
          projectiles.remove(i);
          i--;
          continue;
        }
      }
    }
  }
  void renderProjectiles(){
    for(Projectile p: projectiles){
      if(p.getDamage() == 9999) {
        image(lawnmowerImage, p.getPos().x-p.getSize(), p.getPos().y-p.getSize(), p.getSize()*2, p.getSize()*2);
      } else {
        fill(p.getColor());
        ellipse(p.getPos().x,p.getPos().y,p.getSize()*2,p.getSize()*2);
      }
    }
  }
}
