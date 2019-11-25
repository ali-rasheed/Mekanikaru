int xUnit;
int yUnit;
int modHeight;
int modWidth;

ArrayList<Module> modules = new ArrayList<Module>();

void setup() {
  background(0);
  fullScreen();
  fill(255);
  stroke(255);
  
  xUnit = displayWidth/15;
  yUnit = displayHeight/9;
  modHeight = yUnit*3;
  modWidth = xUnit*6;
  
  Module switchModule = new Module( 1*xUnit, 1*yUnit, modWidth, modHeight );
  Module dialModule = new Module( 8*xUnit, 1*yUnit, modWidth, modHeight );
  Module ledModule = new Module( 1*xUnit, 5*yUnit, modWidth, modHeight );
  Module jackModule = new Module( 8*xUnit, 5*yUnit, modWidth, modHeight );
  
  modules.add(switchModule);
  modules.add(dialModule);
  modules.add(ledModule);
  modules.add(jackModule);
}

void draw() {
  drawModules();
}

void drawModules() {
  for (int i = 0; i < modules.size(); i++){
    Module m = modules.get(i);
    m.render();
    println(m.xPos);
  }
}