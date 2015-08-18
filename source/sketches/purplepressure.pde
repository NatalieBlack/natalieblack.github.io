int i, min, max;
String[] values;

void setup() {
  size(640, 360);
  imageMode(CENTER);
  noStroke();
  background(255);
  values = loadStrings("/data/readings.txt");
  i = 0;
  min = 960;
  max = 1050;
}

void draw() { 
    float reading = float(values[i]);
    if(reading < min){
      reading = min;
    }else if(reading > max){
      reading = max;
    }
    float col = map(reading, min, max, 0, 255);
    color pix = color(0, col, 150);
    fill(pix, 255);
    int a = int(random(640));
    int b = int(random(360));
    ellipse(a, b, 20, 20);
    i++;   
}
