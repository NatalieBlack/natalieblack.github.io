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
    float col = map(random(100), 0, 100, 0, 255);
    float size = map(reading, min, max, 2, 50);
    color pix = color(0, col, 150);
    fill(pix, 255);
    int a = int(random(640));
    int b = int(random(360));
    ellipse(a, b, size, size);
    i++;   
}
