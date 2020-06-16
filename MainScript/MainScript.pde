float rand;
float timeStep;
int nbrRangers;
ArrayList<Walker> texasRangers;

void setup(){
  frameRate(15);
  fullScreen();
  texasRangers = new ArrayList<Walker>();
  rand = 1;
  timeStep = 0.05;
  nbrRangers = 100;
  for(int i=0; i<nbrRangers; i++){
    Walker texasRanger = new Walker(-2, 2);
    texasRangers.add(texasRanger);
  }
  stroke(255, 50);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int i=0; i<nbrRangers; i++){
    Walker texasRanger = texasRangers.get(i);
    texasRanger.update();
    texasRanger.display();
  }
}
