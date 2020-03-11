Perceptron brain;

Point[] points = new Point[100];

int epoch = 0;
float accuracy;

void setup() {
  size(800, 800);
  brain = new Perceptron();
  
  for(int i = 0; i < points.length; i++) {
    points[i] = new Point(); 
  }
}

void draw() {
  background(255);
  stroke(0);
  line(0, 0, width, height);
  
  for(Point pt : points) {
    pt.show(); 
    
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    
    int guess = brain.guess(inputs);
    if(guess == target) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0); 
    }
    
    noStroke();
    ellipse(pt.x, pt.y, 16, 16);
  }
 
}

void mousePressed() {
  for(Point pt : points) {
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    brain.train(inputs, target);
  }
  
  accuracy = 0;
  
  for(Point pt : points) {
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    
    int guess = brain.guess(inputs);
    if(guess == target) {
      fill(0, 255, 0);
      accuracy += 1;
    } else {
      fill(255, 0, 0); 
    }
    
    noStroke();
    ellipse(pt.x, pt.y, 16, 16);
  }
  
  println("Epoch " + epoch);
  accuracy = (accuracy / points.length) * 100;
  println(accuracy + "%");
  epoch++;
}
