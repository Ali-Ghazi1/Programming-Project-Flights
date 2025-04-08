class ScatterPlot {
  int margin = 100; 
  int xSpacing; 
  float yScale;
  ArrayList<String> stateList = new ArrayList<String>();
  HashMap<String, ArrayList<Float>> stateArrTimesMap = new HashMap<String, ArrayList<Float>>(); // Map state -> list of arrival times
  HashMap<String, ArrayList<String>> stateAirportsMap = new HashMap<String, ArrayList<String>>(); // Map state -> list of airports
  
  ScatterPlot() {
    // Populate data grouped by state
    for (TableRow row : table.rows()) {
      String airport = row.getString("DEST");
      String state = row.getString("DEST_STATE_ABR"); 
      float arrTime = row.getFloat("ARR_TIME");
      
      if (!Float.isNaN(arrTime)) {
        if (!stateList.contains(state)) {
          stateList.add(state);
        }
        
        // Add the arrival times and airports to the states in the HashMaps
        if (!stateArrTimesMap.containsKey(state)) {
          stateArrTimesMap.put(state, new ArrayList<Float>());
          stateAirportsMap.put(state, new ArrayList<String>());
        }
        
        stateArrTimesMap.get(state).add(arrTime);
        stateAirportsMap.get(state).add(airport);
      }
    }
    
    // Calculate the x-spacing based on the number of states
    xSpacing = (SCREENX - 2 * margin) / stateList.size();
    yScale = (SCREENY - 2 * margin) / 2400.0;
  }
  
  void draw() {
    // Draw axis
    background(175, 200, 200);
    stroke(0);
    homeButton.display();
    line(margin, SCREENY - margin, SCREENX - margin, SCREENY - margin); // X-axis
    line(margin, margin, margin, SCREENY - margin); // Y-axis
    
    // Label X-axis (States) with better spacing
    textAlign(CENTER);
    textSize(12);
    fill(0);
    for (int i = 0; i < stateList.size(); i++) {
      String state = stateList.get(i);
      float x = margin + i * xSpacing;
      if (x < SCREENX - margin) { // make sure labels fit within screen width
        text(state, x, SCREENY - margin + 30);
      }
    }
    
    // Label Y-axis (Arrival Times)
    textAlign(RIGHT);
    textSize(14);
    fill(0);
    for (int t = 0; t <= 2400; t += 200) {
      float y = SCREENY - margin - (t * yScale);
      text(t, margin - 15, y);
    }
    
    // Plot points with more spacing
    fill(0, 0, 255, 150);
    for (int i = 0; i < stateList.size(); i++) {
      String state = stateList.get(i);
      ArrayList<Float> arrTimes = stateArrTimesMap.get(state);
      
      
      float x = margin + i * xSpacing; // x-position for the state
      
      // Plot each airport within the state's x-position
      for (int j = 0; j < arrTimes.size(); j++) {
        float arrTime = arrTimes.get(j);
        float y = SCREENY - margin - (arrTime * yScale);
        ellipse(x, y, 8, 8); 
      }
    }
    
//Text on screen
  fill(0);
  textAlign(CENTER, TOP);
  textSize(32);
  text("Arrival Times At Each State", SCREENX / 2, 50);
  textSize(28);
  text("Destinations", SCREENX / 2, SCREENY - 60);
  textSize(16);
  text("Arrival", 30, (SCREENY / 2) - 10);
  text("Times", 30, (SCREENY / 2) + 10);
  
  }
}
