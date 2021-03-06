int SIZE;
Scribbler s1, s2,s3;
int baset, tvar;
int SW;
int count;

void mousePressed(){
  s2.white();
}

class Scribbler {
  float x1, y1, x2,y2;
  int slope;
  int r;
  color c, prevc;
  int tr;
  color[] colours;
  int cindex;

  Scribbler(float x1, float y1, int r, int s) {
    this.x1 = 0;
    this.y1 = y1;
    this.slope = s;
    this.r = r;
    this.tr = baset + int(random(-tvar, tvar));
    this.colours = new color[] {color(0,100,75),color(0,75,100)};
    this.cindex = 0;
    this.c = 100;
    getNextColour();
  }
  
  void white(){
    c = color(255);
  }
  
  void getNextColour(){
    prevc = c;
    c = color(random(255)%c);
  }
  void move(){
    x2 = random(0, SIZE);

    y2 = y1 + random(-r,r);
    

      if(count++%50 == 0){
            getNextColour();
      }
      
    

    if(y2 >= SIZE || y2 <= 0){
      y2 = random(0, SIZE);
    }
  }
  
  void setTransparency() {
    tr = baset + int(random(-tvar, tvar));  
    stroke(c, tr);
  }
  
  void scribble() {
    setTransparency();
    move();
    drawSwoosh();
  }
  
  void drawSwoosh(){
    noFill();
    float n;
   
      
     n = random(2,9);  
      
    float x= x1+random(-r,r);
    float y=y1+random(-r,r);

   x1 = y1 = SIZE*0.5;
   beginShape();
 
  vertex(x1, y1);
  
  for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
  }    for(int i = 0; i < n; i++){

      bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r));
  }for(int i = 0; i < n; i++){

  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),random(SIZE), random(SIZE));
    }
    
  
    endShape();
beginShape();
  vertex(x1, y1);
  stroke(0,1);

int sm = 30;
for(int i = 0; i < n; i++){

  
    bezierVertex(getPoint(x1,r), getPoint(y1,r),getPoint(x1,r), getPoint(y1,r),x1+random(0-sm,sm), y1+random(0-sm,sm));
    }
    
endShape();

    y1 = y2;
  }
  
  int getPoint(float c, int r){
    int q = SIZE;
  return int(c) + int(random(0-q,q));
}

}


void setup() {
  SW = 45;
  SIZE = 600;
  strokeCap(SQUARE);
  size(SIZE, SIZE);
  background(255);
  count = 0;

  strokeWeight(SW);
  baset = 6;
  tvar = 4;
  s2 = new Scribbler(random(SIZE), random(SIZE), 15, 5);

}

void draw() {
    s2.scribble();
}
