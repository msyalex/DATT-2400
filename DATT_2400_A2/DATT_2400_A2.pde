int totalFrames = 200;
int counter = 0;
boolean record = false;
final int ring_num = 10;
final int ring_radius = 200;
int startX;
int startY;

float r;

/////////////////////////////
void setup() {
  size(600,600);
  startX = width/2;
  startY = height/2;  
}
/////////////////////////////


////////////////////////////
void draw() {
float percent = 0;
if (record) {
  percent = float(counter) / totalFrames;
} else {
  percent = float(counter % totalFrames) / totalFrames;
}
render(percent);
if (record) {
  saveFrame("output/gif-"+nf(counter, 3)+".png");
  if (counter == totalFrames) {
    exit();
  }
}
counter++;

shape1();
shape2();
shape3();
shape4();
shape5();
}
/////////////////////////////


/////////////////////////////
void render(float percent){
  background(0);
  fill(255);
  
  float angle = percent * TWO_PI;
  shapeMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight(2);
  rotate(angle);
  
  ellipseMode (RADIUS);
  stroke(255,255,255);
  noFill();
  rings(ring_radius); 
}
////////////////////////////////


///////////////////////////////
void rings(float radius) {
  for (int i=0; i<ring_num; i++) {
    circle(startX, startY, radius);
    radius = radius - 20;
  }
}



//CODE FOR GRADIENT ELLIPSES
void shape1() {
  pushMatrix();
  translate(-300,0);
  translate(width/2, height/2);
  rotate(radians(r));
  noStroke();
  fill(104,74,82);
  ellipse(0,0,10,100);
  popMatrix();
  r-=1;
}

void shape2() {
  
  pushMatrix();
  translate(-150,0);
  translate(width/2, height/2);
  rotate(radians(r));
  fill(133,120,133);
  ellipse(0,0,10,100);
  popMatrix();
  r-=1;
}

void shape3() {

  pushMatrix();
  translate(0,0);
  translate(width/2, height/2);
  rotate(radians(r));
  fill(134,140,156);
  ellipse(0,0,10,100);
  popMatrix();
  r-=1;
}

void shape4() {

  pushMatrix();
  translate(150,0);
  translate(width/2, height/2);
  rotate(radians(r));
  fill(135,160,178);
  ellipse(0,0,10,100);
  popMatrix();
  r-=0.5;
}

void shape5() {
  pushMatrix();
  translate(300,0);
  translate(width/2, height/2);
  rotate(radians(r));
  fill(146,169,185);
  ellipse(0,0,10,100);
  popMatrix();
  r-=0.5;
}
