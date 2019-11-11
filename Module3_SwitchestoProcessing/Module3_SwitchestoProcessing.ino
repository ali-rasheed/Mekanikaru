#include <VSync.h>

#include <Arduino.h>

#define YELLOW_LED_PIN  3
#define RED_LED_PIN     4
#define GREEN_LED_PIN   5
#define BLUE_LED_PIN    6
#define VIOLET_LED_PIN  9



ValueSender<5> sender1;

int switchA = 0;
int switchB = 0;
int switchC = 0;
int switchD = 0;
int switchE = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(11600);

  pinMode(BLUE_LED_PIN, INPUT);
  pinMode(RED_LED_PIN , INPUT);
  pinMode(GREEN_LED_PIN , INPUT);
  pinMode(YELLOW_LED_PIN, INPUT);
  pinMode(VIOLET_LED_PIN, INPUT);



  //pinMode(button8Pin, INPUT);
  sender1.observe(switchA);
  sender1.observe(switchB);
  sender1.observe(switchC);
  sender1.observe(switchD);
  sender1.observe(switchE);


}

void loop() {
  // put your main code here, to run repeatedly:

  YELLOW_PB_CONTROL();
  RED_PB_CONTROL();
  GREEN_PB_CONTROL();
  BLUE_PB_CONTROL();
  VIOLET_PB_CONTROL();
  // button8();
  sender1.sync();

}


void YELLOW_PB_CONTROL(void) {

  switchA = digitalRead(YELLOW_LED_PIN);

  if (switchA == LOW) {

    //Serial.println("YELLOW ON");
    Serial.print("aYa");
  }
  else {
    //Serial.println("************");
    Serial.print("aNa");
  }
}

void RED_PB_CONTROL(void) {

  switchB = digitalRead(RED_LED_PIN);

  if (switchB == LOW) {

    //Serial.println("RED ON");
    Serial.print("bYb");
  }
  else {
    //Serial.println("*********");
    Serial.print("bNb");
  }
}


void GREEN_PB_CONTROL(void) {

  switchC = digitalRead(GREEN_LED_PIN);

  if (switchC == LOW) {

    //Serial.println("GREEN ON");
    Serial.print("cYc");
  }
  else {
    //Serial.println("******");
    Serial.print("cNc");
  }
}

void BLUE_PB_CONTROL(void) {

  switchD = digitalRead(BLUE_LED_PIN);

  if (switchD == LOW) {

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

  switchE = digitalRead(VIOLET_LED_PIN);

  if (switchE == LOW) {

    Serial.println("eYe ");
  }
  else {
    //Serial.println("*******************************************************");
    Serial.println("eNe ");
  }
}
