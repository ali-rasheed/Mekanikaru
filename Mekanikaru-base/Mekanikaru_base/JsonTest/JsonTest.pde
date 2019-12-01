JSONArray json;


void setup() {
  frameRate(1);
  size(400,800);
  textSize(32);
}

void draw() {
  background(100);
  json = loadJSONArray("highScore.json");
    
    for(int i = 0; i < json.size(); i++) {
      String score = json.getString(i);
      text(score,60,50+40*i);
  }
}
