PImage img, img2, img3, img4, img5;
int k;
color[] colours = {color(0, 255, 255), color(0, 153, 255), color(0, 255, 200)};
int WINDOWSIZE;

void setup() {
  WINDOWSIZE = 700;
  size(WINDOWSIZE,WINDOWSIZE); 

  strokeWeight(1);
  stroke(#FFFFFF, 10);
  noFill();
  
  mybackground();
}
void mybackground() {
  background(0);
  
 
}

void mousePressed(){
  mybackground();
}
color getNextColour(){
  k++;
  return colours[k%colours.length];
}
void draw() {
  
  sketchyCircle(getNextColour());
}
void sketchyCircle(color c){
  stroke(c,10);
  beginShape();
  int x1 = int(random(WINDOWSIZE));
  int y1 = int(random(WINDOWSIZE));

  vertex(x1,y1);
  
  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, x1, int(random(WINDOWSIZE)));


  endShape();
  
  beginShape();
  x1 = int(random(WINDOWSIZE));
  y1 = int(random(WINDOWSIZE));
  vertex(x1,y1);

  bezierVertex(int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), x1, int(random(WINDOWSIZE)), int(random(WINDOWSIZE)), y1);

  endShape();

}
