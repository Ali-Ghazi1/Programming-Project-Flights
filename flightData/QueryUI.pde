class QueryUI {
  ControlP5 cp5;
  ScrollableList airportDropdown;
  
  int selectedDate = 1;  
  String selectedAirport = "None";
  boolean showDepartures = true;
  
  PApplet parent;
  Query query;
  
  HashSet<String> airports;
  ArrayList<String> airportList;

  QueryUI(PApplet parent, Query query) {
    this.parent = parent;
    this.query = query;
    airports = new HashSet<>();
    airportList = new ArrayList<>();
    
    for (TableRow row : table.rows()){
      String airport = row.getString("ORIGIN");
      airports.add(airport);
    }
    
    for (String airport : airports)
      airportList.add(airport);
      
    airportList.sort(null);
    
    cp5 = new ControlP5(parent);

    // Load airports from CSV

    // Date Slider (1-30)
    //cp5.addSlider("dateSlider")
    //   .setPosition(width / 2 - 100, 250)
    //   .setSize(300, 40)
    //   .setRange(1, 31)
    //   .setNumberOfTickMarks(31)
    //   .setValue(1)
    //   .plugTo(this, "updateDate");

  // Date Input (Textfield)
    cp5.addTextfield("Enter Date")
       .setPosition(width / 2 - 100, 250)
       .setSize(300, 40)
       .setFont(createFont("Arial", 20))
       .setAutoClear(false)
       .setCaptionLabel("")
       .plugTo(this, "setDateInput");

    
       
    // Dropdown Menu for Airports
    airportDropdown = cp5.addScrollableList("Select Airport")
                         .setPosition(width / 2 - 100, 325)
                         .setSize(300, 150)
                         .setBarHeight(40)
                         .setItemHeight(25)
                         .addItems(airportList)
                         .setOpen(false)
                         .plugTo(this, "updateAirport");

   cp5.addToggle("toggleDepartures")
   .setPosition(width / 2 - 100, 400) // Left side
   .setSize(120, 40)
   .setValue(showDepartures)  // Default state is "ON"
   .setLabel("")
   .plugTo(this, "toggle");
   
   airportDropdown.bringToFront();
  }
  
  void selectedAirport(int n) {
    selectedAirport = airportList.get(n);
  }


  void updateDate(float value) {
    selectedDate = (int) value;
  }

  void updateAirport(int index) {
    if (index >= 0 && index < airportList.size()) 
      selectedAirport = airportList.get(index);
  }
  
  void toggle() {
    showDepartures = !showDepartures;
  }

   void setDateInput(String value) {
    try {
      int parsed = Integer.parseInt(value);
      if (parsed >= 1 && parsed <= 31) {
        selectedDate = parsed;
      }
    } catch (NumberFormatException e) {
      println("Invalid date input: " + value);
    }
    println(selectedDate);
  }


}
