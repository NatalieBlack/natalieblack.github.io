int i;
String lines[];
boolean start;
int SIZE;

void setup() {
  SIZE = 495;
  size(SIZE, SIZE);
  imageMode(CENTER);
  noStroke();
  background(255);
  lines = loadStrings("/data/prideandprejudice.txt");
  i = 0;
  start = false;
}

void mousePressed(){
  if(start){
    start = false;
  }else {
    start = true;
  }
}

void draw() { 
  if(start){
      String entry = lines[i].toUpperCase(); 
      String words[] = splitTokens(entry);
      int ch;
      for(int j = 0; j < words.length; j++){

        for(int k = 0; k < words[j].length(); k++){
        ch = int(words[j].charAt(k));
        if(ch < 65 || ch > 90){
          ch = 64;
        }
      
      int col = int(random(2));

      int a = int(random(SIZE));
      int b = int(random(SIZE));
      int c = int(random(SIZE));
      int d = int(random(SIZE));
      if(col == 1){
        stroke(67, 230, 230);
      } else {
        stroke(255,255,255);
      }

      line(a,b,c,d);
        }
      }
       i++;
       i = i % lines.length;
     
   }     
   
}
