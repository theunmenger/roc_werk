int padding_sides = 200;
int padding_sides_roof = 100;
int roof_height = 500;
int roof_point = 100;
int point_x = 0;
int r = 150;
int door_width = 200;
int speed_sides = 1;
int speed_sides_roof = 2;
int speed_roof_point = 2;



void setup() {
  size(1000, 1000);
  point_x = width / 2;
}

void draw() {
  background(140, 187, 245);
  //gras
  fill(0, 255, 0);
  strokeWeight(0);
  rect(0, 700, width, 300);
  
  //huis achtergrond
  fill(8, 73, 153);
  strokeWeight(5);
  rect(padding_sides, roof_height, width - (padding_sides * 2), height - (roof_height + 100));
  
  //dak
  fill(173, 145, 52);
  triangle(padding_sides_roof, roof_height, width - padding_sides_roof, roof_height, point_x, roof_point);
  
  //dakraam
  dakraam(r, point_x, (roof_height - roof_point) - r / 2);
  
  //deur
  deur(point_x - door_width / 2, height - (roof_height - 100), door_width, 300);
  
  
  
  // beweging
  padding_sides += speed_sides;
  padding_sides_roof += speed_sides_roof;
  roof_point += speed_roof_point;
  
  if (padding_sides >= 300 || padding_sides <= 200) {
    speed_sides *= -1;
  }
  
  if (padding_sides_roof >= 150 || padding_sides_roof <= 100) {
    speed_sides_roof *= -1;
  } 
  
  if (roof_point >= 150 || roof_point <= 100) {
    speed_roof_point *= -1;
  }
}

void dakraam(int r, int x, int y) {
  strokeWeight(2);
  fill(145, 77, 28);
  ellipse(x, y, r, r); 
  fill(99, 126, 194);
  ellipse(x, y, r - 10, r - 10);
  strokeWeight(7);
  line(x - r / 2, y, x + r / 2, y);
  line(x, y - r / 2, x, y + r / 2);
}


void deur(int doorX, int doorY, int door_width, int door_height) {
   strokeWeight(5);
   fill(145, 77, 28); 
   rect(doorX, doorY, door_width, door_height );
}
