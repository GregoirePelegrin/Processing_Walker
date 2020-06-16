class Walker{
  ArrayList<IntList> linesList;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float timeX;
  float timeY;
  boolean inBounds;
  
  ArrayList<IntList> colorsList;
  
  float timeRed;
  float timeGreen;
  float timeBlue;
  
  Walker(float xs, float ys){
    this.linesList = new ArrayList<IntList>();
    this.xPos = 0;
    this.yPos = 0;
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.timeX = random(10000);
    this.timeY = random(10000);
    this.inBounds = true;
    
    this.colorsList = new ArrayList<IntList>();
    
    this.timeRed = random(10000);
    this.timeGreen = random(10000);
    this.timeBlue = random(10000);
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
      IntList curr_line = linesList.get(i);
      if(i == this.colorsList.size()){
        colorsList.add(colorCreate());
      }
      colorChange(colorsList.get(i));
      line(curr_line.get(0), curr_line.get(1), curr_line.get(2), curr_line.get(3));
    }
  }
  
  IntList colorCreate(){
    IntList curr_color = new IntList();
    float red = noise(this.timeRed);
    float green = noise(this.timeGreen);
    float blue = noise(this.timeBlue);
    red = map(red, 0, 1, 0, 255);
    green = map(green, 0, 1, 0, 255);
    blue = map(blue, 0, 1, 0, 255);
    this.timeRed += timeStep;
    this.timeGreen += timeStep;
    this.timeBlue += timeStep;
    curr_color.append((int)red);
    curr_color.append((int)green);
    curr_color.append((int)blue);  
    return curr_color;
  }
  
  void colorChange(IntList new_color){
    int red = new_color.get(0);
    int green = new_color.get(1);
    int blue = new_color.get(2);
    stroke(red, green, blue, 50);
  }
}
