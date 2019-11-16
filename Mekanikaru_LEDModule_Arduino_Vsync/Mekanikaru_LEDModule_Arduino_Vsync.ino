#include <VSync.h>

ValueSender<2> sender;
int RGB1;
int RGB2;

int red[] = {255,0,0};
int orange[] = {200,20,0};
int yellow[] = {255,70,0};
int green[] = {0,100,0};
int blue[] = {0,0,150};
int purple[] = {150,0,175};

char colourChar[] = {'h','i','j','k','l','m'};

int button1 = 12;
int button2 = 13;

int led1R = 11;
int led1G = 10;
int led1B = 9;

int led2R = 6;
int led2G = 5;
int led2B = 3;

int colour1 = 0;
int colour2 = 0;

boolean pressed1 = false;
boolean pressed2 = false;

boolean cycle1 = true;
boolean cycle2 = true;

unsigned long prevMillis1 = 0;
unsigned long prevMillis2 = 0;

long interval1 = 500;
long interval2 = 1000;

void setup() {
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);
  Serial.begin(9600);
  sender.observe(RGB1);
  sender.observe(RGB2);
}

void loop() {

  // LISTEN FOR RESET CALL //

  resetListen();

  // CYCLE COLOURS //

  unsigned long curMillis = millis();

  if (cycle1 == true && curMillis - prevMillis1 >= interval1) {
    prevMillis1 = curMillis;
    colour1++;
    if (colour1 >= 6) {
      colour1 = 0;
    }
  }
  if (cycle2 == true && curMillis - prevMillis2 >= interval2) {
    prevMillis2 = curMillis;
    colour2++;
    if (colour2 >= 6) {
      colour2 = 0;
    }
  }

  // READ BUTTON PRESSES TO START AND STOP CYCLING //
  if (digitalRead(button1) == HIGH && cycle1 == true && pressed1 == false) {
    cycle1 = false;
    pressed1 = true;
  }
  if (digitalRead(button1) == HIGH && cycle1 == false && pressed1 == false) {
    cycle1 = true;
    pressed1 = true;
  }
  if (digitalRead(button1) == LOW) {
    pressed1 = false;
  }
  if (digitalRead(button2) == HIGH && cycle2 == true && pressed2 == false) {
    cycle2 = false;
    pressed2 = true;
  }
  if (digitalRead(button2) == HIGH && cycle2 == false && pressed2 == false) {
    cycle2 = true;
    pressed2 = true;
  }
  if (digitalRead(button2) == LOW) {
    pressed2 = false;
  }

  //CHECK AND SET COLOURS //

  checkLED1();
  checkLED2();
  
}

void checkLED1() {
  if (colour1 == 0) {
    goRed1();
  }
  if (colour1 == 1) {
    goOrange1();
  }
  if (colour1 == 2) {
    goYellow1();
  }
  if (colour1 == 3) {
    goGreen1();
  }
  if (colour1 == 4) {
    goBlue1();
  }
  if (colour1 == 5) {
    goPurple1();
  }

  // SEND COLOUR VALUES //

  sendVsync();
  
}

//void sendColours() {
//  if (cycle1 == false) {
//    Serial.print("a");
//    Serial.print(colour1);
//    Serial.print("a");
//  }
//  if (cycle2 == false) {
//    Serial.print("b");
//    Serial.print(colour2);
//    Serial.print("b");
//  }
//  Serial.println(" ");
//}

void sendVsync() {
  if (cycle1 == false) {
    RGB1 = colour1;
//    sender.observe(RGB1);
  }
  if (cycle2 == false) {
    RGB2 = colour2;
//    sender.observe(RGB2);
  }
}

// CHECK COLOURS //

void checkLED2() {
  if (colour2 == 0) {
    goRed2();
  }
  if (colour2 == 1) {
    goOrange2();
  }
  if (colour2 == 2) {
    goYellow2();
  }
  if (colour2 == 3) {
    goGreen2();
  }
  if (colour2 == 4) {
    goBlue2();
  }
  if (colour2 == 5) {
    goPurple2();
  }

  // SYNC VSYNC //

  sender.sync();
  
}

// SET COLOURS //

void goRed1() {
  analogWrite(led1R, red[0]);
  analogWrite(led1G, red[1]);
  analogWrite(led1B, red[2]);
}
void goRed2() {
  analogWrite(led2R, red[0]);
  analogWrite(led2G, red[1]);
  analogWrite(led2B, red[2]);
}

void goOrange1() {
  analogWrite(led1R, orange[0]);
  analogWrite(led1G, orange[1]);
  analogWrite(led1B, orange[2]);
}
void goOrange2() {
  analogWrite(led2R, orange[0]);
  analogWrite(led2G, orange[1]);
  analogWrite(led2B, orange[2]);
}

void goYellow1() {
  analogWrite(led1R, yellow[0]);
  analogWrite(led1G, yellow[1]);
  analogWrite(led1B, yellow[2]);
}
void goYellow2() {
  analogWrite(led2R, yellow[0]);
  analogWrite(led2G, yellow[1]);
  analogWrite(led2B, yellow[2]);
}

void goGreen1() {
  analogWrite(led1R, green[0]);
  analogWrite(led1G, green[1]);
  analogWrite(led1B, green[2]);
}
void goGreen2() {
  analogWrite(led2R, green[0]);
  analogWrite(led2G, green[1]);
  analogWrite(led2B, green[2]);
}

void goBlue1() {
  analogWrite(led1R, blue[0]);
  analogWrite(led1G, blue[1]);
  analogWrite(led1B, blue[2]);
}
void goBlue2() {
  analogWrite(led2R, blue[0]);
  analogWrite(led2G, blue[1]);
  analogWrite(led2B, blue[2]);
}

void goPurple1() {
  analogWrite(led1R, purple[0]);
  analogWrite(led1G, purple[1]);
  analogWrite(led1B, purple[2]);
}
void goPurple2() {
  analogWrite(led2R, purple[0]);
  analogWrite(led2G, purple[1]);
  analogWrite(led2B, purple[2]);
}

// RESET //

void reset() {
  cycle1 = true;
  cycle2 = true;
}

void resetListen() {
  if (Serial.available() > 0) {
    char state = Serial.read();
    if (state == 'r') {
      reset();
    }
  }
}
