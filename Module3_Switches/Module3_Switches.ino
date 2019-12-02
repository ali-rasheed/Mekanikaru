#include <VSync.h>

#include <Arduino.h>

int A = 4;
int B = 5;
int C = 6;
int D = 7;
int E = 8;

int F = 9;
int G = 10;
int H = 11;
int I = 12;
int J = 13;


ValueSender<10> sender;

int state1 = 0;
int state2 = 0;
int state3 = 0;
int state4 = 0;
int state5 = 0;

int state6 = 0;
int state7 = 0;
int state8 = 0;
int state9 = 0;
int state10 = 0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(4800);

  pinMode(A, INPUT);
 pinMode(B, INPUT);
 pinMode(C, INPUT);
 pinMode(D, INPUT);
 pinMode(E, INPUT);

 pinMode(F, INPUT);
 pinMode(G, INPUT);
 pinMode(H, INPUT);
 pinMode(I, INPUT);
 pinMode(J, INPUT);

  
}

void loop() {

  sender.observe(state1);
  sender.observe(state2);
  sender.observe(state3);
  sender.observe(state4);
  sender.observe(state5);

  sender.observe(state6);
  sender.observe(state7);
  sender.observe(state8);
  sender.observe(state9);
  sender.observe(state10);


  if(digitalRead(A) == HIGH) state1 = 0;
  else state1 = 1;

  if(digitalRead(B) == HIGH) state2 = 0;
  else state2 = 1;

  if(digitalRead(C) == HIGH) state3 = 0;
  else state3 = 1;

  if(digitalRead(D) == HIGH) state4 = 0;
  else state4 = 1;

  if(digitalRead(E) == HIGH) state5 = 0;
  else state5 = 1;

  if(digitalRead(F) == HIGH) state6 = 0;
  else state6 = 1;

  if(digitalRead(G) == HIGH) state7 = 0;
  else state7 = 1;

  if(digitalRead(H) == HIGH) state8 = 0;
  else state8 = 1;

  if(digitalRead(I) == HIGH) state9 = 0;
  else state9 = 1;

  if(digitalRead(J) == HIGH) state10 = 0;
  else state10 = 1;
 
  sender.sync();
}

// Serial.println("num1");
// Serial.println(state1);
//
//  Serial.println("num2");
// Serial.println(state2);
//
// Serial.println("num3");
// Serial.println(state3);
//
//Serial.println("num4");
// Serial.println(state4);
//
// Serial.println("num5");
// Serial.println(state5);
//
// Serial.println("num6");
// Serial.println(state6);
//
// Serial.println("num7");
// Serial.println(state7);
//
// Serial.println("num8");
// Serial.println(state8);
//
// Serial.println("num9");
// Serial.println(state9);
//
// Serial.println("num10");
// Serial.println(state10);
  




//void YELLOW_PB_CONTROL(void) {
//
//  YELLOW_PB_STATE = digitalRead(YELLOW_LED_PIN);
//
//  if (YELLOW_PB_STATE == LOW) {
//
//    //Serial.println("YELLOW ON");
//    Serial.print("aYa");
//  }
//  else {
//    //Serial.println("************");
//    Serial.print("aNa");
//  }
//}
//
//void RED_PB_CONTROL(void) {
//
//  RED_PB_STATE = digitalRead(RED_LED_PIN);
//
//  if (RED_PB_STATE == LOW) {
//
//    //Serial.println("RED ON");
//    Serial.print("bYb");
//  }
//  else {
//    //Serial.println("*********");
//    Serial.print("bNb");
//  }
//}
//
//
//void GREEN_PB_CONTROL(void) {
//
//  GREEN_PB_STATE = digitalRead(GREEN_LED_PIN);
//
//  if (GREEN_PB_STATE == LOW) {
//
//    //Serial.println("GREEN ON");
//    Serial.print("cYc");
//  }
//  else {
//    //Serial.println("******");
//    Serial.print("cNc");
//  }
//}
//
//void BLUE_PB_CONTROL(void) {
//
//  BLUE_PB_STATE = digitalRead(BLUE_LED_PIN);
//
//  if (BLUE_PB_STATE == LOW) {
//
//    //Serial.println("BLUE ON");
//    Serial.print("dYd");
//  }
//  else {
//    //Serial.println("***************************");
//    Serial.print("dNd");
//  }
//}
//
////void button8(void) {
////
////  button8State = digitalRead(button8Pin);
////
////  if (button8State == LOW) {
////
////    Serial.println("LED8 ON");
////  }
////  else {
////    Serial.println("***************************");
////  }
////}
//
//
//
//
//
//
//
//
//
//void VIOLET_PB_CONTROL(void) {
//
//  VIOLET_PB_STATE = digitalRead(VIOLET_LED_PIN);
//
//  if (VIOLET_PB_STATE == LOW) {
//
//    Serial.println("eYe ");
//  }
//  else {
//    //Serial.println("*******************************************************");
//    Serial.println("eNe ");
//  }
//}
