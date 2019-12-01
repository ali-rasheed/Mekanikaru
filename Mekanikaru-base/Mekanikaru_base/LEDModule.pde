  String[] rColours = {"255", "255", "255", "0", "0", "128"};
  String[] gColours = {"0", "165", "255", "255", "0", "0"};
  String[] bColours = {"0", "0", "0", "0", "255", "128"};
  
  int led1A, led2A;
  
  String ledInstructions;
  
  void drawLEDMod(){
    image(LEDBg,LEDPos.x+xOffset, LEDPos.y+yOffset);
    
    pushMatrix();
      fill(255);
      textSize(24);
      
      translate(LEDPos.x,LEDPos.y);
      
      text(rColours[led1A],70,70);
      text(gColours[led1A],70,110);
      text(bColours[led1A],70,150);
      
      text(rColours[led2A],260,70);
      text(gColours[led2A],260,110);
      text(bColours[led2A],260,150);
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
