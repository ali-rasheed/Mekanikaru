class Enemy extends Actor {
  
  Enemy(float x, float y, float w, float h) {
    super(x, y, w, h);
    sprite = loadImage("Monster.png");
    sprite.resize(sprite.width/2,sprite.height/2);
  }
  
  float defaultxPos = xPos;
  float defaultyPos = yPos;
  
  //ANIMATIONS
  Ani idleStart = new Ani(this, 1, "yPos", yPos - yUnit/8, Ani.EXPO_IN_OUT);
  Ani idleReturn = new Ani(this,1,1,"yPos",defaultyPos,Ani.EXPO_IN_OUT,"onEnd:idle");
  Ani atkStart = new Ani(this,0.1,"xPos",player.defaultxPos-player.actorW/2,Ani.LINEAR);
  Ani atkReturn = new Ani(this,0.5,0.1,"xPos",defaultxPos,Ani.EXPO_OUT);
  Ani recoilStart = new Ani(this, 0.1, 0.2, "xPos", xPos + xUnit/6, Ani.LINEAR);
  Ani recoilReturn = new Ani(this,0.2,0.3,"xPos",defaultxPos,Ani.EXPO_OUT);
  
  void attack() {
    atkStart.start();
    atkReturn.start();
  }
  
  void idle() {
    idleStart.start();
    idleReturn.start();
  }
  
  void recoil() {
    if (atkStart.isPlaying() == false && atkReturn.isPlaying() == false) {
      recoilStart.start();
      recoilReturn.start();
    }
  }
  
}
