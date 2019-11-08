import processing.serial.*; //library for serial communication
Serial firstArduinoPort; //creates object "firstArduinoPort" of serial class
Serial secondArduinoPort;   //creates object "secondArduinoPort" of serial class
//==================================================================

boolean button1 = false;
boolean button2 = false;

void setup()
{
  size(600,600);
  textSize(26);
  
  println(Serial.list()); //prints a list of open ports use this to doublecheck which port is which
  //also make sure to assign correct boud rate

  //initialize serials 
  firstArduinoPort = new Serial(this, Serial.list()[2], 38400); //port 4
  firstArduinoPort.bufferUntil(' ');
  secondArduinoPort = new Serial(this, Serial.list()[1], 9600); //port 6
  secondArduinoPort.bufferUntil(' ');
}
//==================================================================
void draw()
{
  println(button1);
  
  background(100);
  stroke(0);
  if(button1 == true){
    println("working");
    fill(255);
    ellipse(100,100,50,50);
  }else{
    noFill();
    ellipse(100,100,50,50);
  }
  
  stroke(0);
  if(button2 == true){
    fill(255);
    ellipse(300,100,50,50);
  }else{
    noFill();
    ellipse(300,100,50,50);
  }
  
}



// this function is called whenever serial information is recieved
void serialEvent(Serial myPort) {
  
  if (myPort == firstArduinoPort) {
    //--------------code for recieving and parcing serial information from Arduino1 goes here------------------//
    /// check processing tutorial on serial communication (serial call/response) example
    String myString = firstArduinoPort.readStringUntil(' '); //reads string until space -- follow example
    String[] a = splitTokens(myString, "a");
    //print(a[1]);
    if(a[1].equals("Y")){
      print("working");
      button1 = true;
    }
    else button1 = false;
  }
  else if (myPort == secondArduinoPort) {
  //println("serial event detected port 2");
    //--------------code for recieving and parcing serial information from Arduino1 goes here------------------//
    /// check processing tutorial on serial communication (serial call/response) example
    String myString = secondArduinoPort.readStringUntil(' ');
    String[] b = splitTokens(myString, "b");
    if(b[1].equals("Y")){
      print("working");
      button2 = true;
    }
    else button2 = false;
    }
  }
