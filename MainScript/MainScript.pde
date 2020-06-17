ArrayList<Walker> texasRangers;
float rand;
float timeStep;
int globalBoundaries;
int nbrRangers;

void setup(){
  frameRate(30);
  fullScreen(P3D);
  colorMode(HSB);
  noFill();
  texasRangers = new ArrayList<Walker>();
  rand = 10;
  timeStep = 0.001;
  globalBoundaries = 500;
  nbrRangers = 200;
  for(int i=0; i<nbrRangers; i++){
    float initSpeedX = random(random(-5, -2), random(2, 5));
    float initSpeedY = random(random(-5, -2), random(2, 5));
    Walker texasRanger = new Walker(initSpeedX, initSpeedY);
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
