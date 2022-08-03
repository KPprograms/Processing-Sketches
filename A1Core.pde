background(255);
size (450, 500);
// Blue rectangle 
fill(0,0,255);
rect(50, 50, 100, 60);

// Yellow arrow
fill(255, 255, 0);
rect(250, 100, 75, 50);
triangle(300, 50, 400, 125, 300, 200);
strokeWeight(4);
stroke(255, 255, 0);
line(300, 103, 300, 147); // yellow line to cover outline of triangle 

// Green ellipse 
stroke(0,0,0);
strokeWeight(1);
fill (0, 255, 0);
ellipse(100, 200, 150, 75);

// Red triangle
fill (255, 0, 0);
triangle(50, 300, 100, 275, 175, 325);

/////////3 strokes 
//orange stroke
stroke(255, 130, 0);
strokeWeight(4);
line(250, 250, 275, 350);

//green stroke 
stroke(0, 255, 0);
strokeWeight(6);
line(300, 250, 325, 350);

// purple stroke 
stroke(128, 0, 240);
strokeWeight(8);
line(350, 250, 375, 350);
