// shooter class:
class Shooter{
  float x, y;
  color baseColor = color(255,255,255); // white  
  int shooterWidth = 30;
  
  //Contructor:
  public Shooter(float xPos, float yPos){
    x = xPos;
    y = yPos;
  }
  
  void drawShooter(){
    noStroke();
    fill(baseColor);
    ellipseMode(CENTER);
    ellipse(x,y,shooterWidth,shooterWidth);

    pushMatrix();
    translate(x, y);
    noStroke();
    fill(11,85,150); // blue 
    beginShape();
      vertex(0,0);
      vertex(-10,-10);
      vertex(0, -40);
      vertex(10, -10);
      vertex(0,0);
    endShape();
    popMatrix();
  }
  
  // Method to Update user interactions with shooter:
  void updateShooter(){ 
    if (x + shooterWidth/2 >= width){ // Checking for right edge
      x = width - shooterWidth/2;
    }
    
    if (x - shooterWidth/2 <= 0) { // Checking for left edge
      x = 0 + shooterWidth/2;
    }
    
    if (keyPressed && keyCode == LEFT){ // moving left
      x -= 5;
    }
    if (keyPressed && keyCode == RIGHT){ // moving right
      x += 5;
    }
  }
  
  // Getters:
  float getX(){
    return x; // returns x position of shooter (CENTER)
  }
  
  float getY(){
    return y; //returns y Position of shooter.
  }
}
