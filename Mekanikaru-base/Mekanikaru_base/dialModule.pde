
public float[] leftGaugeArr = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30};

public float[] rightGaugeArr = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30};


int setLeftGauge() {

  int indexVal= floor(random(10));

  leftGauge = floor(leftGaugeArr[indexVal]);


  println("leftGuage: " + leftGauge);

  return leftGauge;
}
int setRightGauge() {

  int indexVal= floor(random(10));

  rightGauge= floor(rightGaugeArr[indexVal]); 

  return rightGauge;
}

int setTargetDial(float l, float r) {
  float leftSq = l * l;

  float rightSq = r * r;

  float addedSq = leftSq + rightSq;
  println("addedSquare"+addedSq);
  float sqRooted = sqrt(addedSq);


  return floor(sqRooted);
}


void dialSet() {

  leftGauge = setLeftGauge();
  rightGauge = setRightGauge();


  targetDial = setTargetDial(leftGauge, rightGauge);
}



void checkDialMatch() {

  if (dialVal <targetDial+ 2 && dialVal > targetDial -2) {
    if (confirm>0) {
      println("round won");
background(33,200,46);    }
  }
}



void setMatrix() {
  for (int i= 0; i<leftGaugeArr.length; i++) {
    for (int j= 0; j<rightGaugeArr.length; j++) {
      
    }
  }
}
