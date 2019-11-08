
//  You always need to import the serial library in addition to the VSync library
import processing.serial.*;
import vsync.*;

//  We create a new ValueReceiver to receive values from the arduino
ValueReceiver receiver1;


//  This is the variable we want to sync from the Arduino to this sketch
public int analogValue1, analogValue2;

void setup() 
{
  size(400, 400);

  //  Hint: "/dev/ttyUSB0" is the serial port on my system. It might have
  //  a different name on yours. 
  //  It should be the same one that is checked under Tools->Serial Port in you Arduino IDE
  //  when uploading Arduino sketches.
  //  Look at http://processing.org/reference/libraries/serial/Serial.html if you still have trouble.
  Serial serial = new Serial(this, "COM5", 9600);

  //  Ininialize the ValueReceiver with this (to hook it to your sketch)
  //  and the serial interface you want to use.
  receiver1 = new ValueReceiver(this, serial);
  //receiver2 = new ValueReceiver(this, serial);

  // Tell the ValueReceiver what variable you want to synchronize from the arduino to this sketch.
  receiver1.observe("analogValue1");
  receiver1.observe("analogValue2");
}

void draw() 
{
  //  Draw the background using the variable that was synced from the Arduino to this sketch
  background(analogValue1/4, analogValue2/4,255);
  println(analogValue1);
  println(analogValue2);
}
