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
  
  float transparency = 255;
  
}
