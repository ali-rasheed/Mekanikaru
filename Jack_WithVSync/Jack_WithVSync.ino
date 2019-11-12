static int plugA = 5;
static int plugB = 6;

static int jack1 = 2;
static int jack2 = 3;

#include <VSync.h>

ValueSender<4> sender;

int jA1 = 0;
int jA2 = 0;
int jB1 = 0;
int jB2 = 0;

void setup() {
 Serial.begin(12600);
 pinMode(jack1, INPUT);
 pinMode(jack2, INPUT);
 pinMode(plugA, OUTPUT);
 pinMode(plugB, OUTPUT);

sender.observe(jA1);
sender.observe(jA2);
sender.observe(jB1);
sender.observe(jB2);

}

void loop() {
  //Activate plug A and check for connections
  digitalWrite(plugA, HIGH); //Start powering plugA

      if(digitalRead(jack1) == HIGH){ 
        jA1 = 1;
      }else{ 
        jA1 = 0;
      }

       if(digitalRead(jack2) == HIGH){
        jA2 = 1;
      }else{
        jA2 = 0;
      }
      
  digitalWrite(plugA, LOW); //Stop powering plugA

  //Activate plug B and check for connections
  digitalWrite(plugB, HIGH); //Start powering plugB

      if(digitalRead(jack1) == HIGH){ 
        jB1 = 1;
      }else{ 
        jB1 = 0;
      }

       if(digitalRead(jack2) == HIGH){
        jB2 = 1;
      }else{
        jB2 = 0;
      }

  digitalWrite(plugB, LOW); //Stop powering plugB

  sender.sync();

  delay(100);

}
