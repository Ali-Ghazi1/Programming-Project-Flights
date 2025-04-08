import controlP5.*;

int scrollOffset;
PApplet parent = this;

boolean inHomePage = true;

Button barChartButton;
Button scatterPlotButton;
Button pieChartButton;
Button homeButton;
Button queryButton;
Button delayedButton;

final int SCREENX = 1280;
final int SCREENY = 720;
PFont font;
Table table;
BarChart barChart;
ScatterPlot scatterPlot;
PieChartDepartures pieChart;
Query query;
DelayedFlights delayed;

String currentPage = "home";

void setup() {
  size(1280, 720); 
  table = loadTable("flights2k.csv", "header");
  barChart = new BarChart();
  scatterPlot = new ScatterPlot();
  // initialising buttons
  barChartButton = new Button("Bar Chart", 550, 150, 200, 80);
  scatterPlotButton = new Button("Scatter Plot", 550, 250, 200, 80);
  pieChartButton = new Button("Pie Chart", 550, 350, 200, 80);
  homeButton = new Button("Home Page", 1150, 50, 100, 50);
  queryButton = new Button("Query Page", 550, 450, 200, 80);
  delayedButton = new Button("Most Delayed Flights", 550, 550, 200, 80);
  pieChart = new PieChartDepartures();
  
}

void draw() {
  background(255); 
  
  if (currentPage == "home") {
    drawHomepage();
  } else if (currentPage == "bar chart") {
    drawFlightsPage();
  } else if (currentPage == "scatter plot") {
    drawAirportsPage();
  } else if (currentPage == "pie chart") {
    drawAboutPage();
  } else if (currentPage == "query") {
    drawQueryPage();
  } else if (currentPage == "delayed") {
    drawDelayedPage();
     
   }
}

void drawHomepage() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Welcome to Flight Explorer", width / 2, 50);
  
  barChartButton.display();
  scatterPlotButton.display();
  pieChartButton.display();
  queryButton.display();
  delayedButton.display();
}

void drawFlightsPage() {
  barChart.draw();
}

void drawAirportsPage() {
  scatterPlot.draw();
}

void drawAboutPage() {
  pieChart.draw();
}

void drawQueryPage()  {
  query.draw();
}

void drawDelayedPage()  {
  delayed.draw();
}


void mousePressed() {
   //b2.mousePressed();
  if (inHomePage) {
    if (barChartButton.isMouseOver()) {
      currentPage = "bar chart";
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
      currentPage = "home";
    }
}

void mouseWheel(MouseEvent event) {
  float scrollAmount = event.getCount();
  scrollOffset -= scrollAmount * 20;
  scrollOffset = - abs(scrollOffset);
}

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
    fill(0, 122, 204); // Button color
    rect(x, y, w, h, 10); // Draw the button with rounded corners
    fill(255); // White text color
    textSize(18);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2); // Place the text on the button
  }
  
  boolean isMouseOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
