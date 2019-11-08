static int plugA = 5;
static int plugB = 6;

static int jack1 = 2;
static int jack2 = 3;

//boolean Ainto1 = false;
//boolean Ainto2 = false;
//boolean Binto1 = false;
//boolean Binto2 = false;

void setup() {
 Serial.begin(9600);
 pinMode(jack1, INPUT);
 pinMode(jack2, INPUT);
 pinMode(plugA, OUTPUT);
 pinMode(plugB, OUTPUT);

}

void loop() {
  //Activate plug A and check for connections
  digitalWrite(plugA, HIGH); //Start powering plugA

    Serial.print("a"); //Start transmition part 1
      if(digitalRead(jack1) == HIGH){ 
        Serial.print("Y"); //Plug A In Slot 1 YES
      }else{ 
        Serial.print("N"); //Plug A in Slot 1 NO
      }
    Serial.print("a"); //Stop transmition part 1
    Serial.println();

    Serial.print("b"); //Start transmition part 2
       if(digitalRead(jack2) == HIGH){
        Serial.print("Y"); //Plug A In Slot 2 YES
      }else{
        Serial.print("N"); //Plug A In Slot 2 NO
      }
    Serial.print("b"); //Stop transmition part 2
    Serial.println();

  digitalWrite(plugA, LOW); //Stop powering plugA

  //Activate plug B and check for connections
  digitalWrite(plugB, HIGH); //Start powering plugB

    Serial.print("c"); //Start transmition part 3
      if(digitalRead(jack1) == HIGH){ 
        Serial.print("Y"); //Plug B In Slot 1 YES
      }else{ 
        Serial.print("N"); //Plug B in Slot 1 NO
      }
    Serial.print("c"); //Stop transmition part 3
    Serial.println();

    Serial.print("d"); //Start transmition part 4
       if(digitalRead(jack2) == HIGH){
        Serial.print("Y"); //Plug B In Slot 2 YES
      }else{
        Serial.print("N"); //Plug B In Slot 2 NO
      }
    Serial.print("d"); //Stop transmition part 4
    Serial.println();

  digitalWrite(plugB, LOW); //Stop powering plugB

  Serial.print("&");
  Serial.println();

  delay(100);

}
