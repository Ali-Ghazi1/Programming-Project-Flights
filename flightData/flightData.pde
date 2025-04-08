final int SCREENX = 1280;
final int SCREENY = 720;
PFont font;

Table table;
DelayedFlights delayedFlights;

void settings() {
  size(1280, 720);
}

void setup() {
  table = loadTable("flights2k.csv", "header"); // "header" indicates the first row contains column names
  println("CSV file loaded.");

  delayedFlights = new DelayedFlights();
}  

void draw() {
  background(255, 178, 102);
  delayedFlights.draw();

}
