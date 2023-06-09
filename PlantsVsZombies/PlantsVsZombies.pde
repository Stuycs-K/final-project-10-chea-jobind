import java.util.Arrays;

Lawn lawn;
Menu menu;
int level = -1;
SunManager sm;
boolean selected = false;
//ProgressReader r;
public static final int FRAMERATE = 30;
PImage[] plantImages = new PImage[9];
PImage[] zombieImages = new PImage[5];
PImage lawnmowerImage;
boolean GAMEACTIVE;
boolean NEXTLEVEL;
int CURRENTTICK;

void setup() {
  plantImages[0] = loadImage("noplant.png"); 
  plantImages[1] = loadImage("peashooter.png");
  plantImages[2] = loadImage("sunflower.png");
  plantImages[3] = loadImage("cherrybomb.png"); 
  plantImages[4] = loadImage("wallnut.png"); 
  plantImages[5] = loadImage("potatomine.png");
  plantImages[6] = loadImage("snowpea.png"); 
  plantImages[7] = loadImage("chomper.png");
  plantImages[8] = loadImage("repeater.png");
  zombieImages[0] = loadImage("normalzombie.png");
  zombieImages[1] = loadImage("conezombie.png");
  zombieImages[2] = loadImage("bucketzombie.png");
  zombieImages[3] = loadImage("polezombie.png");
  zombieImages[4] = loadImage("nopolezombie.png");
  lawnmowerImage = loadImage("lawnmower.png");
  size(1600, 900);
  frameRate(FRAMERATE);
  /*
  Zombie john = new TestZombie(100,1,1,1.0,null);
  print(john.getHealth());
  print(john.takeDamage(10));
  */
  sm = new SunManager(50);
  //r = new ProgressReader(level);
  lawn = new Lawn(sm /*, r*/);
  menu = new Menu(level);
  lawn.display();
  menu.display();
  CURRENTTICK = 0;
  GAMEACTIVE = true;
}

void spawnRandomZombie(int l) {
  if(l >= 8) {
    lawn.spawnZombie(int(random(4)) + 1);
  } else if(l >= 6) {
    lawn.spawnZombie(int(random(3)) + 1);
  } else if(l >= 3) {
    lawn.spawnZombie(int(random(2)) + 1);
  } else {
    lawn.spawnZombie(1);
  }
}

boolean isZombieTick(int t) {
  if(t < 10 * FRAMERATE || t > 180 * FRAMERATE) {
    return false;
  }
  if(t % (10 * FRAMERATE) == 0) {
    return true;
  }
  if(t % (2 * FRAMERATE) == 0 && (abs(90 * FRAMERATE - t) < 10 * FRAMERATE || t > 150 * FRAMERATE)) { // if it's a wave
    return true;
  }
  return false;
}

void draw() {
  if(selected){
    if(CURRENTTICK >= 180 * FRAMERATE && NEXTLEVEL) {
      ++level;
      NEXTLEVEL = false;
      setup();
    } else if(GAMEACTIVE) {
      if(isZombieTick(CURRENTTICK)) {
        if(random(1) < level * 0.05 + 0.5) {
          spawnRandomZombie(level);
        }
      }
      ++CURRENTTICK;
      lawn.processPlants();
      lawn.display();
      lawn.renderZombies();
      lawn.tickZombies();
      if(!GAMEACTIVE) {
        return;
      }
      lawn.tickProjectiles();
      lawn.renderProjectiles();
      sm.add(sm.findSun());
      menu.update();
      if(CURRENTTICK >= 70 * FRAMERATE && CURRENTTICK < 80 * FRAMERATE || CURRENTTICK >= 140 * FRAMERATE && CURRENTTICK < 150 * FRAMERATE) {
        text("WAVE APPROACHING", width/2, height/2);
      }
      if(CURRENTTICK >= 80 * FRAMERATE && CURRENTTICK < 100 * FRAMERATE || CURRENTTICK >= 150 * FRAMERATE && CURRENTTICK < 180 * FRAMERATE) {
        text("WAVE SPAWNING", width/2, height/2);
      }
      //println(Arrays.toString(lawn.laneZombies));
    }
  } else{
    background(100);
    fill(255);
    text("Type number of level",width/2,height/2);
    text(level,20,20);
  }
}

void mouseReleased() {
  if(GAMEACTIVE&&selected) {
    menu.processClick(lawn);
    menu.update();
  } else if (selected) {
    background(255);
    setup();
  }
}
void keyPressed(){
  if(selected){
  } else{
    int lNum = Integer.parseInt(""+key);
    level = lNum;
    selected=true;
    if(level == 1) {
      sm = new SunManager(1000);
      lawn = new Lawn(sm);
    }
    lawn.display();
    menu = new Menu(level);
    menu.display();
  }
}
