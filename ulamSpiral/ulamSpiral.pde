int x, y, val;
int max, rows, cols;

ArrayList<Point> arr = new ArrayList<Point>();

void setup(){
  
  x = width/2;
  y = height/2;

  val = 1;
  
  max = (rows * cols);
  
  background(0);
  size(400,400);
}

void draw(){
  arr.add(new Point(x,y,val));
  
  for (Point p : arr){
    p.display();
  }
  
  x += 10;
  val++;
}

class Point {
  int x;
  int y;
  int val;
  
  public Point(int x, int y, int val){
    this.x = x;
    this.y = y;
    this.val = val;
  }
  
  public void display(){
    text(this.val, this.x, this.y);
  }
}
