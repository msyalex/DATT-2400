PImage end;

int ballCount = 10;

float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] xSpeed = new float[ballCount];
float[] ySpeed = new float[ballCount];
float[] size = new float[ballCount];

float circleRadius;

int axpos;
int aypos;

void setup() {
  size(1000, 500);
  end = loadImage("end.png");
  circleRadius = 100;
  
  for(int i = 0; i < ballCount; i++){
    x[i] = random(width);
    y[i] = random(height);
    xSpeed[i] = random(-10, 10);
    ySpeed[i] = random(-10, 10);
    size[i] = random(10, 20);
  }
}

void draw() {
  background (64);
  
  //start line
  rect(0,0,50,800);
  
  //finish line
  rect(width-100,0,100,800);
  image(end, width-80, 250);
  noStroke();
  
  avatar();
  bouncing();

}


void avatar() {
if (keyPressed == true) {
    if (key =='d') {
      axpos += 5;
    }
    if (key =='a') {
      axpos -= 5;
    }
    if (key =='w') {
      aypos -= 5;
    }
    if (key =='s') {
      aypos += 5;
    }
  }
  stroke(2);
  square (axpos, aypos, 20);
  if (axpos > width-100) {
    fill(100,211,97);
  }
    else {
    fill(255,255,255);
  }
}

void bouncing() {
  for(int i = 0; i < ballCount; i++){

    x[i] += xSpeed[i];
    if(x[i] < 50 || x[i] > width-100){
      xSpeed[i] *= -1;
    }

    y[i] += ySpeed[i];
    if(y[i] < 0 || y[i] > height){
      ySpeed[i] *= -1;
    }
    
    if(dist(axpos, aypos, x[i], y[i]) < size[i]) {
      axpos = 5;
      aypos = 5;
    }
    
    ellipse(x[i], y[i], size[i], size[i]);
  }
}
