class Actor {
  
  float xPos, yPos, actorW, actorH;
  
  Actor(float x, float y, float w, float h) {
    xPos = x;
    yPos = y;
    actorW = w;
    actorH = h;
  }
  
  void render() {
    fill(0);
    noStroke();
    ellipse(xPos,yPos,actorW,actorH);
  }
  
  
  
}
