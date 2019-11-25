class Enemy extends Actor {
  
  Enemy(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  
  void render() {
    fill(255,0,0);
    noStroke();
    ellipse(xPos,yPos,actorW,actorH);
  }
  
  void attack() {
    
  }
  
}
