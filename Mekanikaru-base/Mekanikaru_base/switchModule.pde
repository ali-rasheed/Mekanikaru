String[] switches = {"ON", "OFF"};

int switch1, switch2, switch3, switch4, switch5;

String switchInstructions, switchInstructions2, switchInstructions3;

void setSwitchInstruction() {
  switch1 = (int)random(0, 2); //Be 0 or 1
  switch2 = (int)random(0, 2);
  switch3 = (int)random(0, 2);
  switch4 = (int)random(0, 2);
  switch5 = (int)random(0, 2);


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
