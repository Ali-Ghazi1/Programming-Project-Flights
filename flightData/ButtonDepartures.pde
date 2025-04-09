import java.util.Map; // Import the Map interface for HashMap usage

// HashMaps to track flight data
HashMap<String, Integer> numberOfDepartures = new HashMap<>(); // Stores number of departures per airport
HashMap<String, Integer> numberOfArrivals = new HashMap<>(); // Stores number of arrivals per airport
HashMap<String, Integer> numberOfDeparturesState = new HashMap<>(); // Stores number of departures per state

boolean statesDisplayed = true; // Boolean to toggle between showing states or airports

// Pie chart object and button instances
PieChartDepartures p;
ButtonDepartures b;
ButtonDepartures b2;
ButtonDepartures b3;

// ButtonDepartures class for handling button interactions
class ButtonDepartures {
  int rectX; // X-coordinate of button
  int rectY; // Y-coordinate of button
  int rectSize = 240; // Default button size
  color rectColor = color(#00aaff); // Button color (blue)
  color rectHighlight = color(255); // Highlight color when hovered over
  boolean rectOver = false; // Tracks whether mouse is over the button

  //PFont fontButton = loadFont("ArialMT-20.vlw"); // Font for button text (commented out)

  String label; // Label for the button

  // Constructor initializes the button with a default label
  ButtonDepartures() {
    this.label = "Airports"; // Default label is "Airports"
  }

  // Draws the button on the screen
  void draw(int rectX, int rectY) {
    this.rectX = rectX;
    this.rectY = rectY;
    update(); // Update button state

    // Change button color when hovered
    if (rectOver) {
      fill(rectHighlight + 150); // Slightly lighter color when hovered
    } else {
      fill(rectColor); // Default color
    }

    stroke(#242e4a); // Set stroke color (dark blue)
    strokeWeight(3); // Set border thickness
    rect(rectX, rectY, rectSize, rectSize / 3, 10); // Draw button with rounded corners

    // Style text inside the button
    pushStyle();
    //textFont(fontButton); // Apply font (currently commented out)
    textSize(30);  // Adjust text size for readability
    fill(255); // Set text color to white
    textAlign(CENTER, CENTER); // Center text within button
    text(label, rectX + rectSize / 2, rectY + (rectSize / 6)); // Position text inside button
    popStyle();
  }

  // Updates button state based on mouse position
  void update() {
    rectOver = overRect(rectX, rectY, rectSize, rectSize / 3); // Check if mouse is over button
  }

  // Handles mouse press interactions
  void mousePressed() {
    if (rectOver) { // If mouse is over button when pressed
      statesDisplayed = !statesDisplayed; // Toggle between displaying states or airports
      pieChart.updateData(statesDisplayed); // Update pie chart accordinglys

      // Change button label based on toggle state
      label = statesDisplayed ? "Airports" : "States";
    }
  }

  // Helper function to determine if mouse is over the button
  boolean overRect(int rectX, int rectY, int rectSize, int rectSize2) {
    return mouseX >= rectX && mouseX <= rectX + rectSize &&
           mouseY >= rectY && mouseY <= rectY + rectSize2;
  }
}
