//CGRA 151 Final Project 
// Name : Kevin Lee
// ID : 300563771
//------------------------------------------------------------------------------------
// global Variables
ArrayList <Bullet> bullets = new ArrayList<Bullet>();
ArrayList <Shape> shapes = new ArrayList<Shape>();
boolean canShoot = true;
int delay = 0;
float Bline;
Shooter shooter = new Shooter(width/2,0.9*500); // creating th shooter
int score = 0; // initialising score
PFont font;
PFont titlePage;
String state = "menu"; // initial state;
int gameOverCount = 0;

void setup(){
  background(0); // black 
  size(800,500);
  Bline = 0.9 * height; // bottom line 
  frameRate(60);
  font = createFont("Arial", 30, true); // initialising fonts
  titlePage = createFont("Arial", 50, true);
}


void draw(){
  background(0);
  if (state == "menu"){ // main menu
    mainMenu();
  }
  else { // playing game
    shooter.drawShooter();  // drawing shooter 
    drawScore();
    checkShape();
    for (Shape shape : shapes){ // draw Shapes
      shape.drawShape();
    }
    
    int upperLimit; // variable to set number of shapes generated
    if (state == "easy"){
      upperLimit = 125;
    } else {
      upperLimit = 175;
    }
    
    int num = int(random(0,upperLimit)); 
    if (num == 50) {
      int randNum = int(random(0,5));
      if (randNum == 1){
        shapes.add(new Shape(random(0,width-20), "ellipse")); // generating the shapes 
      } 
      else if (randNum == 2) {
        shapes.add(new Shape(random(0,width-20), "rect"));
      }
      else if (randNum == 3) {
        shapes.add(new Shape(random(0,width-20), "tri"));
      }
      else if (randNum == 4){
        shapes.add(new Shape(random(0,width-20), "arc"));
      }
    }
    
    shooter.updateShooter();  // check for user updates
    updateBullet();
    for (Shape shape : shapes){
      shape.updateShape();
    }
    
    for (Bullet b: bullets){     // drawing bullets:  
      b.drawBullet();
    }  
  }
}

void updateBullet(){  
  if ((mousePressed && canShoot) || (keyPressed && key == ' ' && canShoot)){
    bullets.add(new Bullet(shooter.getX(), shooter.getY()));
    canShoot = false;
    delay = 0;
  } else {
    delay ++;
  }
  if (delay >= 20){
    canShoot = true;
  }
}

void checkShape (){
  ArrayList <Shape> shapeRemove = new ArrayList<Shape> ();
  for (Shape shape : shapes){ // updating the status of the shapes:
    if (shape.isGameOver()){
      gameOver();
    }
    if (!shape.alive()){
      shapeRemove.add(shape);
    }
  }
  for (Shape shape : shapeRemove){
    shapes.remove(shape);
  }
}

void drawScore(){
  textFont(font);
  fill(255);
  text("Score: " + String.valueOf(score), 300, Bline+40);
}

void gameOver(){
  textFont(font);
  textAlign(CENTER);
  stroke(255);
  text("Game Over ", width/2, height/2);
  delay(100);
  if (gameOverCount > 20){
    state = "menu";
    gameOverCount = 0;
  } else {
    gameOverCount++;
  }
}


void mainMenu(){
  textAlign(CENTER);
  for (int i =0; i<40;i++){
    fill(random(0,160),random(0,150),random(0,160));
    rect(random(0,width), random(0,height), random(10,40), random(10,40));
    fill(random(0,160),random(0,150),random(0,160));
    ellipse(random(0,width), random(0,height), random(10,40), random(10,40));
  }
  rectMode(CENTER);
  fill(0);
  rect(width/2, height*0.2, width, 80); // box for title 
  rect(width *0.25, height*0.7, 200, 80); // box for "Easy" button
  rect(width *0.75, height*0.7, 200, 80); // box for "Hard" button
  textFont(titlePage);
  fill(255);
  text("SHAPE SHOOTER", width/2, height*0.25); // title 
  text("EASY", width *0.25, height*0.75); // button
  text("HARD", width *0.75, height*0.75); 
  
  if (mouseX<width/2 && mouseY>0.5*height){ // Highlight Button
    fill(0,255,0);
    text("EASY", width *0.25, height*0.75);
  }
  if (mouseX>width/2 && mouseY>0.5*height){
    fill(0,255,0);
    text("HARD", width *0.75, height*0.75);
  }
  if (mousePressed && mouseX<width/2 && mouseY>0.5*height){ // start game when pressed
    state = "easy";
    shapes.clear();
    score = 0; 
  } 
  if (mousePressed && mouseX>width/2 && mouseY>0.5*height){
    state = "hard";
    shapes.clear();
    score = 0; 
  }
  
}
