String[] switches = {"ON", "OFF"};

int switch1, switch2, switch3, switch4, switch5;

String switchInstructions, switchInstructions2, switchInstructions3;

int lastSwitch1 = 0;
int lastSwitch2 = 0;
int lastSwitch3 = 0;
int lastSwitch4 = 0;
int lastSwitch5 = 0;


void setSwitchInstruction() {
  switch1 = (int)random(0, 2); //Be 0 or 1
  switch2 = (int)random(0, 2);
  switch3 = (int)random(0, 2);
  switch4 = (int)random(0, 2);
  switch5 = (int)random(0, 2);
  
  while(switch1 == lastSwitch1 && switch2 == lastSwitch2 && switch3 == lastSwitch3
        && switch4 == lastSwitch4 && switch5 == lastSwitch5) {
          switch1 = (int)random(0, 2); //Be 0 or 1
          switch2 = (int)random(0, 2);
          switch3 = (int)random(0, 2);
          switch4 = (int)random(0, 2);
          switch5 = (int)random(0, 2);
        }
        
  lastSwitch1 = switch1;
  lastSwitch2 = switch2;
  lastSwitch3 = switch3;
  lastSwitch4 = switch4;
  lastSwitch5 = switch5;


  switchInstructions = "SwitchA: " + switches[switch1] + "  |  SwitchB: " + switches[switch2] ;
  switchInstructions2 = "SwitchC: " + switches[switch3] + "  |  SwitchD: " + switches[switch4] ;
  switchInstructions3 = "SwitchE: " + switches[switch5] + " . ";
}



boolean testIfSwitchTaskDone() {
  if (switchA == switch1 && switchB == switch2 && switchC == switch3 && switchD == switch4 && switchE == switch5) {
    return true;
  } else {
    return false;
  }
}
