PShape p; //petal shape
public void setup() {  
  size(600, 600, P3D);
  strokeWeight(1);
  fill(#FFD8F2);
  stroke(#C40C34);
  p = createShape();
  p.beginShape();
  p.vertex(0, 0, 0);
  p.bezierVertex(50, 10, -50, 50, 0, -100, 0, -30, -150);
  p.bezierVertex(-50, 0, -100, -50, 10, -50, 0, 0, 0);
  p.endShape();
}

float angle;

public void draw() {
  camera(width/2, (mouseY), mouseX, width/2, height/2, 0, 0, 1, 0);
  background(#587E39);
  translate(width/2, height/2, -300);
  rotateX(PI/2);
  rotateZ(radians(mouseX/2));
  fractal(-100, -100, 2);
  fractal(-100, -100, 10);
}

public void mousePressed() {
  angle += 10;
  System.out.println(angle);
}
public void fractal(int x, int y, float siz) {
  shapeMode(CENTER);
  scale(siz);
  for (int i = 0; i < 360; i += 5) {
    rotateY(radians(i));
    shape(p, x, y+100);
  }
  if (siz > 0.1) {
    fractal(x, y, siz*0.8);
  }
}

