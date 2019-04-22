var k, x,y;
var primary = [#94E750, #C9F6A3, #ACEF74, #7DDB2F, #5CBA0E];
var secondary = [#41BA86,  #98E6C4, #65D0A2, #24A870, #0B8F57];
var tertiary = [#FF8858, #FFC1A8, #FFA17C, #F66C35, #D14710];
var fourth = [#E8507E, #F7A3BC, #EF749A, #DC2F64, #BB0F43];
var WINDOWWIDTH, WINDOWHEIGHT;
var blue, green, red, blueboost, greenboost, redboost;
var maxsat;

function setup() {
  createCanvas(screen.width, screen.height);
}

function draw() {
  if (mouseIsPressed) {
    fill(0);
  } else {
    fill(255);
  }
}

