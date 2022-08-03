void setup(){
  background(128);
  size (500, 500);
  frameRate(5);
}

void draw(){
  if (mousePressed){
    fill(255,0,0);
    ellipse(mouseX, mouseY, 75, 75);
  }
  else {
    fill (0, 0, 255);
    ellipse(mouseX, mouseY, 75, 75);
  }
}
