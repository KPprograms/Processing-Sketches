
size (600, 600);
background (128);
for (int i = 0; i < width - 100; i++){
  float x = random (-50, width); // minus us used to make the triangle start before the window. 
  float y = random(-50, height);
    triangle (random(x, x + 100), random(y, y+100), random(x, x + 100), random(y, y+100), random(x, x + 100), random(y, y+100));
  }
