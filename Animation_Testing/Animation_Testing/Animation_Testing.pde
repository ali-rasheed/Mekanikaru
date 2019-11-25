import de.looksgood.ani.*;

Player player;
Enemy enemy;

int xUnit;
int yUnit;

ArrayList<Module> modules = new ArrayList<Module>();

AniSequence pAtk;

void setup() {
  Ani.init(this);
  background(0);
  fullScreen();
  fill(255);
  stroke(255);
  
  xUnit = displayWidth/15;
  yUnit = displayHeight/9;
  
  Module aniModule = new Module( 1*xUnit, 1*yUnit, 10*xUnit, 7*yUnit );
  Module tempModule = new Module( 12*xUnit, 1*yUnit, 2*xUnit, 7*yUnit );
  modules.add(aniModule);
  modules.add(tempModule);
  
  player = new Player( aniModule.xPos + 2*xUnit, aniModule.yPos + aniModule.modH/2, 1*yUnit, 1*yUnit);
  enemy = new Enemy( aniModule.xPos + 8*xUnit, aniModule.yPos + aniModule.modH/2, 1.5*yUnit, 1.5*yUnit);

  pAtk = new AniSequence(this);
  pAtk.beginSequence();
  pAtk.beginStep();
  pAtk.add(Ani.to(this, 1, "player.xPos", enemy.xPos));
  pAtk.endStep();
  pAtk.beginStep();
  pAtk.add(Ani.to(this, 1, "player.xPos", player.defaultxPos));
  pAtk.endStep();
  pAtk.endSequence();
}

void draw() {
  drawModules();
  enemy.render();
  player.render();
}

void drawModules() {
  for (int i = 0; i < modules.size(); i++){
    Module m = modules.get(i);
    m.render();
  }
}

void mouseReleased() {
  pAtk.start();
}
