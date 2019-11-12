#include <VSync.h>

#include <Arduino.h>

#define A_LED_PIN  3
#define B_LED_PIN  4
#define C_LED_PIN  5
#define D_LED_PIN  6
#define E_LED_PIN  7



ValueSender<5> sender1;

int switchA = 0;
int switchB = 0;
int switchC = 0;
int switchD = 0;
int switchE = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(5000);

  pinMode(A_LED_PIN, INPUT);
  pinMode(B_LED_PIN , INPUT);
  pinMode(C_LED_PIN , INPUT);
  pinMode(D_LED_PIN, INPUT);
  pinMode(E_LED_PIN, INPUT);


  //pinMode(button8Pin, INPUT);
  sender1.observe(switchA);
  sender1.observe(switchB);
  sender1.observe(switchC);
  sender1.observe(switchD);
  sender1.observe(switchE);


}

void loop() {
  // put your main code here, to run repeatedly:

  A_PB_CONTROL();
  B_PB_CONTROL();
  C_PB_CONTROL();
  D_PB_CONTROL();
  E_PB_CONTROL();
  // button8();
  
  sender1.sync();

}


void A_PB_CONTROL(void) {

  int A = digitalRead(A_LED_PIN);

  if (A == LOW) {
    switchA = 0;

  }
  else if (A == HIGH) {
    switchA = 1;

  }
}

void B_PB_CONTROL(void) {

  int B = digitalRead(B_LED_PIN);

  if (B == LOW) {
    switchB = 0;
    //Serial.println("RED ON");
    //    Serial.print("bYb");
  }
  else if (B  == HIGH) {
    switchB = 1;
    //Serial.println("*********");
    //    Serial.print("bNb");
  }
}


void C_PB_CONTROL(void) {

  int C = digitalRead(C_LED_PIN);

  if (C == LOW) {
    switchC = 0;
    //Serial.println("GREEN ON");
    //    Serial.print("cYc");
  }
  else if (C == HIGH) {
    switchC = 1;

    //Serial.println("******");
    //    Serial.print("cNc");
  }
}

void D_PB_CONTROL(void) {

  int D = digitalRead(D_LED_PIN);

  if (D == LOW) {
    switchD = 0;
  }
  else if ( D = HIGH) {
    switchD = 1;

  }
}

void E_PB_CONTROL(void) {

  int E = digitalRead(E_LED_PIN);

  if (E == LOW) {
  switchE = 0;
    //    Serial.println("eYe ");
  }
  else if (E = HIGH) {
    switchE = 1;
  }
}
