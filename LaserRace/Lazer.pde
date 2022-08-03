class Lazer {
  // global Variables
  ArrayList<PVector> carPosition = new ArrayList<PVector>();

  void makeLazer() {
    fill(255, 0, 0);
    noStroke();
    circle(width/2, height/2, 33.33);// making the circle 
    drawPointer();
  }

  // Draw the pointer 
  void drawPointer() {
     float posX = width/2; // center of window 
    float posY = height/2;
    float angle = atan2(mouseY-posY, mouseX-posX); // getting angle at where  
    pushMatrix(); 
    translate(posX, posY); // translate the shape to the center 
    rotate(angle); // rotate the shooter to the direction of the mouse. 
    stroke(0, 0, 0);
    fill(255, 0, 0);
    beginShape(); // drawing the rectangle pointer 
    vertex(-3, -3);
    vertex(30, -3);
    vertex(30, 3);
    vertex(-3, 3);
    vertex(-3, -3);
    endShape();
    //line(30 ,0,width/1.25, 0);
    popMatrix();
    myLine(posX, posY, mouseX, mouseY);
  }
  
  // function for drawing the lazer for all quadrants.
  void myLine(float x0, float y0, float x1, float y1) {
    float dx = x1 - x0;
    float dy = y1 - y0;
    float steps = abs(dx) > abs(dy) ? abs(dx) : abs(dy);
    float xInc = dx/steps;
    float yInc = dy/steps;
    float x = x0;
    float y = y0;
    for(int i = 0; i<400; i++) { 
      carPosition.add(new PVector(x, y));
      point(x, y);
      x += xInc; 
      y += yInc;
    }
  }
}
