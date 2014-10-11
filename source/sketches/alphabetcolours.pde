int i;
String lines[];

void setup() {
  size(640, 360);
  imageMode(CENTER);
  noStroke();
  background(255);
  lines = loadStrings("/data/pg1342.txt");

  i = 0;

}


void draw() { 

      String entry = lines[i].toUpperCase(); 
      String words[] = splitTokens(entry);
      int c;
      for(int j = 0; j < words.length; j++){

        for(int k = 0; k < words[j].length(); k++){
        c = words[j].charCodeAt(k);

        if(c < 65 || c > 90){
          c = 64;
        }
      float col = map(c, 64, 90, 0, 255);
      color pix = color(0, col, 150);
      fill(pix, 255);
      int a = int(random(640));
      int b = int(random(360));
      ellipse(a, b, 20, 20);
        }
      }
    

       i = i + 1;
       i = i % lines.length;
         
    
}
