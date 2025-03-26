final int SCREENX = 1280;
final int SCREENY = 720;
PFont font;
PApplet parent = this;

Query query;
Table table;

void settings() {
  size(1280, 720);
}

void setup() {
  

  

  font = createFont("Arial", 32);
  table = loadTable("flights2k.csv", "header"); // "header" indicates the first row contains column names
  println("CSV file loaded.");
  
  query = new Query();
}  

void draw() {
  background(255);
  query.draw(); 
}
