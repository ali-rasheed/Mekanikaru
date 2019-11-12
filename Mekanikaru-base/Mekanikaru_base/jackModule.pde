String[] gamestructions = {"Connect A to 1 and B to 2", "Connect A to 2 and B to 1", 
                             "Disconnect A and Connect B to 1", "Disconnect A and Connect B to 2",
                             "Connect A to 1 and Disconnect B", "Connect A to 2 and Disconnect B"};
                             
boolean testIfHeadphoneTaskDone() {
  if(jackTask == 0){
    if(jA1 == true && jA2 == false && jB1 == false && jB2 == true){
      return true;
    }else return false;
  }
  
  if(jackTask == 1){
    if(jA1 == false && jA2 == true && jB1 == true && jB2 == false){
      return true;
    }else return false;
  }
  
  if(jackTask == 2){
    if(jA1 == false && jA2 == false && jB1 == true && jB2 == false){
      return true;
    }else return false;
  }
  
  if(jackTask == 3){
    if(jA1 == false && jA2 == false && jB1 == false && jB2 == true){
      return true;
    }else return false;
  }
  
  if(jackTask == 4){
    if(jA1 == true && jA2 == false && jB1 == false && jB2 == false){
      return true;
    }else return false;
  }
  
  if(jackTask == 5){
    if(jA1 == false && jA2 == true && jB1 == false && jB2 == false){
      return true;
    }else return false;
  }
  
  return false;
}
