int teller = 5;
int x_bos = 0;

void setup() {
  size(1000, 1000); 
}

void draw() {
 bos();
}

void bos() {
  for(int i = 0; i < teller; i++) {
    boom(x_bos, height - 300);
    x_bos += width/teller;
  }
}

void boom(int x, int y) {
  fill(199, 93, 28);
  rect(x - 50 , y, 100, 300);
  fill(21, 122, 17);
  ellipse(x, y - 100, 400, 250);
}
