import java.util.Map;
HashMap<String, Integer> numberOfDepartures = new HashMap<>();
HashMap<String, Integer> numberOfArrivals = new HashMap<>();

final int SCREENX = 1280;
final int SCREENY = 720;

Table table;

void settings() {
  size(1280, 720);
}

void setup() {

  table = loadTable("flights2k.csv", "header"); // "header" indicates the first row contains column names
  println("CSV file loaded.");
  
  for (TableRow row : table.rows()){
    String departureAirport = row.getString("ORIGIN");
    numberOfDepartures.put(departureAirport, numberOfDepartures.getOrDefault(departureAirport, 0) + 1);
    
    String arrivalAirport = row.getString("DEST");
    numberOfArrivals.put(arrivalAirport, numberOfArrivals.getOrDefault(arrivalAirport, 0) + 1);
  }
  
  for (Map.Entry airport : numberOfDepartures.entrySet()) { // this code iterates throught the hashMap, in this case the departures one
    print(airport.getKey() + " is ");                       // to iterate through the arrivals one change numberOfDepartures to numberOfArrivals
    println(airport.getValue());
  }
  
  
}  

void draw() {
  background(255);
}
