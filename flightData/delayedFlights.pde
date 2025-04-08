class DelayedFlights {
  ArrayList<Flight> flights = new ArrayList<>();
  ArrayList<Flight> sortedFlights = new ArrayList<>();
  
  DelayedFlights(){
    for (TableRow row : table.rows()) { 
        flights.add(new Flight(row));
    }
    
    sortedFlights = flights;
    sortedFlights.sort((a, b) -> b.getDelay() - a.getDelay());
  }
  
  void draw() {
    background(175, 200, 200);
    fill(255, 230, 205);
    rect(SCREENX / 2 - 400, SCREENY / 2 - 200, 800, 400);
    homeButton.display();
   
    fill(0);
    textSize(26);
    textAlign(CENTER, CENTER);
    text("Top 10 Most Delayed Flights", SCREENX / 2,  SCREENY / 2 - 230); 
    
    textSize(18);
    text("Flight Number", SCREENX / 2, SCREENY / 2 + 250);
    
    pushMatrix();
    translate(SCREENX / 2 -475, SCREENY / 2);
    rotate(-HALF_PI);
    text("Minutes Delayed", 0, 0);
    popMatrix();
    
    textSize(14);
    for (int minutesDelayed = 1200, y = 0; minutesDelayed >= 0; minutesDelayed -= 150, y += 50) {
      line(SCREENX / 2 - 410, SCREENY / 2 - 200 + y, SCREENX / 2 - 400, SCREENY / 2 - 200 + y);
      text(minutesDelayed, SCREENX / 2 - 425, SCREENY / 2 - 200 + y);
    }
    
    
    int currentFlight = 0;
    for (int i = 0; i < 800; i += 80) {
        int delay = sortedFlights.get(currentFlight).getDelay();
        println(delay);
        fill(#AFDCEB);
        rect(SCREENX / 2 + 15 - 400 + i, SCREENY / 2 + 200, 50, - ((float) delay / 1200 * 400));
        currentFlight++;
        
        fill(0);
        String code = String.format("%s%s", sortedFlights.get(currentFlight).airline, sortedFlights.get(currentFlight).flightNumber);
        text(code, SCREENX / 2 + 40 - 400 + i, SCREENY / 2 + 215);
    }
  }
}
