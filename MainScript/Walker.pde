class Walker{
  ArrayList<PVector> points;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float timeX;
  float timeY;
  boolean inBounds;
  
  float hue;
  
  Walker(float xs, float ys){
    this.points = new ArrayList<PVector>();
    this.points.add(new PVector(0, 0));
    this.xPos = 0;
    this.yPos = 0;
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.timeX = random(10000);
    this.timeY = random(10000);
    this.inBounds = true;
    
    this.hue = random(255);
  }
  
  void update(){
    if(this.inBounds){
      PVector next_point = new PVector();
      float curr_xSpeed;
      float curr_ySpeed;
      if(this.points.size() == 0){
        curr_xSpeed = this.xSpeed;
        curr_ySpeed = this.ySpeed;
      } else {
        float varX = noise(timeX);
        float varY = noise(timeY);
        varX = map(varX, 0, 1, -rand, rand);
        varY = map(varY, 0, 1, -rand, rand);
        //curr_xSpeed = this.xSpeed + varX;
        //curr_ySpeed = this.ySpeed + varY;
        curr_xSpeed = varX;
        curr_ySpeed = varY;
        this.timeX += timeStep;
        this.timeY += timeStep;
      }
      this.xPos += curr_xSpeed;
      this.yPos += curr_ySpeed;
      next_point.x = this.xPos;
      next_point.y = this.yPos;
      this.xSpeed = curr_xSpeed;
      this.ySpeed = curr_ySpeed;
      this.points.add(next_point);
      if(pow(this.xPos,2) + pow(this.yPos,2) > pow(globalBoundaries,2)){
        this.inBounds = false;
      }
    }
  }
  
  void display(){
    float hu = this.hue;
    beginShape();
    for(PVector point : points){
      //stroke(hu, 255, 255, 50);
      stroke(100, 100, 100, 50);
      vertex(point.x, point.y);
      hu += 2;
      if(hu > 255){
        hu = 0;
      }
    }
    endShape();
  }
}
