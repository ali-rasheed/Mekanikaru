int numJacks = 8;
int numPlugs = 5;

int[] plugInstructions;

int[] letterPos = new int[numPlugs]; 
int[] numberPos = new int[numJacks];

//String[] jackModInstructions;

void drawJackMod(){
  image(jackBg, jackPos.x+xOffset, jackPos.y+yOffset);
  
  pushMatrix();
  translate(jackPos.x, jackPos.y);
  strokeWeight(3);
  stroke(255);
  for(int i =0; i < numPlugs; i++){
    line(78,letterPos[i], 318,numberPos[plugInstructions[i]-1]);
  }
  
  //println(plugInstructions);
  
  
  popMatrix();
}

                             
boolean testIfHeadphoneTaskDone() {
  int numCorrect = 0;
  
  for(int i = 0; i < numPlugs; i++) {  //Check how many times for how many plugs exist
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
  //jackModInstructions = new String[numPlugs];
  
  for(int i = 0; i < numPlugs; i++){
    plugInstructions[i] = i;
    plugInstructions[i]++;
    
    //char c = (char) (i+65); // This converts the current position to a character. when i = 0 c = A, i = 1 c = B, ect.
    //jackModInstructions[i] = c + " to " + plugInstructions[i]; //Generates the instructiosn as A to num, B to num, ect. 
  }
  
  //Creating the positions for the numbers
  for(int i = 0; i < numberPos.length; i++){
    numberPos[i] = 10+(i*23);
  }
  //Creating the positions for the letters
  for(int i = 0; i < letterPos.length; i++){
    letterPos[i] = 21+(i*35);
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
  //for(int i = 0; i < numPlugs; i++){
  //  char c = (char) (i+65); // This converts the current position to a character. when i = 0 c = A, i = 1 c = B, ect.
  //  jackModInstructions[i] = c + " to " + plugInstructions[i]; //Generates the instructiosn as A to num, B to num, ect. 
  //}
}
