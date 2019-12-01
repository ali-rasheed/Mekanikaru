class Module {
  
  int xPos, yPos, modW, modH;
  
  Module(int x, int y, int w, int h) {
    xPos = x;
    yPos = y;
    modW = w;
    modH = h;
  }
  
  void render() {
    timerWindow.fill(255);
    noStroke();
    timerWindow.rect(xPos,yPos,modW,modH);
  }
  
}
