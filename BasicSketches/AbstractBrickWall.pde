

background(128);
size(600, 600);
for (int i = 0; i < height; i += 15){
  int x = 0;
  while (x < width){
    int rect_width = int(random (0, 25));
    fill(255); // white 
    rect(x, i, rect_width, 15);
    x = x + rect_width + 5; // gap is 5 
  }
}
