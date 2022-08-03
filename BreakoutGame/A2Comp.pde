// Assignment 2 CGRA 151
// ******************************COMPLETION***************************************** 
// name: Kevin Lee

// Variables 
float x = 100; // positions 
float y = 200;
float vx = 4.0;
float vy = 6.0; 
float radius = 20;
float batWidth = 160;
float batHeight = 10;
float obsHeight = 20;
int numObs = 6;
Obstacle [] boxes;




// variables for obstacles:
void setup(){
  size (600, 600);
  frameRate = 10;
  boxes = new Obstacle[numObs];
  float boxWidth = width/numObs;
  for (int i=0; i<numObs; i++){
    boxes[i] = new Obstacle(boxWidth *  i + 10, 70, boxWidth - 10, 30, 0);
  }
  
}

void draw(){
  background (255, 255, 255);
  fill (255, 0, 0);
  noStroke();
  circle(x, y, 2*radius);
  fill(0);
  rect(mouseX - (batWidth/2), height-15, batWidth, batHeight); 
  x = x + vx;
  y = y + vy;
  
  // Drawing blocks 
  for (int i = 0; i<numObs; i++){
    boxes[i].drawBox();
  }
  
  // bouncing off the wall:
  if (x > width-radius){ vx = -vx;}
  if (x < radius){ vx = - vx;}
  if (y > height - radius){ vy = -vy ;}
  if ( y < radius){ vy = - vy;}
  
  // variables for bat collisions
  float batLeft = mouseX - (batWidth/2);
  float batRight = mouseX+(batWidth);
  float batTop = height -15 ;
  float batBottom = height - 5;
  if(y+radius>batTop && x>batLeft && x<batRight && y-radius< batBottom){
    if(x+radius > batLeft && y>batTop && y< batBottom) { x-=5; vx = - vx;} // bounce to left if hits the left
    vy = -vy;
  }
  
  //Bouncing off all obstacles
  for (int i = 0; i<numObs; i++){ 
    if(x > boxes[i].getLeft()-radius && x < boxes[i].getRight()+radius && y > boxes[i].getTop()-radius && y < boxes[i].getBottom()+radius){
      if(y > boxes[i].getY()) {  y += 5; } // moves backwards 
      if(x > boxes[i].getX())  {  x += 5; }  
      if(x < boxes[i].getX())  {  x -= 5; }  
      if(y < boxes[i].getY())  {  y -= 5; } 
      boxes[i].statusChange();
      vy = -vy; // changes the direction 
    }
  }   
}
