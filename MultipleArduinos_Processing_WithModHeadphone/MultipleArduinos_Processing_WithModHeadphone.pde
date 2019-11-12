import processing.serial.*; //library for serial communication
Serial headphoneArduinoPort; //creates object "firstArduinoPort" of serial class
Serial RGBLEDArduinoPort;   //creates object "secondArduinoPort" of serial class

//==================================================================
int currentMod = 0; //0:Headhpone Mod
                    //1: RGB LED Mod

//*****Section for heahphone mod*****
byte[] inBufferJack = new byte[255];
boolean Ain1 = false; //a|a
boolean Ain2 = false; //b|b
boolean Bin1 = false; //c|c
boolean Bin2 = false; //d|d

float timer = 400;
int task = 0; //0-Ain1,Bin2 1-Ain2,Bin1 2-AinNone, Bin1 3-AinNone, Bin2 4-Ain1, BinNone 5-Ain2, BinNone

              //    A | B
              // 0: 1 | 2
              // 1: 2 | 1
              // 2: / | 1
              // 3: / | 2
              // 4: 1 | /
              // 5: 2 | /

int score = 0;

String[] gameInstructions = {"Connect A to 1 and B to 2", "Connect A to 2 and B to 1", 
                             "Disconnect A and Connect B to 1", "Disconnect A and Connect B to 2",
                             "Connect A to 1 and Disconnect B", "Connect A to 2 and Disconnect B"};

//*****Section for RGBLED mod*****
byte[] inBufferLED = new byte[255];
char LED1StoppedOn = ' ';
char LED2StoppedOn = ' ';
int LED1On;
int LED2On;

int LEDtask = 0;

String[] LEDInstructions = {"Stop 1 on Orange, Stop 2 on Blue"};

void setup()
{
  size(600,600);
  textSize(26);
  
  println(Serial.list()); //prints a list of open ports use this to doublecheck which port is which
  //also make sure to assign correct boud rate

  //initialize serials 
  headphoneArduinoPort = new Serial(this, Serial.list()[2], 38400); //port 1
  headphoneArduinoPort.bufferUntil('&');
  
  RGBLEDArduinoPort = new Serial(this, Serial.list()[1], 9600); //port 2
  RGBLEDArduinoPort.bufferUntil(' ');
}
//==================================================================
void draw()
{
  
  //Drawing
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
  
  if(currentMod == 0){
    fill(0);
    text(gameInstructions[task],100,350);
    fill(255);
    text(score, 50,50);
    
    if(testIfHeadphoneTaskDone() == true) {
      score++;
      timer = 400;
      task = (int)random(0,6);
      currentMod = 1;
    }
    
    if(timer <= 0) {
        background(0);
        fill(255);
        text("Game Over", 220,300);
    }
  }else if(currentMod == 1){
    fill(0);
    text(LEDInstructions[0], 100, 350);
    
    if(testIfRGBLEDTaskDone() == true) {
      score++;
      timer = 400;
      currentMod = 0;
    }
  }
  
}

boolean testIfHeadphoneTaskDone() {
  if(task == 0){
    if(Ain1 == true && Ain2 == false && Bin1 == false && Bin2 == true){
      return true;
    }else return false;
  }
  
  if(task == 1){
    if(Ain1 == false && Ain2 == true && Bin1 == true && Bin2 == false){
      return true;
    }else return false;
  }
  
  if(task == 2){
    if(Ain1 == false && Ain2 == false && Bin1 == true && Bin2 == false){
      return true;
    }else return false;
  }
  
  if(task == 3){
    if(Ain1 == false && Ain2 == false && Bin1 == false && Bin2 == true){
      return true;
    }else return false;
  }
  
  if(task == 4){
    if(Ain1 == true && Ain2 == false && Bin1 == false && Bin2 == false){
      return true;
    }else return false;
  }
  
  if(task == 5){
    if(Ain1 == false && Ain2 == true && Bin1 == false && Bin2 == false){
      return true;
    }else return false;
  }
  
  return false;
}



// this function is called whenever serial information is recieved
void serialEvent(Serial myPort) {
  //Do if info from the Headphone Module
  if (myPort == headphoneArduinoPort) {
    headphoneArduinoPort.readBytesUntil('&', inBufferJack);  //read in all data until '&' is encountered
    
    
    if (inBufferJack != null) {
      String myString = new String(inBufferJack);
      //println(myString);
      String testForYes = "Y"; //Cant compare strings with == so this is the string it is being checked against
      
      String[] full = splitTokens(myString, "&"); //First split
      if(full.length <2) return; //Return if broken split
      
      String[] a = splitTokens(full[0], "a"); //Get the Ainto1 Reading
      if(testForYes.equals(a[1]) == true) Ain1 = true;
      else Ain1 = false;
      
      String[] b = splitTokens(full[0], "b"); //Get the Ainto2 Reading
      if(testForYes.equals(b[1]) == true) Ain2 = true;
      else Ain2 = false;
      
      String[] c = splitTokens(full[0], "c"); //Get the Binto1 Reading
      if(testForYes.equals(c[1]) == true) Bin1 = true;
      else Bin1 = false;
      
      String[] d = splitTokens(full[0], "d"); //Get the Binto2 Reading
      if(testForYes.equals(d[1]) == true) Bin2 = true;
      else Bin2 = false;
      
    }
  }
  //Do if info from the RGB LED module
  else if (myPort == RGBLEDArduinoPort) {
    RGBLEDArduinoPort.readBytesUntil(' ', inBufferLED);
    //println(inBufferLED);
    
  //println("serial event detected port 2");
    //--------------code for recieving and parcing serial information from Arduino1 goes here------------------//
    /// check processing tutorial on serial communication (serial call/response) example
   // String myString = RGBLEDArduinoPort.readStringUntil(' ');
   // if(myString.length < 6) return;
   if(inBufferLED != null) {
     String myString = new String(inBufferLED);
     //println(myString);
     
     char[] chars = new char[254];
     chars = explode(myString);
     println(chars);
     
     LED1StoppedOn = chars[3];
     LED2StoppedOn = chars[6];
    
    // String[] full = splitTokens(myString, " ");
    // if(full.length <2) return;
    
    //String[] a = splitTokens(full[0], "a");
    //if(a[1] != null) {
    // // LED1StoppedOn = a[0];
    //  println(a[1]);
    //}
    
    //String[] b = splitTokens(full[0], "b");
    //LED2StoppedOn = b[1];
    
    //println(LED1StoppedOn);
    //println(LED2StoppedOn);
   }
   
   RGBLEDArduinoPort.clear();
    
  }
    
    //Dummy code for the "test button Mod"
  //  //println(myString);
  //  String[] b = splitTokens(myString, "b");
  //  println(b[1]);
  //  if(b[1].equals("Y")){
  //    buttonPressed = true;
  //  }else buttonPressed = false;
    
  //}
}

//This only has one if as a test. Need to add all possible task combinations of colors
boolean testIfRGBLEDTaskDone() {
  //Converting the read string to an int for testing for complete
  int LED1On = 6;
  if(LED1StoppedOn == 'h') LED1On = 0;
  if(LED1StoppedOn == 'i') LED1On = 1;
  if(LED1StoppedOn == 'j') LED1On = 2;
  if(LED1StoppedOn == 'k') LED1On = 3;
  if(LED1StoppedOn == 'l') LED1On = 4;
  if(LED1StoppedOn == 'm') LED1On = 5;
  
  int LED2On = 6;
  if(LED2StoppedOn == 'h') LED2On = 0;
  if(LED2StoppedOn == 'i') LED2On = 1;
  if(LED2StoppedOn == 'j') LED2On = 2;
  if(LED2StoppedOn == 'k') LED2On = 3;
  if(LED2StoppedOn == 'l') LED2On = 4;
  if(LED2StoppedOn == 'm') LED2On = 5;
  
  if (LEDtask == 0){
    if(LED1On == 1 && LED2On == 4) { //1 on Orange:  4 on Blue
      RGBLEDArduinoPort.write('r');
      LED1On = 6;
      LED2On = 6;
      LED1StoppedOn = ' ';
      LED2StoppedOn = ' ';
      return true;
    }
  }
  return false;
}

void convertStringToInt(String convert) {
  LED1On = Integer.parseInt(convert);
}

char[] explode(String s) { // function explode
 
  String theString = s;
  char[] c = new char[theString.length()];
 
  for (int i = 0; i < theString.length(); i++) {
    c[i] = theString.charAt(i);
  }
  return c;
}
