int numJacks = 5;
int numPlugs = 3;

int[] plugInstructions;

String[] jackModInstructions;

                             
boolean testIfHeadphoneTaskDone() {
  int numCorrect = 0;
  //println(plugInstructions);
  
  for(int i = 0; i < numPlugs; i++) {  //Check how many times for how man plugs exist
    if(i == 0) {
      if(jA == plugInstructions[i]) numCorrect++;
    }
    
    if(i == 1) {
      if(jB == plugInstructions[i]) numCorrect++;
    }
    
    if(i == 2) {
      if(jC == plugInstructions[i]) numCorrect++;
    }
  }
  
  if(numCorrect >= numPlugs) return true;
  else return false;
  
}

void initializeJackMod(){
  plugInstructions = new int[numPlugs];
  jackModInstructions = new String[numPlugs];
  
  for(int i = 0; i < numPlugs; i++){
    plugInstructions[i] = i;
    plugInstructions[i]++;
    
    char c = (char) (i+65); // This converts the current position to a character. when i = 0 c = A, i = 1 c = B, ect.
    jackModInstructions[i] = c + " to " + plugInstructions[i]; //Generates the instructiosn as A to num, B to num, ect. 
  }
  
}

void resetJackMod(){
  //Make an array containing all the jack numbers. For 8 its {1,2,3,4,5,6,7,8}
  int[] stillAvailible = new int[numJacks];
  for(int i = 0; i < stillAvailible.length; i++){
    stillAvailible[i] = i+1;
  }
  
  //For each plug, pick a random jack to plug into, check if that plug has already been taken
  for(int i = 0; i < numPlugs; i++){
    int randomNum = (int)random(1,numJacks+1); //Pick a random number between 1 and the number of jacks
    
    while(stillAvailible[randomNum-1] == 0){
      randomNum = (int)random(1,numJacks+1); //If the position = 0 it means its been taken, try picking another random spot
    }
    
    stillAvailible[randomNum-1] = 0; //Remove the number from the still availible numbers
    plugInstructions[i] = randomNum; //If the spot isn't taken (it got past the while loop) make the plug instrution equal that number 
  }
  
  //Resetting the string of instructions
  for(int i = 0; i < numPlugs; i++){
    char c = (char) (i+65); // This converts the current position to a character. when i = 0 c = A, i = 1 c = B, ect.
    jackModInstructions[i] = c + " to " + plugInstructions[i]; //Generates the instructiosn as A to num, B to num, ect. 
  }
}
