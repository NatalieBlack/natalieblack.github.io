var k, x,y;
var blue, green, red;
var blueboost = 0
var greenboost = 0;
var redboost = 0;
var maxsat;
var width;
var height;

function setup() {
  width = Math.round(windowWidth / 50) * 50;
  height = Math.round(windowHeight / 50) * 50;
  var c = createCanvas(width, height-50);
  c.position(0, 50);

  red = random(50,200);
  blue = random(50,200);
  green = random(50,200);
  background(255);
  k = 0;
  x = 0;
  y = 0;

  noStroke();
  maxsat = 200;
 
}

function draw() {
  fill(getColour());
  fadedcircle(x%width,y%height, 100);
  x+=50;
  if(x%width == 0){
    y+=100;
  }
}

function fadedcircle( x, y, s){
    rect(x,y,s, s);
}
function getColour() {
  red = min(maxsat, (random(red - 30, min([red + 30, maxsat])) + redboost));
  blue = min(maxsat, (random(blue - 30, min(blue + 30, maxsat)) + blueboost));
  green = min(maxsat, (random(green - 30, min(green + 30, maxsat)) + greenboost));
  return color(red, green, blue, 10);
}

function keyPressed() {
  if(key == 'b'){
    blueboost += 50;
  } else if(key == 'g') {
    greenboost += 50;
  } else if(key == 'r') {
    redboost += 50;
  } else if(key == ' ') {
    red = random(30,220);
    blue = random(30,220);
    green = random(30,220);  
    blueboost = greenboost = redboost = 0;
    } else if(key == '=') {
       red += 50;
       blue += 50;
       green += 50;
    } else if(key == '-') {
       red -= 50;
       blue -= 50;
       green -= 50;
    }
}
