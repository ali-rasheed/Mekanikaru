//String[] switches = {"ON", "OFF"};
int[] switchState = {0,0,0,0,0,0,0,0,0,0};
int[] lastSwitch = {0,0,0,0,0,0,0,0,0,0};

int leftXpos = 338;
int rightXpos = 470;

int dotSize = 30;

//String switchInstructions, switchInstructions2, switchInstructions3;


void drawSwitchMod(){
  image(switchBg, switchPos.x+xOffset, switchPos.y+yOffset);
  
  pushMatrix();
  translate(switchPos.x, switchPos.y);
    //fill(0,0,200);
    fill(255);
    
    if(switchState[0] == 1) ellipse(404,54,dotSize,dotSize);
    
    if(switchState[1] == 1) ellipse(leftXpos,117,dotSize,dotSize);
    if(switchState[2] == 1) ellipse(leftXpos,180,dotSize,dotSize);
    if(switchState[3] == 1) ellipse(leftXpos,239,dotSize,dotSize);
    if(switchState[4] == 1) ellipse(leftXpos,304,dotSize,dotSize);
    
    if(switchState[5] == 1) ellipse(404,367,dotSize,dotSize);
    
    
    if(switchState[9] == 1) ellipse(rightXpos,117,dotSize, dotSize);
    if(switchState[8] == 1) ellipse(rightXpos,180,dotSize, dotSize);
    if(switchState[7] == 1) ellipse(rightXpos,239,dotSize, dotSize);
    if(switchState[6] == 1) ellipse(rightXpos,304,dotSize, dotSize);
    
  popMatrix();
}


void setSwitchInstruction() {
  for(int i = 0; i < switchState.length; i++){
    switchState[i] = (int)random(0, 2);
    lastSwitch[i] = switchState[i];
    //switchState[i] = 1;
  }
  
  println(switchState);

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
  println();
  println(switchState);
  if (state1 == switchState[0] && state2 == switchState[1] && state3 == switchState[2] && state4 == switchState[3] && state5 == switchState[4]
      && state6 == switchState[5] && state7 == switchState[6] && state8 == switchState[7] && state9 == switchState[8] && state10 == switchState[9]) {
    return true;
  } else {
    return false;
  }
}
