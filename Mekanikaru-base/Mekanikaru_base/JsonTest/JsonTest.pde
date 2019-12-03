JSONArray jsonNames, jsonScores;

PFont fontBig, fontSmall;

PImage bg;

ArrayList scores = new ArrayList();
ArrayList names = new ArrayList();

int[] highestNum = new int[10];
int[] indexOfNum = new int[10];



void setup() {
  frameRate(0.5);
  
  bg = loadImage("images/background.png");
  //bg.resize(1920,1080);
  
  //size(1920, 1080);
    fullScreen(2);
  
  fontBig = createFont("fonts/RobotoMono-Bold.ttf", 80);
  fontSmall = createFont("fonts/RobotoMono-Bold.ttf", 40);

  
  
  
}

void draw() {
  background(bg);
  
  sortJSON();
  
  //#1 HighScore
  textFont(fontBig,330);
  fill(#FFFFFF);
  text(jsonNames.getString(indexOfNum[0]), 521, 480); 
  
  fill(#60DAFF);
  text(jsonScores.getInt(indexOfNum[0]), 1344, 480);
  
  //Names
  textFont(fontSmall,81);
  fill(#FFFFFF);
  text(jsonNames.getString(indexOfNum[1]), 232, 661+59); 
  text(jsonNames.getString(indexOfNum[2]), 232, 781+59 ); 
  text(jsonNames.getString(indexOfNum[3]), 232, 900+59); 
  
  text(jsonNames.getString(indexOfNum[4]), 872, 661+59); 
  text(jsonNames.getString(indexOfNum[5]), 872, 781+59 ); 
  text(jsonNames.getString(indexOfNum[6]), 872, 900+59); 
  
  text(jsonNames.getString(indexOfNum[7]), 1448, 661+59); 
  text(jsonNames.getString(indexOfNum[8]), 1448, 781+59 ); 
  text(jsonNames.getString(indexOfNum[9]), 1448, 900+59); 
  
  //Numbers
  fill(#60DAFF);
  text(jsonScores.getInt(indexOfNum[1]), 423, 661+59);
  text(jsonScores.getInt(indexOfNum[2]), 423, 781+59);
  text(jsonScores.getInt(indexOfNum[3]), 423, 900+59);
  
  text(jsonScores.getInt(indexOfNum[4]), 1063, 661+59);
  text(jsonScores.getInt(indexOfNum[5]), 1063, 781+59);
  text(jsonScores.getInt(indexOfNum[6]), 1063, 900+59);
  
  text(jsonScores.getInt(indexOfNum[7]), 1639, 661+59);
  text(jsonScores.getInt(indexOfNum[8]), 1639, 781+59);
  text(jsonScores.getInt(indexOfNum[9]), 1639, 900+59);
  
  
  
  //Test printing to consol
  for(int i = 0; i < 10; i++){
    println(jsonNames.getString(indexOfNum[i]));
    println(jsonScores.getInt(indexOfNum[i]));
    println();
  }
  println();
}

void sortJSON(){
  jsonNames = loadJSONArray("highScoreNames.json");
  jsonScores = loadJSONArray("highScoreNumbers.json");
  
  
  for(int i = 0; i < highestNum.length; i++){
    highestNum[i] = 0;
    indexOfNum[i] = 0;
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[0]){
      highestNum[0] = jsonScores.getInt(i);
      indexOfNum[0] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[1] && i != indexOfNum[0]){
      highestNum[1] = jsonScores.getInt(i);
      indexOfNum[1] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[2] && i != indexOfNum[0] && i != indexOfNum[1]){
      highestNum[2] = jsonScores.getInt(i);
      indexOfNum[2] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[3] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2]){
      highestNum[3] = jsonScores.getInt(i);
      indexOfNum[3] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[4] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2] && i != indexOfNum[3]){
      highestNum[4] = jsonScores.getInt(i);
      indexOfNum[4] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[5] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2] && i != indexOfNum[3] && i != indexOfNum[4]){
      highestNum[5] = jsonScores.getInt(i);
      indexOfNum[5] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[6] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2] && i != indexOfNum[3] && i != indexOfNum[4] && i != indexOfNum[5]){
      highestNum[6] = jsonScores.getInt(i);
      indexOfNum[6] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[7] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2] && i != indexOfNum[3] && i != indexOfNum[4] && i != indexOfNum[5] && i != indexOfNum[6]){
      highestNum[7] = jsonScores.getInt(i);
      indexOfNum[7] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[8] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2] && i != indexOfNum[3] && i != indexOfNum[4] && i != indexOfNum[5] && i != indexOfNum[6] && i != indexOfNum[7]){
      highestNum[8] = jsonScores.getInt(i);
      indexOfNum[8] = i;
    }
  }
  
  for(int i = 0; i < jsonScores.size(); i++){
    if(jsonScores.getInt(i) > highestNum[9] && i != indexOfNum[0] && i != indexOfNum[1] && i != indexOfNum[2] && i != indexOfNum[3] && i != indexOfNum[4] && i != indexOfNum[5] && i != indexOfNum[6] && i != indexOfNum[7] && i != indexOfNum[8]){
      highestNum[9] = jsonScores.getInt(i);
      indexOfNum[9] = i;
    }
  }
}
