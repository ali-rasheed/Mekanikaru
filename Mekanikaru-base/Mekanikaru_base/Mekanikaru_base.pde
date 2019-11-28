//  You always need to import the serial library in addition to the VSync library
import processing.serial.*;
import vsync.*;


//  We create a new ValueReceiver to receive values from the arduino
ValueReceiver dialReceiver, LEDReceiver, switchReceiver, jackReceiver;
ValueSender LEDSender, dialSender;

//Serial Communications
Serial dialArduino, LEDArduino, switchArduino, jackArduino;

//*** Module Specific Values***//
//Dial Values
public int dialVal;
public int leftGauge, rightGauge, targetDial =0, confirm, motorSet;

//LED Values
public int RGB1, RGB2;
public int LEDReset;

//switch Values
public int switchA, switchB, switchC, switchD, switchE;

//jackValues
public int jA;
public int jB;
public int jC;

//*****Game Values*****//
//If the Mod is active or not, the current status. These switch off as the round progresses
boolean modStatus[] = new boolean[4]; // 0:Switch 1:Dial 2:Jack 3: LED

//The status of the mods for that round, does not change as mods are completed within that round
boolean modRoundStatus[] = new boolean[4]; 

//Array to track how the mods were at the start of resetting a round, this is so the same mods don't show up twice in a row
boolean modPreviousStatus[] = new boolean[4];

//Boolean array with all mods false, to test against to see if all mods have been completed
boolean allModsOff[] = new boolean[4];

//The level dictates how many mods are active
int gameLevel = 0; //Level 0 - Each module in a row S-D-J-L
                   //Level 1 - 1 Module at a time, random
                   //Level 2 - 2 Modules at a time, random
                   //Level 3 - 4 Modules at a time, random
              
int level0NumRounds = 4;                  
int level0Round = 0; //For level 0 go through each Module
                     //0 = Switch
                     //1 = Dial
                     //2 = Jack
                     //3 = LED

int level1NumRounds = 6;
int level1Round = 0;

int level2NumRounds = 10;
int level2Round = 0;

int level3NumRounds = 0; //Never ending
int level3Round = 0;


//Tracking game values
int score = 0;
float maxTimer = 400;
float timer = maxTimer;

PImage bg;

//***Testing Stuff***//
boolean testingWithoutArduinos = true;

void setup() 
{
  size(1002, 1002);

  bg = loadImage("267Background.png");

if(testingWithoutArduinos == false) {
  dialArduino = new Serial(this, "COM5", 11000);
  LEDArduino = new Serial(this, "COM4", 9600);
  LEDSender = new ValueSender(this, LEDArduino);
  dialSender = new ValueSender(this, dialArduino);
  LEDReset = 0;
  switchArduino = new Serial(this, "COM3", 5000);
  jackArduino = new Serial(this, "COM6", 12600);
  dialReceiver = new ValueReceiver(this, dialArduino);
  LEDReceiver = new ValueReceiver(this, LEDArduino);
  switchReceiver = new ValueReceiver(this, switchArduino);
  jackReceiver = new ValueReceiver(this, jackArduino);

  // Tell the ValueReceiver what variable you want to synchronize from the arduino to this sketch.
  //dialReceiver.observe("analogValue1");
  //switchReceiver.observe("analogValue1");

  LEDReceiver.observe("RGB1");
  LEDReceiver.observe("RGB2");
  LEDReceiver.observe("LEDReset");
  LEDSender.observe("LEDReset");

  switchReceiver.observe("switchA");
  switchReceiver.observe("switchB");
  switchReceiver.observe("switchC");
  switchReceiver.observe("switchD");
  switchReceiver.observe("switchE");

  dialReceiver.observe("dialVal");
  dialReceiver.observe("confirm");
  dialSender.observe("leftGauge");
  dialSender.observe("rightGauge");
  dialSender.observe("motorSet");


  jackReceiver.observe("jA");
  jackReceiver.observe("jB");
  jackReceiver.observe("jC");
}

  //Init the allModsOff array
  for (int i =0; i < allModsOff.length; i++){
      allModsOff[i] = false;
   }
   
  //Start all Mods as being off
  for (int i =0; i < modStatus.length; i++){
    modStatus[i] = false;
  }
  //Start the first one
  modStatus[0] = true;

  initializeJackMod();
  setSwitchInstruction();
  setLedInstruction();
  //dialSet();
}

void draw() 
{
  //***Testing Functions***//
  //println("rgb1: " +RGB1);
  //println("rgb1: " +RGB2);

  //println("switchA: " +switchA);
  //println("switchB: " +switchB);
  //println("switchC: " +switchC);
  //println("switchD: " +switchD);
  //println("switchE: " +switchE);
  //println(millis());

  //println("dialVal: " +dialVal);

  //println("jackA: " +jA);
  //println("jackB: " +jB);
  //println("jackC: " +jC);
  
  //Testing
  println(modStatus);
  
  print("Level 0 Round ");
  println(level0Round);
  
  print("Level 1 Round ");
  println(level1Round);
  
  print("Level 2 Round ");
  println(level2Round);
  
  print("Level 3 Round ");
  println(level3Round);
  
  print("Game Level");
  println(gameLevel);
  
  println(millis());
  

  //***Reset Each Draw***//
  LEDReset = 0;
  setMatrix(); //This is for the dial Mod but I don't know why it needs to be here
  

  //*****Playing The Game*****//
  
    //***Drawing the Game***//
    
    //Drawing Background (Change this to the full game Background
    background(bg);
    
      //Switch Mod
      if (modStatus[0]) {
        fill(250);
        textSize(18);
        text(switchInstructions, 690, 220);
        text(switchInstructions2, 690, 250);
        text(switchInstructions3, 690, 280);
    
        if (testIfSwitchTaskDone() == true) {
          completedSwitch();
        }
      }
    
      //Dial Mod
      if (modStatus[1]) {
        checkDialMatch();
        
        textSize(15);
        text("the target gauge: " +targetDial, 690, 960);
        text("the current gauge: " +dialVal, 690, 980);
        text("the current gauge: " +confirm, 690, 990);
        
        if (dialTaskDone == true){
          //completedDial(); //Auto-winning right now
        }
      }
  
      //Jack Module
      if (modStatus[2]) {
        fill(250);
        textSize(28);
        text("CONNECT", 180, 180);
        textSize(24);
        text(jackModInstructions[0], 200, 220);
        text(jackModInstructions[1], 200, 250);
        text(jackModInstructions[2], 200, 280);
        fill(255);
    
        if (testIfHeadphoneTaskDone() == true) {
          completedJack();
        }
      }
  
     //LED Module
      if (modStatus[3]) {
        fill(255);
        textSize(16);
        text(ledInstructions, 76, 680);
    
        if (ledTaskDone() == true) {
          completedLED();
        }
      }
  
      //Testing
      //Drawing Score
      fill(255);
      textSize(26);
      text("Score : "+score, 850, 35);


   //*** Updating the game ***//
   if(timer > 0) timer-= 0.1;
   
   //Testing if all mods have been done
   if(compareBooleanArrays(modStatus, allModsOff)){
     score++;
     timer = maxTimer;
     newRound();
   }
   
  // if (timer <= 0) gameOver();
  text(timer, 50,50);
}

void gameOver(){
  background(0);
  fill(255);
  text("Game Over", 220, 300);
}

void newRound(){
  //When the game is on Level 0
  if(gameLevel == 0){
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

void resetGame(){
  score = 0;
  timer = maxTimer;
  
  //Start all Mods as being off
  for (int i =0; i < modStatus.length; i++){
    modStatus[i] = false;
    modRoundStatus[i] = false;
  }
  //Start the first one
  modRoundStatus[0] = true;
  modStatus[0] = true;
  
  //Reset the levels
  gameLevel = 0;
  
  level0Round = 0;
  level1Round = 0;
  level2Round = 0;
  level3Round = 0;
}

void completedSwitch(){
  setSwitchInstruction();
  modStatus[0] = false;
}

void completedDial(){
   dialSet();
   modStatus[1] = false;
}

void completedJack(){
  resetJackMod();
  modStatus[2] = false;
}

void completedLED(){
  setLedInstruction();
  modStatus[3] = false;
}

boolean compareBooleanArrays(boolean[] a, boolean[] b){
  int count = 0;
  
  for(int i = 0; i<a.length; i++){
    if(a[i] == b[i]) count++;
  }
  
  if (count >= a.length) return true;
    else return false;
}

void keyPressed(){
  if(keyCode == UP) newRound();
  if(key == 'r') resetGame();
  
  //Testing
  if(key == '1') completedSwitch();
  if(key == '2') completedDial();
  if(key == '3') completedJack();
  if(key == '4') completedLED();
}
