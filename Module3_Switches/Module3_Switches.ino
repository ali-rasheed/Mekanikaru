#include <VSync.h>

#include <Arduino.h>

#define YELLOW_LED_PIN  3
#define RED_LED_PIN     4
#define GREEN_LED_PIN   5
#define BLUE_LED_PIN    6
#define VIOLET_LED_PIN  9



ValueSender<5> sender1;

int RED_PB_STATE = 0;
int BLUE_PB_STATE = 0;
int GREEN_PB_STATE = 0;
int YELLOW_PB_STATE = 0;
int VIOLET_PB_STATE = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(BLUE_LED_PIN, INPUT);
  pinMode(RED_LED_PIN , INPUT);
  pinMode(GREEN_LED_PIN , INPUT);
  pinMode(YELLOW_LED_PIN, INPUT);
  pinMode(VIOLET_LED_PIN, INPUT);



  //pinMode(button8Pin, INPUT);
  //sender1.observe(YELLOW_PB_STATE);


}

void loop() {
  // put your main code here, to run repeatedly:

  YELLOW_PB_CONTROL();
  RED_PB_CONTROL();
  GREEN_PB_CONTROL();
  BLUE_PB_CONTROL();
  VIOLET_PB_CONTROL();
  // button8();
  //sender1.sync();

}


void YELLOW_PB_CONTROL(void) {

  YELLOW_PB_STATE = digitalRead(YELLOW_LED_PIN);

  if (YELLOW_PB_STATE == LOW) {

    //Serial.println("YELLOW ON");
    Serial.print("aYa");
  }
  else {
    //Serial.println("************");
    Serial.print("aNa");
  }
}

void RED_PB_CONTROL(void) {

  RED_PB_STATE = digitalRead(RED_LED_PIN);

  if (RED_PB_STATE == LOW) {

    //Serial.println("RED ON");
    Serial.print("bYb");
  }
  else {
    //Serial.println("*********");
    Serial.print("bNb");
  }
}


void GREEN_PB_CONTROL(void) {

  GREEN_PB_STATE = digitalRead(GREEN_LED_PIN);

  if (GREEN_PB_STATE == LOW) {

    //Serial.println("GREEN ON");
    Serial.print("cYc");
  }
  else {
    //Serial.println("******");
    Serial.print("cNc");
  }
}

void BLUE_PB_CONTROL(void) {

  BLUE_PB_STATE = digitalRead(BLUE_LED_PIN);

  if (BLUE_PB_STATE == LOW) {

    //Serial.println("BLUE ON");
    Serial.print("dYd");
  }
  else {
    //Serial.println("***************************");
    Serial.print("dNd");
  }
}

//void button8(void) {
//
//  button8State = digitalRead(button8Pin);
//
//  if (button8State == LOW) {
//
//    Serial.println("LED8 ON");
//  }
//  else {
//    Serial.println("***************************");
//  }
//}









void VIOLET_PB_CONTROL(void) {

  VIOLET_PB_STATE = digitalRead(VIOLET_LED_PIN);

  if (VIOLET_PB_STATE == LOW) {

    Serial.println("eYe ");
  }
  else {
    //Serial.println("*******************************************************");
    Serial.println("eNe ");
  }
}
