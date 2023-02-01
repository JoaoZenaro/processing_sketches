int scl, cols, rows, neighbors;
boolean[][] cells;

void setup() {
  fullScreen();

  scl = 20;
  cols = width/scl;
  rows = height/scl;

  cells = new boolean[rows][cols];

  for (int i=0; i<600; i++) {
    cells[floor(random(1, rows-1))][floor(random(1, cols-1))] = true;
  }

  background(12);
}

boolean survives(int x, int y, boolean alive) {
  neighbors = 0;
  if (cells[y-1][x-1] == true) {
    neighbors++;
  }
  if (cells[y-1][x] == true) {
    neighbors++;
  }
  if (cells[y-1][x+1] == true) {
    neighbors++;
  }
  if (cells[y][x-1] == true) {
    neighbors++;
  }
  if (cells[y][x+1] == true) {
    neighbors++;
  }
  if (cells[y+1][x-1] == true) {
    neighbors++;
  }
  if (cells[y+1][x] == true) {
    neighbors++;
  }
  if (cells[y+1][x+1] == true) {
    neighbors++;
  }
  
  if(alive && neighbors < 2){ return false; }
  
  if(alive && (neighbors == 2 || neighbors == 3)){return true;}
  
  if(alive && neighbors > 3){return false;}
  
  if(!alive && neighbors == 3){return true;}
  
  return false;
}

void draw() {
  frameRate(30);
  
  boolean[][] newCells = new boolean[rows][cols];

  for (int y=1; y<rows-1; y++) {
    for (int x=1; x<cols-1; x++) {
     newCells[y][x] = survives(x,y,cells[y][x]);
    }
  }

  for (int y=0; y<rows; y++) {
    for (int x=0; x<cols; x++) {
      if (cells[y][x] == true) {
        fill(0, 255, 0);
        rect(x*scl, y*scl, scl, scl);
      } else {
        fill(255);
        rect(x*scl, y*scl, scl, scl);
      }
    }
  }
  
  cells = newCells;
}
