#include <Servo.h>

#include <VSync.h>

ValueSender<2> sender;
ValueReceiver<2> receiver;

int leftGauge, rightGauge;
int dialVal, confirm, motorSet;


int touchPin = 5;
int rotPin = 1;
int leftGaugePin = 6;
int rightGaugePin = 7;
Servo leftServo, rightServo;

int leftMap, rightMap;

void setup()
{
  pinMode(touchPin, INPUT);
  pinMode(rightGaugePin, OUTPUT);
  pinMode(leftGaugePin, OUTPUT);

  Serial.begin(11000);

  sender.observe(dialVal);
  sender.observe(confirm);

  receiver.observe(motorSet);
  receiver.observe(leftGauge);
  receiver.observe(rightGauge);

  leftServo.attach(leftGaugePin);
  rightServo.attach(rightGaugePin);
}

void loop()
{

  receiver.sync();

  leftMap =(int)  map(leftGauge, 0, 45, 0, 201);
  rightMap = (int) map(rightGauge, 0, 45, 0, 201);

//  Serial.println(leftMap);
//  Serial.println(rightMap);
  //  if (motorSet >0) {
  leftServo.write(leftGauge);
  rightServo.write(rightGauge);
  //  }
  int rot = analogRead(rotPin);

  dialVal = map(rot, 0, 1050, 0, 45);
  //dialVal= rot;
  confirm = digitalRead(touchPin);


  sender.sync();



}
