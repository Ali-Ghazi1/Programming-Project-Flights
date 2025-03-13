final int SCREENX = 1280;
final int SCREENY = 720;
PFont font;

Table table;
FlightDays flightDays; 

void settings() {
  size(1280, 720);
}

void setup() {
  font = createFont("Arial", 32);
  table = loadTable("flights2k.csv", "header"); // "header" indicates the first row contains column names
  println("CSV file loaded.");
  
  flightDays = new FlightDays();
  //for (TableRow row : table.rows()){
  //  String dest = row.getString("DEST_CITY_NAME");
  //  print(dest);
  //}
  
}  

void draw() {
  background(255);
  flightDays.draw();
  
}
