int i;
String[] table;
HashMap cast;
HashMap order;
String lines[];
color grey;

void setup() {
  size(640, 360);
  grey = color(139, 139, 139);
  imageMode(CENTER);
  noStroke();
  background(255);
  table = loadStrings("/images/data/cast.csv");
  cast = new HashMap<String, String>();
  order = new HashMap<String, Integer>();

  for(int y = 0; y < table.length; y++){
    String[] row = table[y].split(",");
 
    String c = row[0];
        
    for(int x = 1; x < row.length; x++){
      String name = (String) row[x];
      if(name != null && name != ""){
        cast.put(name.toLowerCase(), c);
        order.put(name.toLowerCase(), x - 1);
      }
    }

  }
  i = 0;
  
  lines = loadStrings("/images/data/names.txt");
}

void draw() { 
    
    try{    

      String entry = lines[i]; 
      String words[] = splitTokens(entry);
      for(int j = 0; j < words.length; j++){
        String name = words[j].toLowerCase();
       
        if(cast.containsKey(name)){

          String colour = (String) "FF" + cast.get(name);
          int pix = unhex(colour);
          Integer no = (Integer) order.get(name);
          pix = lerpColor(pix, grey, no / 12.0);
          fill(pix, 255);
          int a = int(random(640));
          int b = int(random(360));
          ellipse(a, b, 20, 20);
        }
      }
    
    }catch(Exception e){
      e.printStackTrace();
    }finally{
       i++;
       i = i % lines.length;    
    }
}
