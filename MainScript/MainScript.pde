// TODO: Modify color along the line (function of the length)
// TODO: Add noise to smooth the curve

float rand;
int nbrRangers;
ArrayList<Walker> texasRangers;

void setup(){
  frameRate(30);
  fullScreen();
  texasRangers = new ArrayList<Walker>();
  rand = 5;
  nbrRangers = 200;
  for(int i=0; i<nbrRangers; i++){
    Walker texasRanger = new Walker(-2, 2);
    texasRangers.add(texasRanger);
  }
  stroke(255, 100);
}

void draw(){
  background(155);
  translate(width/2, height/2);
  for(int i=0; i<nbrRangers; i++){
    Walker texasRanger = texasRangers.get(i);
    texasRanger.update();
    texasRanger.display();
  }
}
