class Player extends Actor {
  
  Player(float x, float y, float w, float h) {
    super(x, y, w, h);
    sprite = loadImage("Assets/Mech.png");
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
  Ani fadeOut;
  
  void setAnimations() {
    atkStart = new Ani(this,0.1,"xPos",enemy.defaultxPos-enemy.actorW/2,Ani.LINEAR);
    atkReturn = new Ani(this,0.5,0.1,"xPos",defaultxPos,Ani.EXPO_OUT);
    idleStart = new Ani(this, idleSpeed, "yPos", yPos - yUnit/8, Ani.EXPO_OUT);
    idleReturn = new Ani(this,idleSpeed,idleSpeed,"yPos",defaultyPos,Ani.EXPO_IN, "onEnd:idle");
    recoilStart = new Ani(this,0.1,0.2,"xPos",xPos-xUnit/6, Ani.LINEAR);
    recoilReturn = new Ani(this,0.2,0.3,"xPos",defaultxPos,Ani.EXPO_OUT);
    fadeOut = new Ani(this, 0.1, "transparency", 0, Ani.EXPO_IN);
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
  
  void render() {
    tint(255,transparency);
    timerWindow.image(sprite,xPos-sprite.width/2,yPos-sprite.height/2);
    timerWindow.tint(255,255);
  }
  
  void die() {
    recoilStart.start();
    fadeOut.start();
  }
  
}
