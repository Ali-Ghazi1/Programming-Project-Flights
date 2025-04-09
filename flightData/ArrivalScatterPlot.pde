class ScatterPlot {
  int margin = 100;  // Margin space around the graph
  int xSpacing;  // Horizontal spacing between states
  float yScale;  // Scaling factor for arrival times
  
  // Lists and maps for storing flight data
  ArrayList<String> stateList = new ArrayList<String>(); // List of states
  HashMap<String, ArrayList<Float>> stateArrTimesMap = new HashMap<String, ArrayList<Float>>(); // Map state -> list of arrival times
  HashMap<String, ArrayList<String>> stateAirportsMap = new HashMap<String, ArrayList<String>>(); // Map state -> list of airports
  
  // Constructor: Initializes and processes flight data
  ScatterPlot() {
    // Iterate through each row in the flight data table
    for (TableRow row : table.rows()) {
      String airport = row.getString("DEST"); // Destination airport code
      String state = row.getString("DEST_STATE_ABR"); // Destination state abbreviation
      float arrTime = row.getFloat("ARR_TIME"); // Arrival time
      
      // Only process valid (non-NaN) arrival times
      if (!Float.isNaN(arrTime)) {
        // If state is not already recorded, add it to the list
        if (!stateList.contains(state)) {
          stateList.add(state);
        }
        
        // If state is not in the maps, initialize its data storage
        if (!stateArrTimesMap.containsKey(state)) {
          stateArrTimesMap.put(state, new ArrayList<Float>());
          stateAirportsMap.put(state, new ArrayList<String>());
        }
        
        // Store arrival times and corresponding airports
        stateArrTimesMap.get(state).add(arrTime);
        stateAirportsMap.get(state).add(airport);
      }
    }
    
    // Calculate spacing for plotting states on the X-axis
    xSpacing = (SCREENX - 2 * margin) / stateList.size();
    
    // Set the scaling factor for arrival times (max value assumed 2400)
    yScale = (SCREENY - 2 * margin) / 2400.0;
  }
  
  // Draws the scatter plot
  void draw() {
    background(175, 200, 200); // Set background color
    stroke(0); // Set stroke color for axes
    
    // Display home button
    homeButton.display();
    
    // Draw X and Y axes
    line(margin, SCREENY - margin, SCREENX - margin, SCREENY - margin); // X-axis
    line(margin, margin, margin, SCREENY - margin); // Y-axis
    
    // Label X-axis (States)
    textAlign(CENTER);
    textSize(12);
    fill(0);
    for (int i = 0; i < stateList.size(); i++) {
      String state = stateList.get(i);
      float x = margin + i * xSpacing;
      if (x < SCREENX - margin) { // Prevent labels from exceeding screen width
        text(state, x, SCREENY - margin + 30);
      }
    }
    
    // Label Y-axis (Arrival Times)
    textAlign(RIGHT);
    textSize(14);
    fill(0);
    for (int t = 0; t <= 2400; t += 200) {
      float y = SCREENY - margin - (t * yScale);
      text(t, margin - 15, y); // Label major arrival time intervals
    }
    
    // Plot arrival times as points
    fill(0, 0, 255, 150); // Set fill color with transparency
    for (int i = 0; i < stateList.size(); i++) {
      String state = stateList.get(i);
      ArrayList<Float> arrTimes = stateArrTimesMap.get(state);
      
      float x = margin + i * xSpacing; // X-position for the state
      
      // Plot each arrival time as a point
      for (int j = 0; j < arrTimes.size(); j++) {
        float arrTime = arrTimes.get(j);
        float y = SCREENY - margin - (arrTime * yScale);
        ellipse(x, y, 8, 8); // Draw the point
      }
    }
    
    // Display title and axis labels on the screen
    fill(0);
    textAlign(CENTER, TOP);
    textSize(32);
    text("Arrival Times At Each State", SCREENX / 2, 50); // Title
    
    textSize(28);
    text("Destinations", SCREENX / 2, SCREENY - 60); // X-axis label
    
    textSize(16);
    text("Arrival", 30, (SCREENY / 2) - 10);
    text("Times", 30, (SCREENY / 2) + 10); // Y-axis label
  }
}
