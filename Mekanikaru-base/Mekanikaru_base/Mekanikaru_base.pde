//  You always need to import the serial library in addition to the VSync library
import processing.serial.*;
import vsync.*;

//Animation library
import de.looksgood.ani.*;

//Animation Variables
Player player;
Enemy enemy;

ArrayList<Module> modules = new ArrayList<Module>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

float setTransparency = 0;

//Multiple Screens
SecondWindow timerWindow;

//Main Screen Values
int xUnit;
int yUnit;
int modHeight;
int modWidth;

int xOffset = -10;
int yOffset = -30;

//Module positions
PVector switchPos, dialPos, jackPos, LEDPos;


//Writing the highScore with .txt file
PrintWriter highScoreWriting;

//JSON Array for high score
JSONArray jsonArray;
JSONArray jsonArrayNumbers, jsonArrayNames;

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
public int switchA, switchB, switchC, switchD, switchE, switchF, switchG, switchH, switchI, switchJ;

//jackValues
public int jA;
public int jB;
public int jC;
public int jD;
public int jE;

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
float maxTimer = 100;
float timer = maxTimer;

boolean isGameOver;

//Game over screen
int letter1 = 65; //Int version of a
int letter2 = 65;
int letter3 = 65;
int letterSelected = 1;
String name;

PImage bg, switchBg, dialBg, jackBg, LEDBg;

//***Testing Stuff***//
boolean testingWithoutArduinos = true;

void settings() {
  bg = loadImage("Assets/Background.png");
  switchBg = loadImage("Assets/SwitchMod.png");
  dialBg = loadImage("Assets/DialMod.png");
  jackBg = loadImage("Assets/JackMod.png");
  LEDBg = loadImage("Assets/LEDMod.png");
  
  //Resize the image to not be fullscreen for testing
  bg.resize(0,540);
  switchBg.resize(0,240);
  dialBg.resize(0,240);
  jackBg.resize(0,240);
  LEDBg.resize(0,240);
  

  size(bg.width, bg.height);
  
}

void setup() 
{
  
  //Main Window
  xUnit = width/15;
  yUnit = height/9;
  modHeight = yUnit*3;
  modWidth = xUnit*6;
  
  //Mod Positions
  switchPos = new PVector(1*xUnit, 1*yUnit);
  dialPos = new PVector(8*xUnit, 1*yUnit);
  jackPos = new PVector(1*xUnit, 5*yUnit);
  LEDPos = new PVector(8*xUnit, 5*yUnit);
  
  //Second Window
  timerWindow = new SecondWindow();
  
  //HighScore Writing
  //highScoreWriting = createWriter("highScores.txt");
  
  //JSON array
  //jsonArray = loadJSONArray("JsonTest/data.json");
  
  jsonArrayNumbers = loadJSONArray("JsonTest/highScoreNumbers.json");
  jsonArrayNames = loadJSONArray("JsonTest/highScoreNames.json");


if(testingWithoutArduinos == false) {
  dialArduino = new Serial(this, "COM5", 11000);
  LEDArduino = new Serial(this, "COM4", 9600);
  LEDSender = new ValueSender(this, LEDArduino);
  dialSender = new ValueSender(this, dialArduino);
  LEDReset = 0;
  switchArduino = new Serial(this, "COM3", 5000);
  jackArduino = new Serial(this, "COM2", 12600);
  dialReceiver = new ValueReceiver(this, dialArduino);
  LEDReceiver = new ValueReceiver(this, LEDArduino);
  switchReceiver = new ValueReceiver(this, switchArduino);
  jackReceiver = new ValueReceiver(this, jackArduino);

  LEDReceiver.observe("RGB1");
  LEDReceiver.observe("RGB2");
  LEDReceiver.observe("LEDReset");
  LEDSender.observe("LEDReset");

  switchReceiver.observe("switchA");
  switchReceiver.observe("switchB");
  switchReceiver.observe("switchC");
  switchReceiver.observe("switchD");
  switchReceiver.observe("switchE");
  switchReceiver.observe("switchF");
  switchReceiver.observe("switchG");
  switchReceiver.observe("switchH");
  switchReceiver.observe("switchI");
  switchReceiver.observe("switchJ");

  dialReceiver.observe("dialVal");
  dialReceiver.observe("confirm");
  dialSender.observe("leftGauge");
  dialSender.observe("rightGauge");
  dialSender.observe("motorSet");


  jackReceiver.observe("jA");
  jackReceiver.observe("jB");
  jackReceiver.observe("jC");
  jackReceiver.observe("jD");
  jackReceiver.observe("jE");
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
  initLEDMod();
  setSwitchInstruction();
  //setLedInstruction();
  dialSet();
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

  println("jackA: " +jA);
  println("jackB: " +jB);
  println("jackC: " +jC);
  println("jackC: " +jD);
  println("jackC: " +jC);

  //Testing
  //println(modStatus);
  
  //print("Level 0 Round ");
  //println(level0Round);
  
  //print("Level 1 Round ");
  //println(level1Round);
  
  //print("Level 2 Round ");
  //println(level2Round);
  
  //print("Level 3 Round ");
  //println(level3Round);
  
  //print("Game Level");
  //println(gameLevel);
  
  //println(millis());
  

  //***Reset Each Draw***//
  LEDReset = 0;
  setMatrix(); //This is for the dial Mod but I don't know why it needs to be here
  

  //*****Playing The Game*****//
  
    //***Drawing the Game***//
    
    //Drawing Background (Change this to the full game Background
    background(bg);
    
      //Switch Mod
      if (modStatus[0]) {        
        drawSwitchMod();
    
        if (testIfSwitchTaskDone() == true) {
          completedSwitch();
        }
      }
    
      //Dial Mod
      if (modStatus[1]) {
        checkDialMatch();
        drawDialMod();
        
        if (dialTaskDone == true){
          completedDial(); //Auto-winning right now
        }
      }
  
      //Jack Module
      if (modStatus[2]) {      
        drawJackMod();
    
        if (testIfHeadphoneTaskDone() == true) {
          completedJack();
        }
      }
  
     //LED Module
      if (modStatus[3]) {
        drawLEDMod();
    
        if (ledTaskDone() == true) {
          completedLED();
        }
      }

   //*** Updating the game ***//
   if(timer > 0) timer-= 0.1;
   
   //Testing for the 3 points of the timer counting down where the EnemyAttacks
   float timerRatio = (timer/maxTimer);
   int intRatio = (int)(timerRatio*1000);
   if(intRatio == 750 || intRatio == 500 || intRatio == 250) timerWindow.enemyAttack();
   
   //Testing if all mods have been done
   if(compareBooleanArrays(modStatus, allModsOff)){
     if(isGameOver == false) score++;
     timer = maxTimer;
     timerWindow.playerDefeat();
     newRound();
   }
   
   //Testing if the game is over
    if (timer <= 0) isGameOver = true;
    if(isGameOver) gameOver();
}

void gameOver(){
  background(0);
  
  char a = (char)letter1;
  char b = (char)letter2;
  char c = (char)letter3;
  
  //Convert the chars to strings and save them as the full name
  String sa = str(a);
  String sb = str(b);
  String sc = str(c);
  name = sa + sb + sc;
  
  fill(160);
  textSize(50);
  
  if(letterSelected == 1) fill(255);
  text(a, 200,200);
  fill(160);
  if(letterSelected == 2) fill(255);
  text(b, 300,200);
  fill(160);
  if(letterSelected == 3) fill(255);
  text(c, 400,200);
  fill(160);
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
  
  isGameOver = false;
  
  letter1 = 65;
  letter2 = 65;
  letter3 = 65;
}

void completedSwitch(){
  timerWindow.playerAttack();
  setSwitchInstruction();
  modStatus[0] = false;
}

void completedDial(){
  timerWindow.playerAttack();
   dialSet();
   modStatus[1] = false;
}

void completedJack(){
  timerWindow.playerAttack();
  resetJackMod();
  modStatus[2] = false;
}

void completedLED(){
  timerWindow.playerAttack();
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

//Cheatings
void keyPressed(){
  if(keyCode == UP) newRound();
  if(key == 'r'){
    isGameOver = true;
  }
  
  //Testing pressing enter on the game over screen
  if(keyCode == ENTER && isGameOver) {
    //JSONObject player = new JSONObject();
    
    //player.setInt("score", score);
    //player.setString("name", name);
    
    //jsonArray.append(player);
    
    //saveJSONArray(jsonArray, "JsonTest/data.json");
    
    
    ////This saves the score to the JSON file
    //jsonArrayNumbers.append(name + " : " + score);
    //saveJSONArray(jsonArrayNumbers, "JsonTest/highScoreNumbers.json");
    
    //jsonArrayNames.append(name + " : " + score);
    //saveJSONArray(jsonArrayNames, "JsonTest/highScoreNames.json");
    
    jsonArrayNumbers.append(score);
    saveJSONArray(jsonArrayNumbers, "JsonTest/highScoreNumbers.json");
    
    jsonArrayNames.append(name);
    saveJSONArray(jsonArrayNames, "JsonTest/highScoreNames.json");
    
    //Reset the game
    resetGame();
  }
  
  //Changing letters on game over screen
  if(isGameOver){
    if(keyCode == DOWN){
      if(letterSelected == 1){
        letter1++;
      }
      if(letterSelected == 2){
        letter2++;
      }
      if(letterSelected == 3){
        letter3++;
      }
    }
    
    if(keyCode == UP){
      if(letterSelected == 1){
        letter1--;
      }
      if(letterSelected == 2){
        letter2--;
      }
      if(letterSelected == 3){
        letter3--;
      }
    }
    
    if(keyCode == LEFT){
      letterSelected--;
    }
    
    if(keyCode == RIGHT){
      letterSelected++;
    }
    
    //Looping values around
    if(letter1 <= 65) letter1 +=26;
    if(letter1 >= 91) letter1 -=26;
        
    if(letter2 <= 65) letter2 +=26;
    if(letter2 >= 91) letter2 -=26;
        
    if(letter3 <= 65) letter3 +=26;
    if(letter3 >= 91) letter3 -=26;
    
    if(letterSelected <= 0) letterSelected += 3;
    if(letterSelected >= 4) letterSelected -= 3;
    
  }
  
  //Testing
  if(key == '1') if(modStatus[0]) completedSwitch();
  if(key == '2') if(modStatus[1]) completedDial();
  if(key == '3') if(modStatus[2]) completedJack();
  if(key == '4') if(modStatus[3]) completedLED();
  
  //Animation testing, not working
  if (key == 'q') {
    timerWindow.playerAttack();
  }
  if (key == 'p') {
    timerWindow.enemyAttack();
  }
  if (key == ' ') {
    timerWindow.resetPlayerSpeed();
  }
  if (key == 'w') {
   timerWindow.playerDefeat();
  }
  if (key == 'o') {
    timerWindow.enemyDefeat();
  }
}
