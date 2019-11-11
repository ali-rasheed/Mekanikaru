#include <VSync.h>

#include <Arduino.h>

#define YELLOW_LED_PIN  3
#define RED_LED_PIN     4
#define GREEN_LED_PIN   5
#define BLUE_LED_PIN    6
#define VIOLET_LED_PIN  7



ValueSender<5> sender1;

int switchA = 0;
int switchB = 0;
int switchC = 0;
int switchD = 0;
int switchE = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(5000);

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

  int yellow = digitalRead(YELLOW_LED_PIN);

  if (yellow == LOW) {
    switchA = 0;

  }
  else if (yellow == HIGH) {
    switchA = 1;

  }
}

void RED_PB_CONTROL(void) {

  int red = digitalRead(RED_LED_PIN);

  if (red == LOW) {
    switchB = 0;
    //Serial.println("RED ON");
    //    Serial.print("bYb");
  }
  else if (red  == HIGH) {
    switchB = 1;
    //Serial.println("*********");
    //    Serial.print("bNb");
  }
}


void GREEN_PB_CONTROL(void) {

  int green = digitalRead(GREEN_LED_PIN);

  if (green == LOW) {
    switchC = 0;
    //Serial.println("GREEN ON");
    //    Serial.print("cYc");
  }
  else if (green == HIGH) {
    switchC = 1;

    //Serial.println("******");
    //    Serial.print("cNc");
  }
}

void BLUE_PB_CONTROL(void) {

  int blue = digitalRead(BLUE_LED_PIN);

  if (blue == LOW) {
    switchD = 0;
  }
  else if ( blue = HIGH) {
    switchD = 1;

  }
}

void VIOLET_PB_CONTROL(void) {

  int violet = digitalRead(VIOLET_LED_PIN);

  if (violet == LOW) {
  switchE = 0;
    //    Serial.println("eYe ");
  }
  else if (violet = HIGH) {
    switchE = 1;
  }
}
