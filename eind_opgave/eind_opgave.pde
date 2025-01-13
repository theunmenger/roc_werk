int num = 100;


Particle[] particle = new Particle[num];
Ball[] ball = new Ball[1];

class Ball {
  int r = 100;
  int x = width/2;
  int y = height/2;
  
  
  void part() {
     ellipse(x, y, r, r); 
  }
}


class Particle {
  int r = 20;
  float x = 250;
  float y = 0;
  float gravity = 0.6;
  float x_speed = 20;
  float y_speed = 0;
  float friction = 0.98;
  float red = random(255);
  float green = random(255);
  float blue = random(255);  
  
  Particle(float x, float y, float x_speed, float y_speed){
    this.x = x;
    this.y = y;
    this.x_speed = x_speed;
    this.y_speed = y_speed;
  }
  
  void part() {
    fill(red, green, blue);
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
    if (y > height - r/2) {
      y = height - r/2;
    }
    
    if (x > width - r/2) {
      x = width - r/2;
    }
    if (x < 0 + r/2) {
      x = r/2;
    }
  }
}
void setup() {
  size(500, 500);
  frameRate(60);
  //setup nieuwe particles
  for (int i = 0; i < particle.length; i++) {
    particle[i] = new Particle(50 + random(width - 100), random(height), random(30), random(10));
  }
  ball[0] = new Ball();
}


void draw(){
  background(0, 0, 0);
  
  //check collisions
  for (int counter = 0; counter < particle.length; counter++)
  {
    for (int i = counter; i < particle.length; i++) {
      if (counter != i && dist(particle[counter].x, particle[counter].y, particle[i].x, particle[i].y) < particle[0].r) {
        float x_speed = particle[counter].x_speed;
        float y_speed = particle[counter].y_speed;
        particle[counter].x_speed = particle[i].x_speed;
        particle[i].x_speed = x_speed;
        particle[counter].y_speed = particle[i].y_speed;
        particle[i].y_speed = y_speed;
      }
    }
  }
  for (int i = 0; i < particle.length; i++) {
    if (dist(particle[i].x, particle[i].y, ball[0].x, ball[0].y) < ball[0].r - 10) {
      particle[i].x_speed *= -1;
      particle[i].y_speed *= -1;
    }
  }
  //beweging loopen
  for (int i = 0; i < particle.length; i++) {
    particle[i].part();
  }
  ball[0].part();
}
