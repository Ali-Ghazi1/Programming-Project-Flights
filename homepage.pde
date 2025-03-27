
ArrayList<Flight> flights = new ArrayList<Flight>();
String currentQuery = "default";
ArrayList<Flight> queryResults = new ArrayList<>();
boolean showHome = true; 

PImage earthTexture;  // texture for earth
float rotationAngle = 0; //  move 

void setup() {
  size(1000, 800, P3D);
  background(245, 235, 220); 
  loadFlights("flights.csv");

  earthTexture = loadImage("earth.jpg"); 
}

void draw() {
  background(245, 235, 220);

  if (showHome) {
    drawHomepage();
  } else {
    displayResults();
  }

  drawGlobe(width / 2, height / 2 - 30, 180); 
}


void loadFlights(String filename) {
  String[] rows = loadStrings(filename);
  if (rows == null) {
    println("Error: Unable to load file " + filename);
    return;
  }
  for (int i = 1; i < rows.length; i++) {
    String[] columns = rows[i].split(",");
    if (columns.length >= 18) {
      flights.add(new Flight(columns));
    }
  }
}


void drawHomepage() {
  // Title
  fill(50);
  textSize(48);
  textAlign(CENTER);
  text("Flight Explorer", width / 2, 80);
  
  textSize(24);
  text("Explore flight data and visualize insights", width / 2, 130);
  
  textSize(20);
  fill(0);
  text("Total Flights: " + flights.size(), width / 2, 170); 

  
  drawButton("Search by Airport", 200, 600, 220, 70);
  drawButton("Search by Date", 600, 600, 220, 70);
  drawButton("View Charts", 400, 700, 220, 70);
}


void drawGlobe(float x, float y, float size) {
  pushMatrix();
  translate(x, y, -100);
  lights();
  rotateY(rotationAngle); // move
  rotationAngle += 0.01;  // roattaion amngle

  if (earthTexture != null) {
    PShape globe = createShape(SPHERE, size);
    globe.setTexture(earthTexture);
    shape(globe);
  } else {
    fill(100, 150, 255);
    stroke(255);
    sphere(size);
  }

  popMatrix();
}


void drawButton(String label, int x, int y, int w, int h) {
  // Button shadow
  fill(20, 100, 200, 150);
  noStroke();
  rect(x + 3, y + 5, w, h, 15);

// for the button effect
  for (int i = 0; i < h; i++) {
    float lerpVal = map(i, 0, h, 0, 1);
    fill(lerpColor(color(50, 150, 250), color(30, 100, 200), lerpVal));
    rect(x, y + i, w, 1, 15);
  }

  // text for button
  fill(255);
  textSize(24);
  textAlign(CENTER, CENTER);
  text(label, x + w / 2, y + h / 2);
}


void mousePressed() {
  if (mouseOverButton(200, 600, 220, 70)) {
    currentQuery = "airport";
    queryResults = queryByAirport("JFK");
    showHome = false; // Switch to results screen
  } else if (mouseOverButton(600, 600, 220, 70)) {
    currentQuery = "date";
    queryResults = queryByDateRange("1/1/2022", "1/5/2022");
    showHome = false; // Switch to results screen
  } else if (mouseOverButton(400, 700, 220, 70)) {
    println("Navigating to Charts...");
    showChartScreen();
  }
}


boolean mouseOverButton(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}


ArrayList<Flight> queryByAirport(String airport) {
  ArrayList<Flight> results = new ArrayList<>();
  for (Flight f : flights) {
    if (f.origin.equals(airport) || f.dest.equals(airport)) {
      results.add(f);
    }
  }
  return results;
}


ArrayList<Flight> queryByDateRange(String startDate, String endDate) {
  ArrayList<Flight> results = new ArrayList<>();
  for (Flight f : flights) {
    if (f.date.compareTo(startDate) >= 0 && f.date.compareTo(endDate) <= 0) {
      results.add(f);
    }
  }
  return results;
}


void displayResults() {
  background(255);
  fill(0);
  textSize(36);
  text("Query Results", 400, 50);
  textSize(18);
  int displayed = min(10, queryResults.size());
  for (int i = 0; i < displayed; i++) {
    queryResults.get(i).display(50, 100 + i * 30);
  }
}


void showChartScreen() {
  background(200);
  fill(0);
  textSize(36);
  text("Flight Charts", 400, 50);
}


class Flight {
  String date, airline, origin, dest;
  int flightNumber;
  float distance;

  Flight(String[] columns) {
    if (columns.length >= 18) {
      date = columns[0];
      airline = columns[1];
      flightNumber = int(columns[2]); 
      origin = columns[3];
      dest = columns[7];
      distance = float(columns[17]); 
    } else {
      println("Error: Insufficient data in flight record");
    }
  }

  void display(int x, int y) {
    fill(0);
    textSize(18);
    text(date + " | " + airline + flightNumber + " | " + origin + " → " + dest + " | " + distance + " mi", x, y);
  }
}
