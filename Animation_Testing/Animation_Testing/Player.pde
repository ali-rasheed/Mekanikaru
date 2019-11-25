class Player extends Actor {
  
  Player(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  
  float defaultxPos = xPos;
  float defaultyPos = yPos;
  
  void render() {
    fill(0,0,255);
    noStroke();
    ellipse(xPos,yPos,actorW,actorH);
  }
  
  void attack() {
    
  }
  
}
