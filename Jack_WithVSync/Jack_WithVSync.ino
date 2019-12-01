#include <VSync.h>

static int jack1 = 13;
static int jack2 = 12;
static int jack3 = 11;
static int jack4 = 10;
static int jack5 = 9;
static int jack6 = 8;
static int jack7 = 7;

static int plugA = 6;
static int plugB = 5;
static int plugC = 4;
static int plugD = 3;
static int plugE = 2;

ValueSender<5> sender;

int jA = 0;
int jB = 0;
int jC = 0;
int jD = 0;
int jE = 0;


void setup() {
 Serial.begin(12600);
 //Serial.begin(9600);

 sender.observe(jA);
 sender.observe(jB);
 sender.observe(jC);
 sender.observe(jD);
 sender.observe(jE);


 pinMode(jack1, INPUT);
 pinMode(jack2, INPUT);
 pinMode(jack3, INPUT);
 pinMode(jack4, INPUT);
 pinMode(jack5, INPUT);
 pinMode(jack6, INPUT);
 pinMode(jack7, INPUT);
 
 pinMode(plugA, OUTPUT);
 pinMode(plugB, OUTPUT);
 pinMode(plugC, OUTPUT);
 pinMode(plugD, OUTPUT);
 pinMode(plugE, OUTPUT);


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

      if(digitalRead(jack6) == HIGH){
        jA = 6;
      }

      if(digitalRead(jack7) == HIGH){
        jA = 7;
      }
      
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

      if(digitalRead(jack6) == HIGH){
        jB = 6;
      }

      if(digitalRead(jack7) == HIGH){
        jB = 7;
      }
      

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

      if(digitalRead(jack6) == HIGH){
        jC = 6;
      }

      if(digitalRead(jack7) == HIGH){
        jC = 7;
      }
      

  digitalWrite(plugC, LOW); //Stop powering plugB

  //Activate plug D and check for connections
  digitalWrite(plugD, HIGH); //Start powering plugB
        jD = 0;

      if(digitalRead(jack1) == HIGH){ 
        jD = 1;
      }

      if(digitalRead(jack2) == HIGH){
        jD = 2;
      }

      if(digitalRead(jack3) == HIGH){
        jD = 3;
      }

      if(digitalRead(jack4) == HIGH){
        jD = 4;
      }

      if(digitalRead(jack5) == HIGH){
        jD = 5;
      }

      if(digitalRead(jack6) == HIGH){
        jD = 6;
      }

      if(digitalRead(jack7) == HIGH){
        jD = 7;
      }
      

  digitalWrite(plugD, LOW); //Stop powering plugB

  //Activate plug E and check for connections
  digitalWrite(plugE, HIGH); //Start powering plugB
        jE = 0;

      if(digitalRead(jack1) == HIGH){ 
        jE = 1;
      }

      if(digitalRead(jack2) == HIGH){
        jE = 2;
      }

      if(digitalRead(jack3) == HIGH){
        jE = 3;
      }

      if(digitalRead(jack4) == HIGH){
        jE = 4;
      }

      if(digitalRead(jack5) == HIGH){
        jE = 5;
      }

      if(digitalRead(jack6) == HIGH){
        jE = 6;
      }

      if(digitalRead(jack7) == HIGH){
        jE = 7;
      }
      

  digitalWrite(plugE, LOW); //Stop powering plugB

  delay(100);

//  Serial.println("JA: " +jA);
//    Serial.println("JB: " +jB);
//      Serial.println("JC: " +jC);
//        Serial.println("JD: " +jD);
//          Serial.println("JE: " +jE);
//          Serial.println();
  

  sender.sync();

}
