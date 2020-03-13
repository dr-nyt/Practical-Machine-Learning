float f(float x) {
  return 0.3 * x + 0.2; 
}

class Point {
  float x;
  float y;
  float bias = 1;
  int label;
  
  Point() {
    x = random(-1, 1);
    y = random(-1, 1);
    
    float lineY = f(x);
    
    if(y > lineY) {
      label = 1; 
    } else {
      label = -1; 
    }
  }
  
  Point(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void show() {
    stroke(0);
    if(label == 1) {
      fill(255); 
    } else {
      fill(0); 
    }
    
    float px = getPixelX();
    float py = getPixelY();
    
    ellipse(px, py, 16, 16);
  }
  
  float getPixelX() {
    return map(x, -1, 1, 0, width);
  }
  
  float getPixelY() {
    return map(y, -1, 1, height, 0);
  }
}
