int scl = 20;
int w = 900;
int h = 700;
int cols = w/scl;
int rows = h/scl;

float yoff = 0.02;
float xoff = 0.01;

float arr[][] = new float[rows][cols];

void setup() {
  size(800, 800, P3D);

  //for (int y=0; y < rows; y++) {
  //  for (int x=0; x < cols; x++) {
  //    arr[y][x] = map(noise(y*yoff,x*xoff),0,1,-10,10);
  //  }
  //}
}

void draw() {
  background(200);
  translate(0, 200);
  rotateX(PI/3);
  
  xoff += 0.0001;
  yoff += 0.0001;
  
  for (int y=0; y < rows; y++) {
    for (int x=0; x < cols; x++) {
      arr[y][x] = map(noise(y*yoff,x*xoff),0,1,-100,100);
    }
  }
  
  for (int y=0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x < cols; x++) {
      vertex(x*scl, y*scl, arr[y][x]);
      vertex(x*scl, (y+1)*scl, arr[y+1][x]);
    }
    endShape();
  }
}
