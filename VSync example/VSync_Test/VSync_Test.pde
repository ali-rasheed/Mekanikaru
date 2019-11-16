import processing.serial.*;
import vsync.*;

int b;
void setup(){
  Serial jack = new Serial(this, Serial.list()[1], 9600);
  ValueReceiver receiver = new ValueReceiver(this, jack);
  receiver.observe("b");
}

void draw(){
  println(b);
}
