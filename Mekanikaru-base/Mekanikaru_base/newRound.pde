void newRound(){
  //When the game is on Level 0
  if(gameLevel == 0){
    modPreviousStatus = new boolean[modRoundStatus.length];
    arrayCopy(modRoundStatus, modPreviousStatus); //Copy the current status to hold for comparing to see if it changes
    
    for(int i = 0; i < modRoundStatus.length; i++) modRoundStatus[i] = false; //Clear the mod status
    level0Round++; //Increase the level round
    
    if (level0Round == 0){
      modRoundStatus[0] = true; //Switch
    }
    
    if (level0Round == 1){
      modRoundStatus[1] = true; //Dial
    }
    
    if (level0Round == 2){
      modRoundStatus[2] = true; //Jack
    }
    
    if (level0Round == 3){
      modRoundStatus[3] = true; //LED
    }
    
    if(level0Round >= 4) gameLevel++; //If the level 0 round is above 3, go to next level
  } //Level 0 done
  
  //Level 1 has 1 mod active
  if(gameLevel == 1){
    modPreviousStatus = new boolean[modRoundStatus.length];
    arrayCopy(modRoundStatus, modPreviousStatus); //Copy the current status to hold for comparing to see if it changes
    
    while(compareBooleanArrays(modRoundStatus, modPreviousStatus)){  
      for(int i = 0; i < modRoundStatus.length; i++) modRoundStatus[i] = false; //Clear the mod status
      
      int randMod = (int) random(4);
      modRoundStatus[randMod] = true;
    }
    
    if(level1Round >= level1NumRounds) gameLevel++;
    
    level1Round++;
    
  }
  
  //Level 2 has 2 mods active 
  if(gameLevel == 2){
    modPreviousStatus = new boolean[modRoundStatus.length];
    arrayCopy(modRoundStatus, modPreviousStatus); //Copy the current status to hold for comparing to see if it changes
    
    while(compareBooleanArrays(modRoundStatus, modPreviousStatus)){
      for(int i = 0; i < modRoundStatus.length; i++) modRoundStatus[i] = false; //Clear the mod status
      
      int randMod = (int) random(4);
      modRoundStatus[randMod] = true;
      
      int randMod2 = randMod;
      while(randMod2 == randMod){
        randMod2 = (int) random(4);
      }
      
      modRoundStatus[randMod2] = true;
    }
    
    
    if(level2Round >= level2NumRounds) gameLevel++;
    
    level2Round++;
    
  }
  
  //Level 3 has all 4 mods active
  if(gameLevel == 3){
    for(int i = 0; i < modRoundStatus.length; i++) modRoundStatus[i] = true;
  }
  
  //Set the current status of the mods to the same as the status for that round
  arrayCopy(modRoundStatus, modStatus); 
}
