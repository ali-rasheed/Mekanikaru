class SecondWindow extends PApplet {
  
  int playerAttacks = 0;
  int enemyAttacks = 0;
  int resetPlayerSpeed = 0;
  
  
  public SecondWindow() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings() {
   //size(1000,1000);
   size(displayWidth, displayHeight);
   //fullScreen();
   //fullScreen(2); //This should open it on the second monitor

  }
  
  public void setup() {
    surface.setTitle("Timer");
    
    smooth();
    Ani.init(this);
    //background(0);
    
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
  
  public void draw(){
    //if(frameCount == 1) surface.setLocation(700,600);
    //background(100);
    //textSize(30);
    
    //rect(700, 500, 60,-(timer/maxTimer)*400);
    
    //text("Score " + score, 100,200);
    //text("PlayerAttacks " + playerAttacks, 100,300);
    //text("EnemyAttacks " + enemyAttacks, 100,400);
    //background(200);
    
    background(0);
    drawModules();
    enemy.render();
    player.render();
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
}
