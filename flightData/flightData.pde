import java.util.Map;
HashMap<String, Integer> numberOfDepartures = new HashMap<>();
HashMap<String, Integer> numberOfArrivals = new HashMap<>();
HashMap<String, Integer> numberOfDeparturesState = new HashMap<>();

boolean statesDisplayed = true; // Start with states displayed

final int SCREENX = 1280;
final int SCREENY = 720;

PieChartDepartures p;
ButtonDepartures b;
ButtonDepartures b2;
ButtonDepartures b3;

Table table;

void settings() {
  size(1280, 720);
}

void setup() {
  table = loadTable("flights2k.csv", "header");
  println("CSV file loaded.");

  p = new PieChartDepartures(); 
  b2 = new ButtonDepartures(); // Starts with "Airports"
}


void draw() {
  p.draw();
  b2.draw(1000, 120); // Button will update text dynamically
}


void mousePressed() {
  b2.mousePressed(); // Calls the button's mousePressed function
}
