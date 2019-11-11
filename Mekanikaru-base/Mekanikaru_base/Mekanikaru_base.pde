
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
  
}
//int currentMod = 0; //0:Headhpone Mod
//                    //1: RGB LED Mod

////*****Section for heahphone mod*****
////byte[] inBuffer = new byte[255];
////boolean Ain1 = false; //a|a
////boolean Ain2 = false; //b|b
////boolean Bin1 = false; //c|c
////boolean Bin2 = false; //d|d

//float timer = 400;
//int task = 0; //0-Ain1,Bin2 1-Ain2,Bin1 2-AinNone, Bin1 3-AinNone, Bin2 4-Ain1, BinNone 5-Ain2, BinNone

//              //    A | B
//              // 0: 1 | 2
//              // 1: 2 | 1
//              // 2: / | 1
//              // 3: / | 2
//              // 4: 1 | /
//              // 5: 2 | /

//int score = 0;


////*****Section for heahphone mod*****
//int LED1StoppedOn = 0;
//int LED2StoppedOn = 0;

//int LEDtask = 0;

//String[] LEDInstructions = {"Stop 1 on Red, Stop 2 on Green"};

//void setup()
//{
//  size(600,600);
//  textSize(26);
  
//  println(Serial.list()); //prints a list of open ports. use this to doublecheck which port is which
//  //also make sure to assign correct boud rate

//  //initialize serials 
//  headphoneArduinoPort = new Serial(this, Serial.list()[1], 38400); //port 4
//  headphoneArduinoPort.bufferUntil('&');
  
//  RGBLEDArduinoPort = new Serial(this, Serial.list()[2], 9600); //port 6
//  RGBLEDArduinoPort.bufferUntil(' ');
//}
//==================================================================
//void draw()
//{
  
//  //Drawing
//  background(100);
  
//  //Drawing the timer
//  //Outer Box
//  stroke(255);
//  noFill();
//  rect(100,100,400,60);
  
//  //Inner Box
//  noStroke();
//  fill(10,10,200);
//  rect(102,102,timer,58);
  
//  timer-= 0.1;
  
//  if(currentMod == 0){
//    fill(0);
//    text(gameInstructions[task],100,350);
//    fill(255);
//    text(score, 50,50);
    
//    if(testIfHeadphoneTaskDone() == true) {
//      score++;
//      timer = 400;
//      task = (int)random(0,6);
//      currentMod = 1;
//    }
    
//    if(timer <= 0) {
//        background(0);
//        fill(255);
//        text("Game Over", 220,300);
//    }
//  }else if(currentMod == 1){
//    fill(0);
//    text(LEDInstructions[0], 100, 350);
    
//    if(testIfRGBLEDTaskDone() == true) {
//      score++;
//      timer = 400;
//      currentMod = 0;
//    }
//  }
  
//}

//boolean testIfHeadphoneTaskDone() {
//  if(task == 0){
//    if(Ain1 == true && Ain2 == false && Bin1 == false && Bin2 == true){
//      return true;
//    }else return false;
//  }
  
//  if(task == 1){
//    if(Ain1 == false && Ain2 == true && Bin1 == true && Bin2 == false){
//      return true;
//    }else return false;
//  }
  
//  if(task == 2){
//    if(Ain1 == false && Ain2 == false && Bin1 == true && Bin2 == false){
//      return true;
//    }else return false;
//  }
  
//  if(task == 3){
//    if(Ain1 == false && Ain2 == false && Bin1 == false && Bin2 == true){
//      return true;
//    }else return false;
//  }
  
//  if(task == 4){
//    if(Ain1 == true && Ain2 == false && Bin1 == false && Bin2 == false){
//      return true;
//    }else return false;
//  }
  
//  if(task == 5){
//    if(Ain1 == false && Ain2 == true && Bin1 == false && Bin2 == false){
//      return true;
//    }else return false;
//  }
  
//  return false;
//}



//// this function is called whenever serial information is recieved
//void serialEvent(Serial myPort) {
//  //println("got1");
  
//  //Do if info from the Headphone Module
//  if (myPort == headphoneArduinoPort) {
//    headphoneArduinoPort.readBytesUntil('&', inBuffer);  //read in all data until '&' is encountered
    
    
//    if (inBuffer != null) {
//      String myString = new String(inBuffer);
//      //println(myString);
//      String testForYes = "Y"; //Cant compare strings with == so this is the string it is being checked against
      
//      String[] full = splitTokens(myString, "&"); //First split
//      if(full.length <2) return; //Return if broken split
      
//      String[] a = splitTokens(full[0], "a"); //Get the Ainto1 Reading
//      if(testForYes.equals(a[1]) == true) Ain1 = true;
//      else Ain1 = false;
      
//      String[] b = splitTokens(full[0], "b"); //Get the Ainto2 Reading
//      if(testForYes.equals(b[1]) == true) Ain2 = true;
//      else Ain2 = false;
      
//      String[] c = splitTokens(full[0], "c"); //Get the Binto1 Reading
//      if(testForYes.equals(c[1]) == true) Bin1 = true;
//      else Bin1 = false;
      
//      String[] d = splitTokens(full[0], "d"); //Get the Binto2 Reading
//      if(testForYes.equals(d[1]) == true) Bin2 = true;
//      else Bin2 = false;
      
//    }
//  }
//  //Do if info from the RGB LED module
//  else if (myPort == RGBLEDArduinoPort) {
//  println("serial event detected port 2");
//    //--------------code for recieving and parcing serial information from Arduino1 goes here------------------//
//    /// check processing tutorial on serial communication (serial call/response) example
//    String myString = RGBLEDArduinoPort.readStringUntil(' ');
//    String[] a = splitTokens(myString, "a");
    
//  }
    
    //Dummy code for the "button Mod"
  //  //println(myString);
  //  String[] b = splitTokens(myString, "b");
  //  println(b[1]);
  //  if(b[1].equals("Y")){
  //    buttonPressed = true;
  //  }else buttonPressed = false;
    
  //}
//}

//This only has one if as a test. Need to add all possible task combinations of colors
