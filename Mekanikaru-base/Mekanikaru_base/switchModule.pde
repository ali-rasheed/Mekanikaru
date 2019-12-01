//String[] switches = {"ON", "OFF"};
int[] switchState = {0,0,0,0,0,0,0,0,0,0};
int[] lastSwitch = {0,0,0,0,0,0,0,0,0,0};

//String switchInstructions, switchInstructions2, switchInstructions3;


void drawSwitchMod(){
  image(switchBg, switchPos.x+xOffset, switchPos.y+yOffset);
}


void setSwitchInstruction() {
  for(int i = 0; i < switchState.length; i++){
    switchState[i] = (int)random(0, 2);
    lastSwitch[i] = switchState[i];
  }
  //switch1 = (int)random(0, 2); //Be 0 or 1
  //switch2 = (int)random(0, 2);
  //switch3 = (int)random(0, 2);
  //switch4 = (int)random(0, 2);
  //switch5 = (int)random(0, 2);
  
  //Not sure if checking for copy is needed with 10 switches
  //while(switch1 == lastSwitch1 && switch2 == lastSwitch2 && switch3 == lastSwitch3
  //      && switch4 == lastSwitch4 && switch5 == lastSwitch5) {
  //        switch1 = (int)random(0, 2); //Be 0 or 1
  //        switch2 = (int)random(0, 2);
  //        switch3 = (int)random(0, 2);
  //        switch4 = (int)random(0, 2);
  //        switch5 = (int)random(0, 2);
  //      }
        
  //lastSwitch1 = switch1;
  //lastSwitch2 = switch2;
  //lastSwitch3 = switch3;
  //lastSwitch4 = switch4;
  //lastSwitch5 = switch5;
  



  //switchInstructions = "SwitchA: " + switches[switch1] + "  |  SwitchB: " + switches[switch2] ;
  //switchInstructions2 = "SwitchC: " + switches[switch3] + "  |  SwitchD: " + switches[switch4] ;
  //switchInstructions3 = "SwitchE: " + switches[switch5] + " . ";
}



boolean testIfSwitchTaskDone() {
  if (switchA == switchState[0] && switchB == switchState[1] && switchC == switchState[2] && switchD == switchState[3] && switchE == switchState[4]
      && switchF == switchState[5] && switchG == switchState[6] && switchH == switchState[7] && switchI == switchState[8] && switchJ == switchState[9]) {
    return true;
  } else {
    return false;
  }
}
