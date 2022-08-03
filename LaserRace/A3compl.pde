import java.util.ArrayList;
// global variables
ArrayList<PVector> controlPoints;
ArrayList<Car> cars;
int numOfPoints = 6;
PVector current; 
int knobWidth = 10;
int numOfCars = 4;
int count = 10;
int circleWidth = 20;
Lazer l;

void setup(){
  size (900, 750);
  frameRate(60);
  controlPoints = new ArrayList<PVector>(); //initialising arraylist of points and cars
  cars = new ArrayList<Car>();
  for (int i = 0; i<numOfCars; i++){ // adding the cars 
    cars.add(new Car(color(255,255,255), i)); 
  }
 count = 10; // the number of counts 
 createCurve(); // creting the curve.
}

void createCurve(){ // adding the points for curve:
  controlPoints.add(new PVector(150,100));
  controlPoints.add(new PVector(670,height/2));
  controlPoints.add(new PVector(330 ,height/2+50));
  controlPoints.add(new PVector(630,123));
  controlPoints.add(new PVector(800,height/2));
  controlPoints.add(new PVector(300,650));
  // points to loop back:
  controlPoints.add(controlPoints.get(0));
  controlPoints.add(controlPoints.get(1));
  controlPoints.add(controlPoints.get(2));
}

void drawLaserPointer(){
  ellipseMode(CENTER);
  stroke (0);
  fill(255,0,0); // red
  ellipse(width/2 , height/2, circleWidth, circleWidth); // laser circle 
  stroke(0);
  // Rectangle 
  float rectX = width/2  ; // position of the rectangle 
  float rectY = height/2 ;
  float angle = atan2(mouseY-rectY, mouseX-rectY);
  translate(rectX, rectY);
  rotate(angle);
  stroke(0);
  fill(255,0,0); // red 
  beginShape(); // rectangle shape using begin shape.
    vertex(-3, -3);
    vertex(25, -3);
    vertex(25, 3);
    vertex(-3, 3);
    vertex(-3, -3);
  endShape();
  stroke(255,0,0);
  line(25, 0, width/1.25, 0); 

}

void draw(){
  background (255);
  stroke(0);  
  strokeWeight(30);
  noFill();
  beginShape();// Drawing the curve 
    for (PVector points : controlPoints){
      curveVertex(points.x, points.y);
    }
  endShape();
  
  // drawing the knobs of the control points:
  stroke(255,165,0); // orange
  noFill();
  strokeWeight(1);
  for (PVector point : controlPoints){
    rect(point.x-knobWidth/2, point.y - knobWidth/2, knobWidth, knobWidth);
  }
  
  //drawing connection 
  beginShape();
    for (PVector point :controlPoints){
      vertex(point.x, point.y);
    }
  endShape();    
  //drawing the cars:
  for (Car car : cars){
    car.drawCar();
  }
    
  // Drawing the laser shooter:
  l = new Lazer();
  l.makeLazer();
  // checking if 
  for (PVector n : l.carPosition) {
    for (Car t : cars) {
      float dist=abs(sqrt(sq(n.x-t.x)+sq(n.y-t.y))); //calculation
      if (dist<=3) {
        count = 0;
        t.col=color(255, 0, 0); //Make car red
      }
      //once the car it red wait for the count to get to 10 then change the colour back to white
      if (count >= 10) {
        t.col = color(255); //red
      }
    }
  }
  count++; 
}

// Mouse Pressed
void mousePressed(){
  int w = knobWidth;
  for (PVector point : controlPoints){
    if (mouseX < point.x+w && mouseX > point.x-w && mouseY < point.y+w && mouseY > point.y-w){
      current = point;
    }
  }
}

//When Mouse released do nothing 
void mouseReleased(){
  current = null; 
}

// mouse wheel change the velocity 
void mouseWheel(MouseEvent event){
  float change = event.getCount();
  for (Car c: cars){
    c.changeVelocity(- change);
  }
}
// mouse dragged 
void mouseDragged() {
  if (current == null){
    return;
  } else {
    current.x = mouseX;
    current.y = mouseY;
  }
} 
