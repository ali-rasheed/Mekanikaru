boolean testIfRGBLEDTaskDone() {
  if (LEDtask == 0){
    if(LED1StoppedOn == 1 && LED2StoppedOn == 2) return true;
  }else return false;
  
  return false;
}
