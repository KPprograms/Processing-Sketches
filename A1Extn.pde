
int x = 0;
int y = 0;
int w = 500;
int h = 500;
// SPIRAL 1 
int x1 = (width + 270);
int y1 = 120;
int size = 200;
// spiral 2
int x2 = (width + 20);
int y2 = 380;
int size2 = 20;

void setup(){
  background(0);
  size (500, 500);
  frameRate(10); 
}

void draw(){
  //background(int(random(0,255)));
  fill(random(0,255), random(0, 255), random(0, 255));
  ellipse(x1, y1, size, size);
  fill(random(0,255), random(0, 255), random(0, 255));
  ellipse(x, y, w, h);
  fill(random(0,255), random(0, 255), random(0, 255));
  ellipse(x2, y2, size2, size2);
  x = x + 10;
  y = y + 10;
  w = w - 20;
  h = h - 20;
  if (size <= 0){ size = 200;}
  else{size = size - 10;}
  if (size2 >= 220){ size2 = 20;}
  else{size2 = size2 + 10;}
}
