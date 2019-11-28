
public float[] leftGaugeArr = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30};

public float[] rightGaugeArr = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30};


int setLeftGauge() {

  int indexVal= floor(random(10));

  leftGauge = floor(leftGaugeArr[indexVal]);


  //println("leftGuage: " + leftGauge);

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
  //println("addedSquare"+addedSq);
  float sqRooted = sqrt(addedSq);


  return floor(sqRooted);
}


void dialSet() {
  motorSet = 1;

  leftGauge = setLeftGauge();
  rightGauge = setRightGauge();


  targetDial = setTargetDial(leftGauge, rightGauge);
//  println("left: "+leftGauge);
//println("right: "+ rightGauge);
}


boolean dialTaskDone = false;
void checkDialMatch() {
  //motorSet = 0;

  if (dialVal <targetDial+ 2 && dialVal > targetDial -2) {
    if (confirm<1) {
      dialTaskDone = true;
      //println("round won");
    }
  }
}



void setMatrix() {
  for (int i= 0; i<leftGaugeArr.length; i++) {
    for (int j= 0; j<rightGaugeArr.length; j++) {
      noFill();
      stroke(2);
      int valForDisplay = setTargetDial(leftGaugeArr[i], rightGaugeArr[j]);

      if (targetDial > 0) {
        if (targetDial == valForDisplay)
          fill(100);
      } else {
        fill(0, 0, 255);
      }
      int posX = 500;
      int posY = 500;
      int offset =30;
      rect(posX+(i+1)*40, posY+(j+1)*40, 30, 30);
      fill(0, 0, 255);
      textSize(20);
      text(valForDisplay, posX+(i+1)*40, offset+posY+(j+1)*40);
    }
  }
}
