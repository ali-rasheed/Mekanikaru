//boolean testIfRGBLEDTaskDone() {
//  if (LEDtask == 0){
//    if(LED1StoppedOn == 1 && LED2StoppedOn == 2) return true;
//  }else return false;
  
//  return false;
//}

String[] ledColours = {"red","orange","yellow","green","blue","purple"};

int led1A, led2A;

String ledInstruction() {
  led1A = (int)random(0,5);
  led2A = (int)random(0,5);
  String l = "Stop light A on " + ledColours[led1A] + ", and light B on " + ledColours[led2A] + ".";
  return l;
}

boolean ledTaskDone() {
  if (RGB1 == led1A && RGB2 == led2A) {
    return true;
  } else {
    return false;
  }
}
