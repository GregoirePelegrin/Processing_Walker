class Walker{
  ArrayList<IntList> linesList;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float timeX;
  float timeY;
  boolean inBounds;
  
  FloatList hues;
  
  Walker(float xs, float ys){
    this.linesList = new ArrayList<IntList>();
    this.xPos = 0;
    this.yPos = 0;
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.timeX = random(10000);
    this.timeY = random(10000);
    this.inBounds = true;
    
    this.hues = new FloatList();
    this.hues.append(random(255));
  }
  
  void update(){
    if(this.inBounds){
      IntList curr_line = new IntList();
      float curr_xSpeed;
      float curr_ySpeed;
      curr_line.append((int)xPos);
      curr_line.append((int)yPos);
      if(this.linesList.size() == 0){
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
      xPos += curr_xSpeed;
      yPos += curr_ySpeed;
      curr_line.append((int)xPos);
      curr_line.append((int)yPos);
      this.xSpeed = curr_xSpeed;
      this.ySpeed = curr_ySpeed;
      this.linesList.add(curr_line);
      if(pow(this.xPos,2) + pow(this.yPos,2) > pow(globalBoundaries,2)){
        this.inBounds = false;
      }
    }
  }
  
  void display(){
    for(int i=0; i<this.linesList.size(); i++){
      if(i == this.hues.size()){
        float curr_hue = this.hues.get(i-1);
        curr_hue += 1;
        if(curr_hue > 255){
          curr_hue = 0;
        }
        this.hues.append(curr_hue);
      }
      stroke(this.hues.get(i), 255, 255, 50);
      IntList curr_line = linesList.get(i);
      line(curr_line.get(0), curr_line.get(1), curr_line.get(2), curr_line.get(3));
    }
  }
}
