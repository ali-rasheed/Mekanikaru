#include <VSync.h>

static int plugA = 9;
static int plugB = 10;
static int plugC = 11;

static int jack1 = 6;
static int jack2 = 2;
static int jack3 = 3;
static int jack4 = 4;
static int jack5 = 5;

ValueSender<3> sender;

int jA = 0;
int jB = 0;
int jC = 0;


void setup() {
 Serial.begin(12600);

 sender.observe(jA);
 sender.observe(jB);
 sender.observe(jC);


 pinMode(jack1, INPUT);
 pinMode(jack2, INPUT);
 pinMode(jack3, INPUT);
 pinMode(jack4, INPUT);
 pinMode(jack5, INPUT);
 
 pinMode(plugA, OUTPUT);
 pinMode(plugB, OUTPUT);
 pinMode(plugC, OUTPUT);


}

void loop() {
  //Activate plug A and check for connections
  digitalWrite(plugA, HIGH); //Start powering plugA
      jA = 0;

      if(digitalRead(jack1) == HIGH){
        jA = 1;
      }
        
      if(digitalRead(jack2) == HIGH){
        jA = 2;
      }

      if(digitalRead(jack3) == HIGH){
        jA = 3;
      }

      if(digitalRead(jack4) == HIGH){
        jA = 4;
      }

      if(digitalRead(jack5) == HIGH){
        jA = 5;
      }

      //Serial.println("A : " + jA);
      
  digitalWrite(plugA, LOW); //Stop powering plugA

  //Activate plug B and check for connections
  digitalWrite(plugB, HIGH); //Start powering plugB
        jB = 0;

      if(digitalRead(jack1) == HIGH){ 
        jB = 1;
      }

      if(digitalRead(jack2) == HIGH){
        jB = 2;
      }

      if(digitalRead(jack3) == HIGH){
        jB = 3;
      }

      if(digitalRead(jack4) == HIGH){
        jB = 4;
      }

      if(digitalRead(jack5) == HIGH){
        jB = 5;
      }
      //Serial.println("B : " + jB);
      

  digitalWrite(plugB, LOW); //Stop powering plugB

  //Activate plug C and check for connections
  digitalWrite(plugC, HIGH); //Start powering plugB
        jC = 0;

      if(digitalRead(jack1) == HIGH){ 
        jC = 1;
      }

      if(digitalRead(jack2) == HIGH){
        jC = 2;
      }

      if(digitalRead(jack3) == HIGH){
        jC = 3;
      }

      if(digitalRead(jack4) == HIGH){
        jC = 4;
      }

      if(digitalRead(jack5) == HIGH){
        jC = 5;
      }
      
      //Serial.println("C : ");

  digitalWrite(plugC, LOW); //Stop powering plugB

  delay(100);

  sender.sync();

}
