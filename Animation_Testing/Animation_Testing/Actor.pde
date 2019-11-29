class Actor {
  
  float xPos, yPos, actorW, actorH;
  boolean idle;
  PImage sprite;
  
  Actor(float x, float y, float w, float h) {
    xPos = x;
    yPos = y;
    actorW = w;
    actorH = h;
  }
  
  void render() {
    image(sprite,xPos-sprite.width/2,yPos-sprite.height/2);
  }
  
}
