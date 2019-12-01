class Enemy extends Actor {
  
  PImage sprite2;
  PImage sprite3;
  
  Enemy(float x, float y, float w, float h) {
    super(x, y, w, h);
    sprite = loadImage("Assets/Monster.png");
    sprite2 = loadImage("Assets/Monster2.png");
    sprite3 = loadImage("Assets/Monster.png");
    sprite.resize(sprite.width/2,sprite.height/2);
    sprite2.resize(sprite2.width/2,sprite2.height/2);
    sprite3.resize(sprite3.width/2,sprite3.height/2);
  }
  
  float defaultxPos = xPos;
  float defaultyPos = yPos;
  int monsterVar = 0;
  
  //ANIMATIONS
  Ani idleStart = new Ani(this, 1, "yPos", yPos - yUnit/8, Ani.EXPO_IN_OUT);
  Ani idleReturn = new Ani(this,1,1,"yPos",defaultyPos,Ani.EXPO_IN_OUT,"onEnd:idle");
  Ani atkStart = new Ani(this,0.1,"xPos",player.defaultxPos-player.actorW/2,Ani.LINEAR);
  Ani atkReturn = new Ani(this,0.5,0.1,"xPos",defaultxPos,Ani.EXPO_OUT);
  Ani recoilStart = new Ani(this, 0.1, 0.2, "xPos", xPos + xUnit/6, Ani.LINEAR);
  Ani recoilReturn = new Ani(this,0.2,0.3,"xPos",defaultxPos,Ani.EXPO_OUT);
  
  Ani fadeOut = new Ani(this, 0.1, "transparency", 0, Ani.EXPO_IN);
  Ani fadeIn = new Ani(this, 0.3, 0.6, "transparency", 255, Ani.EXPO_OUT);
  
  void render() {
    tint(255,transparency);
    if (monsterVar == 0) {
      timerWindow.image(sprite,xPos-sprite.width/2,yPos-sprite.height/2);
    }
    if (monsterVar == 1) {
      timerWindow.image(sprite2,xPos-sprite.width/2,yPos-sprite.height/2);
    }
    if (monsterVar == 2) {
      timerWindow.image(sprite3,xPos-sprite.width/2,yPos-sprite.height/2);
    }
    timerWindow.tint(255,255);
  }
  
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
  
  void die() {
    recoilStart.start();
    fadeOut.start();
    fadeIn.start();
    recoilReturn.start();
  }
  
  void newMonster() {
    monsterVar = int(random(0,3));
  }
  
}
