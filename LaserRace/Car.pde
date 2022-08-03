class Car{
  // fields
  private float x;
  private float y;
  // global variables 
  float t = 0.0; // position ob the curve
  float velocity = 0.009;
  int s = 0; // number 
  color col;
  
  //constructor
  public Car (color col, int num){
    s = num;
  }
  
  // Drawing all the cars 
  void drawCar(){
    pushMatrix();
    PVector tangent = getTangent(t, s);
    PVector point =getPoint(t, s);
    translate(point.x, point.y);
    rotate(atan2(tangent.y, tangent.x));
    drawShape(); // draw the shape of the car    
    translate(-point.x, -point.y);
    rotate(atan2(tangent.y, tangent.x));
    t += velocity;

    if (t>=1.0) {
      t=0.0;
      s++;
      s=s%(controlPoints.size()-3);
    }
    popMatrix();
  }
  
  // Returns the point 
  PVector getPoint(float n, int i) {
    x = curvePoint(controlPoints.get(i%controlPoints.size()).x, controlPoints.get((i+1)%controlPoints.size()).x, controlPoints.get((i+2)%controlPoints.size()).x, controlPoints.get((i+3)%controlPoints.size()).x, n);
    y = curvePoint(controlPoints.get(i%controlPoints.size()).y, controlPoints.get((i+1)%controlPoints.size()).y, controlPoints.get((i+2)%controlPoints.size()).y, controlPoints.get((i+3)%controlPoints.size()).y, n);
    return new PVector(x, y);
  }
  
  // Returns the tangent of the curve at the point 
  PVector getTangent(float n, int i) {
    float xT = curveTangent(controlPoints.get(i%controlPoints.size()).x, controlPoints.get((i+1)%controlPoints.size()).x, controlPoints.get((i+2)%controlPoints.size()).x, controlPoints.get((i+3)%controlPoints.size()).x, n);
    float yT = curveTangent(controlPoints.get(i%controlPoints.size()).y, controlPoints.get((i+1)%controlPoints.size()).y, controlPoints.get((i+2)%controlPoints.size()).y, controlPoints.get((i+3)%controlPoints.size()).y, n); 
    return new PVector(xT, yT);
  }  
  
  // Drawing the car shape
  void drawShape(){
    stroke(0,0,0);
    fill (col);
    beginShape();
      vertex(0,0);
      vertex(-10,-10);
      vertex(30,0);
      vertex(-10, 10);
    endShape(CLOSE);
  }
  
  // Change velocity depending on mouse events. 
  void changeVelocity(float factor) {
    velocity += (0.005 * factor);
    if (velocity < 0.009){
      velocity = 0.009;
    }
    if (velocity > 0.15){
      velocity = 0.15;
    }
  }
  
  
  
}
