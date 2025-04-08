class PieChartDepartures {
  ArrayList<Integer> valuesArray = new ArrayList<>();
  ArrayList<String> labelsArray = new ArrayList<>();
  ArrayList<Float> anglesArray = new ArrayList<>();
  boolean selected = false;

  PieChartDepartures() {
    textSize(16.5);
    table = loadTable("flights2k.csv", "header"); // Load CSV file
    println("CSV file loaded.");

    // Load data from CSV into HashMaps
    for (TableRow row : table.rows()) {
      String departureAirport = row.getString("ORIGIN");
      numberOfDepartures.put(departureAirport, numberOfDepartures.getOrDefault(departureAirport, 0) + 1);

      String departureState = row.getString("ORIGIN_STATE_ABR");
      numberOfDeparturesState.put(departureState, numberOfDeparturesState.getOrDefault(departureState, 0) + 1);
    }

    // Initialize with states data
    updateData(true);
  }

  // Method to update pie chart data when toggling between states and airports
  void updateData(boolean showStates) {
    valuesArray.clear();
    labelsArray.clear();
    anglesArray.clear();

    // Select dataset: states or airports
    Map<String, Integer> sourceMap = showStates ? numberOfDeparturesState : numberOfDepartures;

    for (Map.Entry<String, Integer> entry : sourceMap.entrySet()) {
      valuesArray.add(entry.getValue());
      labelsArray.add(entry.getKey());
    }

    int total = valuesArray.stream().mapToInt(Integer::intValue).sum(); // Get total count

    for (int value : valuesArray) {
      anglesArray.add((float) (value / (float) total) * 360.0);
    }
  }

  void draw() {
    background(245, 245, 250);
    pieChart(600, anglesArray, selected);

    // Display labels and values
    for (int i = 0; i < labelsArray.size(); i++) {
      textAlign(LEFT);
      fill(0);
      text(labelsArray.get(i) + ": " + valuesArray.get(i) + " ≈ " + nf(anglesArray.get(i), 0, 2) + "%", 25, 40 + (16.5 * i));
    }
  }

  void pieChart(float diameter, ArrayList<Float> data, boolean selected) {
    float lastAngle = 0;
    for (int i = 0; i < data.size(); i++) {
      float red = map(i, 0, data.size(), 0, 255);
      float green = map(i + (i * 2), 0, data.size(), 0, 255);
      float blue = map(i + (i * 4), 0, data.size(), 0, 255);
      fill(red, green, blue);
      arc(width / 2, height / 2, diameter, diameter, lastAngle, lastAngle + radians(data.get(i)));
      lastAngle += radians(data.get(i));
    }
  }
}
