//DATT 2400 A1 Shiue Yi Alexandra Ma

//IDEA1: shape 1 to shape 2 bouncing around the screen
//IDEA2: base something off a concept?
    // seasons | fall,sunlight,falling leaves | bubbles 




//start of varibles for circle1
float x1=random(width), y1=random(height);
float diam1 = 10;
int speed1 = 100;
// end of variables for circle

//start of variables for leaf
int leaves = 0;  
int leafMax = 30;
//end of variables for leaf

//start of variables for circle2
float x2=random(width), y2=random(height);
float diam2 = 20;
int speed2 = 20;
//end of variables for circle2

//start of variable for middle spiral
float r = 0;
//end of variable for middle spiral


void setup() {
  background(0);
  size (600,600);
  
  x2 = int(550);
  y2 = int(100);
}


void draw() {
//circles
  circle1();
  circle2();
 
//middle spiral  
  translate(width/2, height/2);
  rotate(r);
  fill(random(255), random(255), random(255), 45);
  float circle_size = random(5, 8);
  quad(100 + r, 10, circle_size, circle_size, 0, cos(r), 100, 10);
  r = r + 1000;
  frameRate(50);
  
//leaves  
  if (leaves < leafMax) { 
  
      float cx = 200 + random(-100,100);
      float cy = 200 + random(-100,100); 
  
      translate(cx,cy); 
      rotate(random(TWO_PI)); 
      scale(random(0.9,1.8)); 
      drawLeaf(); 
      leaves++; 
    }
}


void mousePressed() {
  noLoop();
  save("DATT_2400_A1.png");
}




void circle1() {
  noStroke();
  fill(random(255), random(255), random(255), 100);
  
  x1 = x1+int(random(speed1));
  y1 = y1+int(random(speed1));
  
  ellipse(x1, y1, diam1, diam1);
  diam1 += 10;
  diam1 %= 200;
 
  delay (100);
}


void drawLeaf(){
  float pointShift = random(-20,20);
  fill(random(255),random(255),random(255),175);
  beginShape(); 
  vertex(20, 45);
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); 
    bezierVertex(60 + pointShift,55, 30,65, 20,45);
  endShape();
  
}


void circle2() {
  noStroke();
  fill(random(255), random(255), random(255), 25); 
  
  x2 = x2+int( random(-speed2, -speed2) );
  y2 = y2+int( random(speed2, speed2) );
  
  ellipse(x2, y2, diam2, diam2);
  diam2 += 10;
  diam2 %= 100;
 
  delay (100);
}
