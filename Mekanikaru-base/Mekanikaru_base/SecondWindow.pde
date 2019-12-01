class SecondWindow extends PApplet {
  
  int playerAttacks = 0;
  int enemyAttacks = 0;
  int resetPlayerSpeed = 0;
  
  
  public SecondWindow() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings() {
   size(960,540);
  }
  
  public void setup() {
    surface.setTitle("Timer");
    
  }
  
  public void draw(){
    //if(frameCount == 1) surface.setLocation(700,600);
    background(100);
    textSize(30);
    
    rect(700, 500, 60,-(timer/maxTimer)*400);
    
    text("Score " + score, 100,200);
    text("PlayerAttacks " + playerAttacks, 100,300);
    text("EnemyAttacks " + enemyAttacks, 100,400);
  
  }
  
  void playerAttack() {
    playerAttacks++;
  //player.attack();
  //enemy.recoil();
  }

  void enemyAttack() {
    enemyAttacks++;
    //enemy.attack();
    //player.recoil();
  }
  
  void resetPlayerSpeed() {
    resetPlayerSpeed++;
  //player.idleSpeed = 0.2;
}
}
