//GLOBAL VARIABLES + LIBRARY IMPORT

import de.looksgood.ani.*;

Player player;
Enemy enemy;

int xUnit;
int yUnit;

ArrayList<Module> modules = new ArrayList<Module>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

float timer = 0;
float setTransparency = 0;



//TO GO INTO SETUP

void setup() {
  smooth();
  Ani.init(this);
  background(0);
  fullScreen();
  fill(255);
  stroke(255);
  
  xUnit = displayWidth/15;
  yUnit = displayHeight/9;
  
  Module aniModule = new Module( 1*xUnit, 1*yUnit, 10*xUnit, 7*yUnit );
  Module tempModule = new Module( 12*xUnit, 3*yUnit, 2*xUnit, 5*yUnit );
  Module scoreModule = new Module( 12*xUnit, 1*yUnit, 2*xUnit, 1*xUnit );
  modules.add(aniModule);
  modules.add(tempModule);
  modules.add(scoreModule);
  
  player = new Player( aniModule.xPos + 3*xUnit, aniModule.yPos + aniModule.modH/2, 1*yUnit, 1*yUnit);
  enemy = new Enemy( aniModule.xPos + 7*xUnit, aniModule.yPos + aniModule.modH/2, 1*yUnit, 1*yUnit);
  
  player.setAnimations();
  player.transparency = 255;
}



//TO GO INTO DRAW

void draw() {
  drawModules();
  enemy.render();
  player.render();
  timer++;
  if (setTransparency <= 20) {
    setTransparency++;
  }
  if (setTransparency == 20) {
    player.transparency = 255;
  }
}



//MODULES & BACKGROUND

void drawModules() {
  for (int i = 0; i < modules.size(); i++){
    Module m = modules.get(i);
    m.render();
  }
}



//FUNCTIONS TO CALL TO ANIMATE CHARACTERS

void playerAttack() {
  player.attack();
  enemy.recoil();
}

void playerDefeat() {
  player.attack();
  enemy.die();
}

void enemyAttack() {
  enemy.attack();
  player.recoil();
}

void enemyDefeat() {
  enemy.attack();
  player.die();
}

void resetPlayerSpeed() {
  player.idleSpeed = 0.2;
}



//TESTING

void keyPressed() {
  if (key == 'q') {
    playerAttack();
  }
  if (key == 'p') {
    enemyAttack();
  }
  if (key == ' ') {
    resetPlayerSpeed();
  }
  if (key == 'w') {
    playerDefeat();
  }
  if (key == 'o') {
    enemyDefeat();
  }
}
