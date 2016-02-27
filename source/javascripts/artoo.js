var colours;
var i;
var j;
var height;

function setup() {
  colours = [color('#66CCFF'), color('#5D6B70'), color('#59a699'), color('#DEFF69'), color('#B1C2C9'), color('#FFF')];
  var w = windowWidth;
  height = windowHeight;
  var c = createCanvas(height, height);
  c.position((w-height)*0.5, 0);
  frameRate(15);
  i = 0;
  j = 0;
  strokeWeight(1);
  stroke('#FFF');  
  mybackground();

  fill(color(255, 255, 255, 10));
  
}

function getNextColour(){
  i++;
  return colours[i%colours.length];
}

function mybackground() {
  background(255);
}

function mousePressed(){
    mybackground();
}

function draw() {
    if(coinToss()){
      mybackground();
      
    } else {
      sketchyCircle();
    }
}

function coinToss(){
  return int(random(30)) == 1; 
}

function sketchyCircle(){
  beginShape();
  var x1 = parseInt(random(height));
  var y1 = parseInt(random(height));
  var colour = getNextColour();
  fill(red(colour), green(colour), blue(colour), random(10,100));
  stroke(colour);
  

  vertex(x1,y1);

  bezierVertex(int(random(height)), int(random(height)), int(random(height)), x1, x1, int(random(height)));

  bezierVertex(int(random(height)), int(random(height)), int(random(height)), y1, y1, int(random(height)));

  endShape();

}

