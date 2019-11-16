
//  You always need to import the serial library in addition to the VSync library
import processing.serial.*;
import vsync.*;


//  We create a new ValueReceiver to receive values from the arduino
ValueReceiver dialReceiver, LEDReceiver, switchReceiver,jackReceiver;
ValueSender LEDSender;

//Dial Values
public int dialVal;

//LED Values
public int RGB1,RGB2;
public int LEDReset;

//switch Values
public int switchA,switchB,switchC,switchD,switchE;

//jackValues
public int jA;
public int jB;
public int jC;


Serial dialArduino, LEDArduino, switchArduino, jackArduino;

//*****Game Values*****//
int currentMod = 0; //0: Jack Mod
                    //1: LED Mod
                    //2: Switch Mod
                    //3: Dial Mod    
int score = 0;
float timer = 350;

PImage bg;

void setup() 
{
  size(1002, 1002);
  
  bg = loadImage("267Background.png");

   //dialArduino = new Serial(this,"COM5", 9600);
   LEDArduino = new Serial(this, "COM3", 9600);
   LEDSender = new ValueSender(this, LEDArduino);
   LEDReset = 0;
   switchArduino = new Serial(this, "COM4", 5000);
   jackArduino = new Serial(this, "COM5", 12600);
   //dialReceiver = new ValueReceiver(this, dialArduino);
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
  
  //dialReceiver.observe("dialVal");
  
  jackReceiver.observe("jA");
  jackReceiver.observe("jB");
  jackReceiver.observe("jC");
  
  
  //dialReceiver.observe("analogValue2");
  initializeJackMod();
  setSwitchInstruction();
  setLedInstruction();
}

void draw() 
{
  LEDReset = 0;
  //println("rgb1: " +RGB1);
  //println("rgb1: " +RGB2);
  
  println("switchA: " +switchA);
  println("switchB: " +switchB);
  println("switchC: " +switchC);
  println("switchD: " +switchD);
  println("switchE: " +switchE);
  println(millis());
  
  //println("dialVal: " +dialVal);
  
  //println("jackA: " +jA);
  //println("jackB: " +jB);
  //println("jackC: " +jC);
  
  //*****Playing The Game*****//
  
  //Drawing Background
  background(bg);
  
  //Drawing the timer
  ////Outer Box
  //stroke(255);
  //noFill();
  //rect(100,100,400,60);
  
  //Inner Box
  noStroke();
  fill(10,10,200);
  rect(325,472,timer,58);
  
  timer-= 0.1;
  
  //Playing Each Module
  
    //Jack Module
    if(currentMod == 0){
    fill(250);
    textSize(28);
    text("CONNECT", 180,180);
    textSize(24);
    text(jackModInstructions[0],200,220);
    text(jackModInstructions[1],200,250);
    text(jackModInstructions[2],200,280);
    fill(255);
    
    if(testIfHeadphoneTaskDone() == true) {
      score++;
      timer = 400;
      resetJackMod();
      currentMod = 1;
    }
    
    //LED Module
  }else if(currentMod == 1){
    fill(255);
    textSize(16);
    text(ledInstructions, 76, 680);
    
    if(ledTaskDone() == true) {
      score++;
      timer = 400;
      setLedInstruction();
      currentMod = 2;
    }
    //Switch Mod
  }else if (currentMod == 2) {
    fill(250);
    textSize(18);
    text(switchInstructions, 690,220);
    text(switchInstructions2, 690,250);
    text(switchInstructions3, 690,280);
    
    if(testIfSwitchTaskDone()) {
      score++;
      timer = 350;
      currentMod = 0;
    }
    
    
  }else if (currentMod == 3) {
    
  }
  
  //Drawing Score
  fill(255);
  textSize(26);
  text("Score : "+score, 850, 35);
  
  //Game Over Screen
  if(timer <= 0) {
        background(0);
        fill(255);
        text("Game Over", 220,300);
    }
}
