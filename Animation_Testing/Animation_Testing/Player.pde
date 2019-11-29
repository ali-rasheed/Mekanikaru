class Player extends Actor {
  
  Player(float x, float y, float w, float h) {
    super(x, y, w, h);
    sprite = loadImage("Mech.png");
    sprite.resize(sprite.width/2,sprite.height/2);
  }
  
  float defaultxPos = xPos;
  float defaultyPos = yPos;
  
  float idleSpeed = 0.2;
  
  //ANIMATIONS
  Ani atkStart;
  Ani atkReturn;
  Ani idleStart;
  Ani idleReturn;
  Ani recoilStart;
  Ani recoilReturn;
  
  void setAnimations() {
    atkStart = new Ani(this,0.1,"xPos",enemy.defaultxPos-enemy.actorW/2,Ani.LINEAR);
    atkReturn = new Ani(this,0.5,0.1,"xPos",defaultxPos,Ani.EXPO_OUT);
    idleStart = new Ani(this, idleSpeed, "yPos", yPos - yUnit/6, Ani.EXPO_OUT);
    idleReturn = new Ani(this,idleSpeed,idleSpeed,"yPos",defaultyPos,Ani.EXPO_IN, "onEnd:idle");
    recoilStart = new Ani(this,0.1,0.2,"xPos",xPos-xUnit/6, Ani.LINEAR);
    recoilReturn = new Ani(this,0.2,0.3,"xPos",defaultxPos,Ani.EXPO_OUT);
  }
  
  void attack() {
    atkStart.start();
    atkReturn.start();
  }
  
  void idle() {
    idleStart = new Ani(this, idleSpeed, "yPos", yPos - yUnit/6, Ani.EXPO_OUT);
    idleReturn = new Ani(this,idleSpeed,idleSpeed,"yPos",defaultyPos,Ani.EXPO_IN, "onEnd:idle");
    idleStart.start();
    idleReturn.start();
  }
  
  void recoil() {
    if (atkStart.isPlaying() == false && atkReturn.isPlaying() == false) {
      recoilStart.start();
      recoilReturn.start();
    }
    if (idleSpeed > 0.1) idleSpeed = idleSpeed - 0.05;
  }
  
}
