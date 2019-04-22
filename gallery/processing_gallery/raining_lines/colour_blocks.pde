int SIZE = 600;
boolean started;
int baset, tvar;
int SW, minSW, maxSW;
float j = 0;
float[] exes = {random(0, SIZE), random(0, SIZE), random(0, SIZE), random(0, SIZE)};
color[] colours = {color(255,0,0), color(0,255,0), color(0,0,0), color(0, 0, 255)};

void setup() {
  fill(0);
  SW = 10;
  SW = 2;
  minSW = 2;
  maxSW = 2;
  strokeCap(SQUARE);
  size(SIZE, SIZE);
  background(255);
  strokeWeight(SW);
  baset = 5;
  tvar = 0;
}

void lines() {
  stroke(0, 200);
  strokeWeight(60);
  for(int i = 0; i < exes.length; i++){
    float x = exes[i];
    stroke(colours[i], 100);
    line(x,0,x,((SIZE/600.0)*(j)));
  }
  j = (j + 1);
  if(j > 600) {
    resetExes();
    j = 0;
  }
}

void resetExes() {
  for(int i = 0; i < exes.length; i++){
    exes[i] = random(SIZE);
  }
}

void mousePressed() {
  started = true;
}

void draw() {
  if(started) {
    fill(255);
    stroke(255);
    rect(0, 0, SIZE,SIZE);
    lines();
    noFill();
  } else {
    background(255);
    fill(0);
    text("Click to start", SIZE*0.45, SIZE*0.5);
  }
}
