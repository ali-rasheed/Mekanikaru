int jackTask = 0; //0-Ain1,Bin2 1-Ain2,Bin1 2-AinNone, Bin1 3-AinNone, Bin2 4-Ain1, BinNone 5-Ain2, BinNone

              //    A | B
              // 0: 1 | 2
              // 1: 2 | 1
              // 2: / | 1
              // 3: / | 2
              // 4: 1 | /
              // 5: 2 | /

String[] jackInstructions = {"Connect A to 1 and B to 2", "Connect A to 2 and B to 1", 
                             "Disconnect A and Connect B to 1", "Disconnect A and Connect B to 2",
                             "Connect A to 1 and Disconnect B", "Connect A to 2 and Disconnect B"};
                             
boolean testIfHeadphoneTaskDone() {
  if(jackTask == 0){
    if(jA1 == 1 && jA2 == 0 && jB1 == 0 && jB2 == 0){
      return true;
    }else return false;
  }
  
  if(jackTask == 1){
    if(jA1 == 0 && jA2 == 0 && jB1 == 0 && jB2 == 0){
      return true;
    }else return false;
  }
  
  if(jackTask == 2){
    if(jA1 == 0 && jA2 == 0 && jB1 == 0 && jB2 == 0){
      return true;
    }else return false;
  }
  
  if(jackTask == 3){
    if(jA1 == 0 && jA2 == 0 && jB1 == 0 && jB2 == 0){
      return true;
    }else return false;
  }
  
  if(jackTask == 4){
    if(jA1 == 0 && jA2 == 0 && jB1 == 0 && jB2 == 0){
      return true;
    }else return false;
  }
  
  if(jackTask == 5){
    if(jA1 == 0 && jA2 == 0 && jB1 == 0 && jB2 == 0){
      return true;
    }else return false;
  }
  
  return false;
}
