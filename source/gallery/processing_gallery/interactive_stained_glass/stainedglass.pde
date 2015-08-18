PImage img, img2, img3, img4, img5;
color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
color COLOUR;
int i,j;
int WINDOWSIZE;
boolean started;

color getNextColour(){
  i++;
  return colours[i%colours.length];
}

void setup() {
  frameRate(10);
  started = false;
  noStroke();
  WINDOWSIZE = 800;
  size(WINDOWSIZE, WINDOWSIZE); 
  i = 0;
  j = 0;
  strokeWeight(1);
 
  mybackground();
  textAlign(CENTER);
  text("Click and click again to freeze.",WINDOWSIZE/2,WINDOWSIZE/2);
  text("Your cursor controls where the shapes appear.",WINDOWSIZE/2,WINDOWSIZE/2 + 20);
  fill(255, 10);


}
void mybackground() {
  background(0);
 
}

void mousePressed(){
    if(!started) {
        mybackground();
    }
  started = !started;
}

void draw() {
  if(started){
    if(j % 50 == 1) {
       mybackground();

    }else{
       sketchyCircle();

    }
  }
  j++;
}
void sketchyCircle(){
  beginShape();
  int v = WINDOWSIZE/100;
  int minx = mouseX - v;
  int maxx = mouseX + v;
  int miny = mouseY - v;
  int maxy = mouseY + v;
  int x1 = int(minx,maxx);
  int y1 = int(miny,maxy);
  fill(getNextColour(), 10);

  vertex(float(mouseX*2),float(mouseY*2));

  bezierVertex(int(random(miny,maxy)), int(minx,maxx), miny, x1, x1, maxy);

  bezierVertex(maxx, minx, int(random(WINDOWSIZE)), y1, y1, int(random(WINDOWSIZE)));

  endShape();
  
  beginShape();
  vertex(float(mouseX*1.9),float(mouseY*1.9));

  
  bezierVertex(int(random(minx,maxx)), int(random(miny,maxy)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
