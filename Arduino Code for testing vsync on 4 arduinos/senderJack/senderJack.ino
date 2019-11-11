#include <VSync.h>

//  Create a new sender here
//  Put the number of variables you want to sync in the pointy brackets
//  Here we just want to sync one value
ValueSender<12> sender;

//  here we store the value we read from analog bin A0
boolean jackArr[12] =  [jA1,jA2,jA3,jA4,jB1,jB2,jB3,jB4,jC1,jC2,jC3,jC4];

void setup()
{
  
  //  You need to call Serial.begin() in order for value syncing to work.
  //  Make sure to use the same baudrate on both ends. More baud = more speed
  Serial.begin(19200);

  //  Tell the sending syncronizer what variable needs to be kept in sync.
  //  In this case it is just the variable 'analogValue' but if you sync more,
  //  you need to make sure to use the same order on the sending and the receiving side.
for(int i =0;i< sizeOf(jackArr);i++){

}
}

void loop()
{
  // Read a value from analog pin A0. You could hook up a LDR or a potmeter.
  analogValue = analogRead(A0);
  

  //  You need to call sync() for once every loop.
  //  It does not matter where you call it but for the ValueSender
  //  it makes sense at the end.
  sender.sync();
}
