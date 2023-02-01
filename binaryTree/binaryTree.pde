class Tree {
  public Node root = null;

  public void traverse(){
    this.root.visit(this.root);
  }

  public void addValue(int val) {
    var n = new Node(val);
    if (this.root == null) {
      this.root = n;
      this.root.x = width / 2;
      this.root.y = 100;
    } else {
      this.root.createNode(n);
    }
  }
}

class Node {
  int value;
  Node left;
  Node right;
  float distance;
  float x;
  float y;

  public Node(int val) {
    this.value = val;
    this.left = null;
    this.right = null;
    this.distance = 2.5;
    this.x = 0;
    this.y = 0;
  }
  
  public void visit(Node parent){
    if (this.left != null) {
      this.left.visit(this);
    }
    
    stroke(100);
    line(parent.x, parent.y, this.x, this.y);

    fill(25);
    ellipse(this.x, this.y, 24, 24);
    noStroke();
    
    fill(255);
    textAlign(CENTER);
    
    textSize(18);
    
    text(this.value, this.x, this.y + 4);
  
    if (this.right != null) {
      this.right.visit(this);
    }
  
  }

  public void createNode(Node n) {
    if (n.value < this.value) {
      if (this.left == null) {
        this.left = n;
        this.left.x = this.x - (width / pow(2, n.distance));
        this.left.y = this.y + (height / 12);
      } else {
        n.distance++;
        this.left.createNode(n);
      }
    } else if (n.value > this.value) {
      if (this.right == null) {
        this.right = n;
        this.right.x = this.x + (width / pow(2, n.distance));
        this.right.y = this.y + (height / 12);
      } else {
        n.distance++;
        this.right.createNode(n);
      }
    }
  }
}

Tree tree;
IntList values;

void setup() {
  size(1280, 720);
  background(0);
  
  tree = new Tree();

  values = new IntList();

  for(int i=0;i<50;i++){
    values.append(i+1);
  }
  
  values.shuffle();
}

int i = 0;
void draw(){

  if(i<49){
    tree.addValue(values.get(i));
    i++;
  }

  tree.traverse();
}
