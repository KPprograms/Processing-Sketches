// Class for creating the shapes the user will shoot

class Shape{
  //fields;
  float x, y;
  int shapeWidth = 40; 
  int shapeHeight = 40;
  int life = 3;
  String shape;
  boolean alive = true;
  boolean gameOver = false;
  
  //Contrustor:
  public Shape (float xPos, String Shape){
    x = xPos;
    y = -15;
    shape = Shape;
    if (state == "easy"){
      shapeWidth = 50;
      shapeHeight = 50;
    }
    
  }
  
  void drawShape(){    
    if (life == 3){
      //fill(0,255,0); // Green 
      fill(random(0,255), random(5,255), random(0,255));
    }
    else if (life == 2){
      fill(255,165,0); // Orange 
    }
    else if (life == 1){
      fill(255,0,0); // Red 
    }
    else if (life <= 0){      
      alive = false;
    }
    noStroke(); 
    if (shape == "ellipse"){
        ellipseMode(CORNER); // Collision is coded for shape left and top.
        ellipse(x,y, shapeWidth, shapeHeight);
    }
    else if (shape == "rect"){
      rectMode(CORNER); 
      rect(x,y, shapeWidth, shapeHeight);
    }
    else if (shape == "tri"){
      triangle(x,y, x+(shapeWidth/2), y-shapeHeight, x+shapeWidth, y); 
    }
    else if (shape == "arc"){
      ellipseMode(CORNER);
      arc(x, y, shapeWidth, shapeHeight, PI, TWO_PI);
    }
  }
  
  void updateShape(){
    if (state == "easy"){
      y += 0.8; // update the position 
    } else{
      y += 1;  
    }
    if (y >= Bline){ // Checks if the shape has hit the floor
      gameOver = true;
    }    
    else if (isShot()){
      life --;
      score += 10;
    }
  }
  
  boolean isShot(){
    for (Bullet bullet: bullets){
      if (bullet.x + bullet.diam/2 > x && bullet.x - bullet.diam/2 < x + shapeWidth && bullet.y > y && bullet.y < y + shapeHeight){  //  bullet mode is on center 
        bullets.remove(bullet);  // remove bullet when shot     
        return true;
      }
    }
   return false;
  }
  
  // Getters For the main class //
  boolean isGameOver(){ // is game over?
    return gameOver;
  }
  
  
  boolean alive(){ // is this shape alive?
    return alive;
  }
}
