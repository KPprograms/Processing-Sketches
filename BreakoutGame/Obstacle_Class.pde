class Obstacle{
  float x;
  float y;
  float boxHeight;
  float boxWidth;
  int status;
  
  public Obstacle(float xPos, float yPos, float bWidth, float bHeight, int bStatus){
    x = xPos;
    y = yPos;
    boxWidth = bWidth;
    boxHeight = bHeight; 
    status = bStatus; 
    drawBox();
  }
  
  public float getX(){return x;} // returns the x position 
  
  public float getY(){ return y;}// returns the y position
  
  public int getStatus(){ return status;} // returns the number of times it has been hit 
  
  public float getLeft(){ return x;} // returns left value of the block 
  
  public float getRight() {return x+boxWidth;} // returns the right value of the block 
  
  public float getBottom() {return y+boxHeight;} // Returns the bottom value of the block
  
  public float getTop() { return y;}  // returns the top value of the block. 
  
  public void statusChange() { status += 1;}
  
  public void drawBox(){ // draws the boxes with appropriate colors. 
    if (status == 0) { fill(0,255,0);}
    else if (status == 1) { fill(255,128,0);}
    else if (status == 2) { fill(255, 0, 0);}
    else {x = -200; y = - 200;} // locates the blocks out side of the screen. (therefore removed) 
    rect(x, y, boxWidth, boxHeight);
  } 
}
