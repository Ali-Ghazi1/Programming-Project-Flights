import java.util.Map;
HashMap<String, Integer> numberOfDepartures = new HashMap<>();
HashMap<String, Integer> numberOfArrivals = new HashMap<>();
HashMap<String, Integer> numberOfDeparturesState = new HashMap<>();

final int SCREENX = 1280;
final int SCREENY = 720;

Table table;
int[] angles = { 30, 10, 45, 35, 60, 38, 75, 67 };

void settings() {
  size(1280, 720);
}

void setup() {

  table = loadTable("flights2k.csv", "header"); // "header" indicates the first row contains column names
  println("CSV file loaded.");
  
  for (TableRow row : table.rows()){
    //String departureAirport = row.getString("ORIGIN");
    //numberOfDepartures.put(departureAirport, numberOfDepartures.getOrDefault(departureAirport, 0) + 1);
    
    String departureState = row.getString("ORIGIN_STATE_ABR");
    numberOfDeparturesState.put(departureState, numberOfDeparturesState.getOrDefault(departureState, 0) + 1);
  }
  
  for (Map.Entry state : numberOfDeparturesState.entrySet()) { // this code iterates throught the hashMap, in this case the departures one
    print(state.getKey() + " is ");                       // to iterate through the arrivals one change numberOfDepartures to numberOfArrivals
    println(state.getValue());
  }
  
  
}  

void draw() {
  background(100);
  pieChart(300, angles);
}
void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    fill(gray);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
  }
}
