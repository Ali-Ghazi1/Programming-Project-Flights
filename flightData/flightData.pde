import controlP5.*; // Import ControlP5 library for UI components

int scrollOffset; // Variable to track scrolling position
PApplet parent = this; // Reference to the main Processing applet
PImage image; // Background image

boolean inHomePage = true; // Boolean to check if the user is in the home page
float x = 0; // Variable for background image movement

// Button objects for different pages
Button barChartButton;
Button scatterPlotButton;
Button pieChartButton;
Button homeButton;
Button queryButton;
Button delayedButton;

final int SCREENX = 1280; // Screen width
final int SCREENY = 720; // Screen height
PFont font; // Font object
Table table; // Table containing flight data
Table fullTable; // Table containing full flight data

// Chart and data-related objects
BarChart barChart;
ScatterPlot scatterPlot;
PieChartDepartures pieChart;
Query query;
DelayedFlights delayed;

String currentPage = "home"; // Variable to track the current page

void setup() {
  size(1280, 720); // Set canvas size
  
  // Load flight data
  table = loadTable("flights2k.csv", "header");
  fullTable = loadTable("flights_full.csv", "header");
  
  scatterPlot = new ScatterPlot(); // Initialize scatter plot object
  
  // Initialize buttons with labels, positions, and sizes
  barChartButton = new Button("Flights Per Day", 550, 150, 200, 80);
  scatterPlotButton = new Button("Scatter Plot", 550, 250, 200, 80);
  pieChartButton = new Button("Flights by State", 550, 350, 200, 80);
  homeButton = new Button("Home", 1150, 50, 100, 50);
  queryButton = new Button("Query Page", 550, 450, 200, 80);
  delayedButton = new Button("Most Delayed Flights", 550, 550, 200, 80);
  
  pieChart = new PieChartDepartures(); // Initialize pie chart object
  image = loadImage("background-image.jpg"); // Load background image
}

void draw() {
  background(175, 200, 200); // Set background color
  stroke(1);
  
  // Display moving background image
  image(image, x, height/2 - image.height/2);
  image(image, x - image.width, height/2 - image.height/2);
  
  x += 2; // Move background image horizontally
  
  if (x >= image.width) {
    x = 0; // Reset background position when it loops
  }
  
  // Display pages based on the `currentPage` variable
  if (currentPage == "home") {
    drawHomepage();
  } else if (currentPage == "bar chart") {
    drawFlightsPage();
  } else if (currentPage == "scatter plot") {
    drawAirportsPage();
  } else if (currentPage == "pie chart") {
    drawPieChart();
  } else if (currentPage == "query") {
    drawQueryPage();
  } else if (currentPage == "delayed") {
    drawDelayedPage();
  }
}

void drawHomepage() {
  // Draw homepage title
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Welcome to Flight Explorer", width / 2, 50);
  
  // Display navigation buttons
  barChartButton.display();
  scatterPlotButton.display();
  pieChartButton.display();
  queryButton.display();
  delayedButton.display();
}

// Functions to draw different pages
void drawFlightsPage() {
  barChart.draw();
}

void drawAirportsPage() {
  scatterPlot.draw();
}

void drawPieChart() {
  pieChart.draw();
}

void drawQueryPage() {
  query.draw();
}

void drawDelayedPage() {
  delayed.draw();
}

void mousePressed() {
  if (inHomePage) {
    // Handle button clicks to navigate between pages
    if (barChartButton.isMouseOver()) {
      currentPage = "bar chart";
      barChart = new BarChart();
      inHomePage = false;
    }

    if (scatterPlotButton.isMouseOver()) {
      currentPage = "scatter plot";
      inHomePage = false;
    }

    if (pieChartButton.isMouseOver()) {
      inHomePage = false;
      currentPage = "pie chart";
    }
    
    if (queryButton.isMouseOver()) {
      query = new Query();
      inHomePage = false;
      currentPage = "query";
    }
    
    if (delayedButton.isMouseOver()) {
      delayed = new DelayedFlights();
      inHomePage = false;
      currentPage = "delayed";
    }
  }
  
  if (homeButton.isMouseOver()) {
    inHomePage = true;
    
    if (currentPage.equals("query"))
      query.ui.cp5.hide(); // Hide UI elements related to query page
    
    currentPage = "home";
  }
  
  if (currentPage.equals("query"))
    query.mousePressed();
  
  if (currentPage.equals("pie chart"))
    b2.mousePressed();
}

void mouseWheel(MouseEvent event) {
  // Handle mouse scroll event for UI interaction
  float scrollAmount = event.getCount();
  scrollOffset -= scrollAmount * 20;
  scrollOffset = -abs(scrollOffset);
}

// Button class for UI elements
class Button {
  String label;
  float x, y, w, h;
  
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    stroke(#242e4a);
    strokeWeight(3);
    fill(#00aaff); // Button color
    rect(x, y, w, h, 10); // Draw button with rounded corners
    strokeWeight(1);
    textSize(22);
    textAlign(CENTER, CENTER);
    fill(255);
    text(label, x + w / 2, y + h / 2); // Place text in center of button
  }
  
  boolean isMouseOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h; // Check if the mouse is hovering over the button
  }
}
