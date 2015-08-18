int i;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9};
color COLOUR;
int WINDOWSIZE, BOXSIZE, MARGIN, COLSNUM;
int minx, miny, col, row;
ArrayList<EggRing> eggs;
int EGGSIZE;
int BGCOLOUR;
float TILT;
boolean started;

void setup() {
  started = false;
  WINDOWSIZE = 495;
  EGGSIZE = 80;
  COLSNUM = 3;
  BGCOLOUR = 35;
  TILT = 0.01;
  size(WINDOWSIZE, WINDOWSIZE);
  BOXSIZE = int(float(WINDOWSIZE) / COLSNUM);
  MARGIN = (WINDOWSIZE-(BOXSIZE*COLSNUM))/(COLSNUM+1);
  imageMode(CENTER);
  background(BGCOLOUR);
  text("Click to add lines!",WINDOWSIZE*2/5,WINDOWSIZE/2);
  i = 0;
  col = 0;
  row = 0;
  minx = MARGIN;
  miny = MARGIN+30;
  COLOUR = colours[i];
  strokeWeight(0.5);
  eggs = new ArrayList<EggRing>();
  eggs.add(new EggRing(minx, miny, TILT, EGGSIZE, COLOUR));
}

void mousePressed() {
    if(started){
        minx = (minx + BOXSIZE + MARGIN) % (WINDOWSIZE-MARGIN);
        col = (col + 1);
        row = col/COLSNUM;
        miny = ((BOXSIZE + MARGIN)*(row)) + 30;
        COLOUR = getNextColour();
        int a = minx;
        int b = miny + 1;
       
        stroke(COLOUR);
        drawLine(a,b);
    } else {
      background(BGCOLOUR);
      started = true;
    }
}     

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void draw() { 
    if(started){
      background(BGCOLOUR);

      for(int e = 0; e < eggs.size(); e++){
        eggs.get(e).transmit();
      }
    }
}

void drawLine(int x1, int y1){
  float t = TILT;
  eggs.add(new EggRing(x1, y1, t, EGGSIZE, COLOUR));
}

class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  float wobblesize;
  color linecol;

  // Constructor
  Egg(float xpos, float ypos, float t, float s, color c) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
    wobblesize = 0.09;
    linecol = c;
  }

  void wobble() {
    tilt = cos(angle)/5;
    angle += wobblesize;
  }

  void display() {
    fill(linecol);
    pushMatrix();
    rotate(tilt);
    stroke(linecol);
    strokeWeight(10);
    line(mouseX, mouseY, x+100,y+100);
    popMatrix();
  }
}

class EggRing {
  Egg ovoid;

  EggRing(float x, float y, float t, float sp, color c) {
    ovoid = new Egg(x, y, t, sp, c);
  }

  void transmit() {
    ovoid.wobble();
    ovoid.display();
  }
}
