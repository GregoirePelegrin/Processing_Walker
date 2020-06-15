class Walker{
  ArrayList<IntList> linesList;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  boolean inBounds;
  
  Walker(float xs, float ys){
    this.linesList = new ArrayList<IntList>();
    this.xPos = 0;
    this.yPos = 0;
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.inBounds = true;
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
        curr_xSpeed = this.xSpeed + random(-rand, rand);
        curr_ySpeed = this.ySpeed + random(-rand, rand);
      }
      xPos += curr_xSpeed;
      yPos += curr_ySpeed;
      curr_line.append((int)xPos);
      curr_line.append((int)yPos);
      this.xSpeed = curr_xSpeed;
      this.ySpeed = curr_ySpeed;
      this.linesList.add(curr_line);
      boolean inBoundsX = true;
      boolean inBoundsY = true;
      if(xPos <= -width/2 || xPos >= width/2){
        inBoundsX = false; 
      }
      if(yPos <= -height/2 || yPos >= height/2){
        inBoundsY = false; 
      }
      this.inBounds = inBoundsX && inBoundsY;
    }
  }
  
  void display(){
    for(int i=0; i<this.linesList.size(); i++){
      IntList curr_line = linesList.get(i);
      line(curr_line.get(0), curr_line.get(1), curr_line.get(2), curr_line.get(3));
    }
  }
}
