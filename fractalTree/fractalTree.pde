float angle = PI/7;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  stroke(255);

  translate(width/2, height);

  branch(200);
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  if (len > 4) {
    push();
    rotate(angle);
    branch(len*0.67);
    pop();
    push();
    rotate(-angle);
    branch(len*0.67);
    pop();
  }
  //line(0,0,0,-len*0.67);
}
