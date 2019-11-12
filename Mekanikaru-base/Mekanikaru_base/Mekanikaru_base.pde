
//  You always need to import the serial library in addition to the VSync library
import processing.serial.*;
import vsync.*;

//  We create a new ValueReceiver to receive values from the arduino
ValueReceiver dialReceiver, LEDReceiver, switchReceiver,jackReceiver;

//Dial Values
public int dialVal;

//LED Values
public int RGB1,RGB2;

//switch Values
public int switchA,switchB,switchC,switchD,switchE;

//jackValues
public int jA1,jA2,jA3,jA4,jB1,jB2,jB3,jB4,jC1,jC2,jC3,jC4;

Serial dialArduino, LEDArduino, switchArduino, jackArduino;

//*****Game Values*****//
int currentMod = 0; //0: Jack Mod
                    //1: LED Mod
                    //2: Switch Mod
                    //3: Dial Mod    
int score = 0;
float timer = 400;

void setup() 
{
  size(400, 400);

   dialArduino = new Serial(this,"COM5", 9600);
   LEDArduino = new Serial(this, "COM4", 10600);
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
  switchReceiver.observe("switchA");
  switchReceiver.observe("switchB");
  switchReceiver.observe("switchC");
  switchReceiver.observe("switchD");
  switchReceiver.observe("switchE");
  
  dialReceiver.observe("dialVal");
  
  jackReceiver.observe("jA1");
  jackReceiver.observe("jA2");
  jackReceiver.observe("jB1");
  jackReceiver.observe("jB2");
  
  //dialReceiver.observe("analogValue2");
}

void draw() 
{
  //LEDReceiver.observe("RGB1");
  //LEDReceiver.observe("RGB2");
  //switchReceiver.observe("switchA");
  //switchReceiver.observe("switchB");
  //switchReceiver.observe("switchC");
  //switchReceiver.observe("switchD");
  //dialReceiver.observe("dialVal");
  println("rgb1: " +RGB1);
  println("rgb1: " +RGB2);
  
  println("switchA: " +switchA);
  println("switchB: " +switchB);
  println("switchC: " +switchC);
  println("switchD: " +switchD);
  println("switchE: " +switchE);
  
  println("dialVal: " +dialVal);
  
  println("jackA1: " +jA1);
  println("jackA2: " +jA2);
  println("jackB1: " +jB1);
  println("jackB2: " +jB2);
  
  //*****Playing The Game*****//
  
  //Drawing Background
  background(100);
  
  //Drawing the timer
  //Outer Box
  stroke(255);
  noFill();
  rect(100,100,400,60);
  
  //Inner Box
  noStroke();
  fill(10,10,200);
  rect(102,102,timer,58);
  
  timer-= 0.1;
  
  //Playing Each Module
    //Jack Module
    if(currentMod == 0){
    fill(0);
    text(jackInstructions[jackTask],100,350);
    fill(255);
    text(score, 50,50);
    
    if(testIfHeadphoneTaskDone() == true) {
      score++;
      timer = 400;
      jackTask = (int)random(0,6);
      currentMod = 1;
    }
    
    //LED Module
  }else if(currentMod == 1){
    fill(0);
    text("LED instructions here", 100, 350);
    fill(255);
    text(score, 50, 50);
    
    if(testIfLEDTaskDone() == true) {
      score++;
      timer = 400;
      currentMod = 0;
    }
  }
  
  //Game Over Screen
  if(timer <= 0) {
        background(0);
        fill(255);
        text("Game Over", 220,300);
    }
}
