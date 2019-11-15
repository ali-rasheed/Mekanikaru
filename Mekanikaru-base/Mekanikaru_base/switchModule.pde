String[] switches = {"ON", "OFF", "ON", "ON", "OFF"};

int switch1, switch2, switch3, switch4, switch5;



String switchInstruction() {
  switch1 = (int)random(0, 5);
  switch2 = (int)random(0, 5);
  switch3 = (int)random(0, 5);
  switch4 = (int)random(0, 5);
  switch5 = (int)random(0, 5);


  String s = "SwitchA: " + switches[switch1] + "  |  SwitchB: " + switches[switch2] + "  |  SwitchC: " + switches[switch3] + "  |  SwitchD: " + switches[switch4] + "  |  SwitchE: " + switches[switch5] + " . ";
  return s;

}


boolean testIfSwitchTaskDone() {
  if (switchA == switch1 && switchB == switch2 && switchC == switch3 && switchD == switch4 && switchE == switch5) {
    return true;
  } else {
    return false;
  }
}
