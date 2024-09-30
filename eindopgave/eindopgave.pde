int score = 0;

class Particle {
  float r = 50;
  float x = 250;
  float y = 0;
  float gravity = 0.5;
  float x_speed = 20;
  float y_speed = 0;
  float friction = 0.9;
  
  float[] colour = {random(255), random(255), random(255)};
  
  Particle(){
    this(250,0);
  }
  
  
  Particle(float x, float y){
    this.x = x;
    this.y = y;
   
  }
  
  void part() {
    fill(colour[0], colour[1], colour[2]);
    ellipse(x,y,r,r);
    y_speed += gravity;
    x += x_speed;
    y += y_speed;
    
     
    // verander de directie waar de Particle heen gaan als hij tegen de muren aan komt
    if (y > height - r/2) {
      y_speed *= -1;
      y_speed *= friction;
      x_speed *= friction;
    }
    
    if (x > width - r/2 || x < 0 + r/2) {
      x_speed *= -1;
      x_speed *= friction;
    }
    
    
    //hou Particle binnen doos
    while (y > height - r/2) {
      y = height - r/2;
    }
    
    while (x > width - r/2) {
      x = width - r/2;
    }
    while (x < 0 + r/2) {
      x = r/2;
    }
  }
}
Particle one = new Particle(50, 50);
Particle two = new Particle(100,100); 

void setup() {
  frameRate(60);
   size(500, 500);
}

void draw() {
  
  background(200, 200, 200);
  one.part();
  two.part();
  
  if (dist(one.x, one.y, two.x, two.y) < one.r) {
    float temp_x_speed_1 = one.x_speed;
    float temp_y_speed_1 = one.y_speed;
    one.x_speed = two.x_speed; 
    two.x_speed = temp_x_speed_1;
    one.y_speed = two.y_speed;
    two.y_speed = temp_y_speed_1;
  }
  
  fill(0, 0, 0);
  textSize(50);
  text("score: " + score, width/2 - 50, 50);
}

void mouseClicked() {
  if (dist(one.x, one.y, mouseX, mouseY) < one.r) {
    one.x = 50 + random(width - 100);
    one.y = 0 + one.r/2;
    one.x_speed = random(30);
    if (two.y_speed < 0) {
      score += two.y_speed * -1;
    } else {
     score += two.y_speed; 
    }
    one.y_speed = 0;
    one.colour[0] = random(255);
    one.colour[1] = random(255);
    one.colour[2] = random(255);
  }
  
  if (dist(two.x, two.y, mouseX, mouseY) < two.r) {
    two.x = 50 + random(width - 100);
    two.y = 0 + two.r/2;
    two.x_speed = random(30);
    if (two.y_speed < 0) {
      score += two.y_speed * -1;
    } else {
     score += two.y_speed; 
    }
    two.y_speed = 0;
    two.colour[0] = random(255);
    two.colour[1] = random(255);
    two.colour[2] = random(255);
  }
}
