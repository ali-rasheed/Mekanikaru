import processing.serial.*;
Serial port; // Create object from Serial class

byte[] inBuffer = new byte[255];

boolean Ain1 = false; //a|a
boolean Ain2 = false; //b|b
boolean Bin1 = false; //c|c
boolean Bin2 = true; //d|d

//Game stuff
float timer = 400;
int task = 0; //0-Ain1,Bin2 1-Ain2,Bin1 2-AinNone, Bin1 3-AinNone, Bin2 4-Ain1, BinNone 5-Ain2, BinNone

              //    A | B
              // 0: 1 | 2
              // 1: 2 | 1
              // 2: / | 1
              // 3: / | 2
              // 4: 1 | /
              // 5: 2 | /

int score = 0;

String[] gameInstructions = {"Connect A to 1 and B to 2", "Connect A to 2 and B to 1", 
                             "Disconnect A and Connect B to 1", "Disconnect A and Connect B to 2",
                             "Connect A to 1 and Disconnect B", "Connect A to 2 and Disconnect B"};

void setup() {
  size(600,600);
  port = new Serial(this, Serial.list()[1], 9600);
  textSize(30);
}

void draw() {
  incomingData();
  printInput();
  
  //Drawing
  background(100);
  
  //Drawing the timer
  //Outer Box
  stroke(255);
  noFill();
  rect(100,100,400,60);
  
  //Inner Box
  noStroke();
  fill(10,10,200);
  rect(102,102,timer,58);
  
  timer-= 0.5;
  
  fill(0);
  text(gameInstructions[task],100,350);
  fill(255);
  text(score, 50,50);
  
  if(testIfTaskDone() == true) {
    score++;
    timer = 400;
    task = (int)random(0,6);
  }
  
  if(timer <= 0) {
      background(0);
      fill(255);
      text("Game Over", 220,300);
  }
  
}

void incomingData() {
  if (0 < port.available()) {
    
    port.readBytesUntil('&', inBuffer);  //read in all data until '&' is encountered
    
    if (inBuffer != null) {
      String myString = new String(inBuffer);
      String testForYes = "Y"; //Cant compare strings with == so this is the string it is being checked against
      
      String[] full = splitTokens(myString, "&"); //First split
      if(full.length <2) return; //Return if broken split
      
      String[] a = splitTokens(full[0], "a"); //Get the Ainto1 Reading
      if(testForYes.equals(a[1]) == true) Ain1 = true;
      else Ain1 = false;
      
      String[] b = splitTokens(full[0], "b"); //Get the Ainto2 Reading
      if(testForYes.equals(b[1]) == true) Ain2 = true;
      else Ain2 = false;
      
      String[] c = splitTokens(full[0], "c"); //Get the Binto1 Reading
      if(testForYes.equals(c[1]) == true) Bin1 = true;
      else Bin1 = false;
      
      String[] d = splitTokens(full[0], "d"); //Get the Binto2 Reading
      if(testForYes.equals(d[1]) == true) Bin2 = true;
      else Bin2 = false;
      
    }
  }
}

void printInput() {
  if(Ain1 == true) println("A is in 1");
  else println("A is not in 1");
  
  if(Ain2 == true) println("A is in 2");
  else println("A is not in 2");
  
  if(Bin1 == true) println("B is in 1");
  else println("B is not in 1");
  
  if(Bin2 == true) println("B is in 2");
  else println("B is not in 2");
  
  println(" ");
}

boolean testIfTaskDone() {
  if(task == 0){
    if(Ain1 == true && Ain2 == false && Bin1 == false && Bin2 == true){
      return true;
    }else return false;
  }
  
  if(task == 1){
    if(Ain1 == false && Ain2 == true && Bin1 == true && Bin2 == false){
      return true;
    }else return false;
  }
  
  if(task == 2){
    if(Ain1 == false && Ain2 == false && Bin1 == true && Bin2 == false){
      return true;
    }else return false;
  }
  
  if(task == 3){
    if(Ain1 == false && Ain2 == false && Bin1 == false && Bin2 == true){
      return true;
    }else return false;
  }
  
  if(task == 4){
    if(Ain1 == true && Ain2 == false && Bin1 == false && Bin2 == false){
      return true;
    }else return false;
  }
  
  if(task == 5){
    if(Ain1 == false && Ain2 == true && Bin1 == false && Bin2 == false){
      return true;
    }else return false;
  }
  
  return false;
}

//void gameOver(){
//  while(true){
//    background(0);
//    text("Game Over", 300,300);
//  }
//}
