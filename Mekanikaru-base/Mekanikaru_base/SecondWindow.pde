class SecondWindow extends PApplet {
  
  int playerAttacks = 0;
  int enemyAttacks = 0;
  int resetPlayerSpeed = 0;
  
  
  public SecondWindow() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings() {
   //size(1920,1080);
   //size(displayWidth, displayHeight);
   //fullScreen();
   fullScreen(3); //This should open it on the second monitor

  }
  
  public void setup() {
    surface.setTitle("Timer");
    
    //smooth();
    Ani.init(this);
    
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
    
    player = new Player( aniModule.xPos + 3*xUnit, aniModule.yPos + 100 + aniModule.modH/2, 1*yUnit, 1*yUnit);
    enemy = new Enemy( aniModule.xPos + 7*xUnit, aniModule.yPos +100 + aniModule.modH/2, 1*yUnit, 1*yUnit);
    
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
    
    if(isGameOver){
      background(endScreen);
      
      fill(255);
      //textSize(50);
      textAlign(CENTER);
      textFont(numFont, 404);
      text(score, 1440, 440);
      
      textSize(160);
      fill(160);
      if(letterSelected == 1) fill(255);
      text(a, 1270,780);
      fill(160);
      if(letterSelected == 2) fill(255);
      text(b, 1430,780);
      fill(160);
      if(letterSelected == 3) fill(255);
      text(c, 1590,780);
      fill(160);
    }
    
    if(isGameStart){
      background(startbg);
    }
    
    if(isGameOver == false && isGameStart == false){
      background(0);
      drawModules();
      drawBackground();
      drawRoundCount();
      drawTimer();
      enemy.render();
      player.render();
      if (setTransparency <= 20) {
        setTransparency++;
      }
      if (setTransparency == 20) {
        player.transparency = 255;
      }
    }
  
  }
  
  //MODULES & BACKGROUND

void drawModules() {
  for (int i = 0; i < modules.size(); i++){
    Module m = modules.get(i);
    m.render();
  }
}

void drawBackground() {
  timerWindow.image(timerBackground,xUnit,yUnit);
}

void drawTimer() {
  float timerRatio = (timer/maxTimer);
  int rectMaxHeight = 5*yUnit;
  
  if(timerRatio >= 0.25)  fill(#96E6FF);
  else fill(#F90400);
  
  rect(12*xUnit, (3*yUnit)+(rectMaxHeight), 2*xUnit, -((1-timerRatio)*rectMaxHeight));
}

void drawRoundCount() {
  textFont(scoreFont);
  fill(0);
  text("ROUND",12.1*xUnit,2*yUnit);
  textFont(numFont);
  if(score < 10){
    text("0",12.7*xUnit,2*yUnit);
    text(score,12.7*xUnit+60,2*yUnit);
  }else{
    text(score,12.7*xUnit,2*yUnit);
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
