import java.util.Map;
HashMap<String, Integer> numberOfDepartures = new HashMap<>();
HashMap<String, Integer> numberOfArrivals = new HashMap<>();
HashMap<String, Integer> numberOfDeparturesState = new HashMap<>();

boolean statesDisplayed = true; // Start with states displayed


PieChartDepartures p;
ButtonDepartures b;
ButtonDepartures b2;
ButtonDepartures b3;

class ButtonDepartures {
  int rectX;
  int rectY;
  int rectSize = 240;
  color rectColor = color(#00aaff);
  color rectHighlight = color(255);
  boolean rectOver = false;
  //PFont fontButton = loadFont("ArialMT-20.vlw");
  String label;  

  ButtonDepartures() {
    this.label = "Airports";
  }

  void draw(int rectX, int rectY) {
    this.rectX = rectX;
    this.rectY = rectY;
    update();

    // Draw button rectangle
    if (rectOver) {
      fill(rectHighlight + 150);
    } else {
      fill(rectColor);
    }

    stroke(#242e4a);
    strokeWeight(3);
    rect(rectX, rectY, rectSize, rectSize / 3, 10);

    // Set font and size specifically for the button
    pushStyle();
    //textFont(fontButton);
    textSize(30);  // Adjusted size so text fits inside button
    fill(255);
    textAlign(CENTER, CENTER);
    text(label, rectX + rectSize / 2, rectY + (rectSize / 6)); // Centered inside the button
    popStyle();
  }

  void update() {
    rectOver = overRect(rectX, rectY, rectSize, rectSize / 3);
  }

  void mousePressed() {
    if (rectOver) {
      statesDisplayed = !statesDisplayed;  
      pieChart.updateData(statesDisplayed);

      // Toggle button text
      label = statesDisplayed ? "Airports" : "States";
    }
  }

  boolean overRect(int rectX, int rectY, int rectSize, int rectSize2) {
    return mouseX >= rectX && mouseX <= rectX + rectSize &&
           mouseY >= rectY && mouseY <= rectY + rectSize2;
  }
}
