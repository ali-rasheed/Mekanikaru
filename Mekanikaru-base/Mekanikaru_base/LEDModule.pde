  String[] rColours = {"255", "0", "0", "255", "255", "255"};
  String[] gColours = {"0", "255", "0", "155", "0", "255"};
  String[] bColours = {"0", "0", "255", "0", "255", "0"};
  
  int led1A, led2A;
  
  String ledInstructions;
  
  void drawLEDMod(){
    image(LEDBg,LEDPos.x+xOffset, LEDPos.y+yOffset);
    
    pushMatrix();
      fill(255);
      textFont(numFont, 60);
      textAlign(CENTER);
      //textSize(24);
      
      translate(LEDPos.x,LEDPos.y);
      
      text(rColours[led1A],220,172);
      text(gColours[led1A],220,252);
      text(bColours[led1A],220,332);
      
      text(rColours[led2A],594,172);
      text(gColours[led2A],594,252);
      text(bColours[led2A],594,332);
    popMatrix();
  }
  
  void initLEDMod(){
    led1A = 4;
    led2A = 4;
  }
  
  void setLedInstruction() {
    led1A = (int)random(0,5);
    led2A = (int)random(0,5);
    LEDReset = 1;
  }
  
  boolean ledTaskDone() {
    if (RGB1 == led1A && RGB2 == led2A) {
      return true;
    } else {
      return false;
    }
  }
