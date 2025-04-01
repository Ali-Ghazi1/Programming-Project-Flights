import controlP5.*;


final int SCREENX = 1280;
final int SCREENY = 720;
int scrollOffset;

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

void mousePressed() {
  query.mousePressed();
}

void mouseWheel(MouseEvent event) {
  float scrollAmount = event.getCount();
  scrollOffset -= scrollAmount * 20;
  scrollOffset = - abs(scrollOffset);
  
  println(scrollOffset);
}
