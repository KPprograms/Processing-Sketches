// Bullet Class

class Bullet {
    float x, y;
    color col = color(random(100,255),random(10,255),random(0,255)); 
    int diam = 8; // diameter of bullet
    
    // Contructor:
    Bullet(float xPos, float yPos) {
        x = xPos;
        y = yPos;
    }

    void drawBullet() { // draw bullet
        fill(col);
        ellipseMode(CENTER);
        ellipse(x, y, diam, diam);
        y -= diam * 2;
    }
}
