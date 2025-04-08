import controlP5.*;

int scrollOffset;
PApplet parent = this;

boolean inHomePage = true;

Button barChartButton;
Button scatterPlotButton;
Button pieChartButton;
Button homeButton;
Button queryButton;
Button filteringButton;

final int SCREENX = 1280;
final int SCREENY = 720;
PFont font;
Table table;
BarChart barChart;
ScatterPlot scatterPlot;
Query query;
Filtering filtering;

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
  filteringButton = new Button("Most Delayed Flights", 550, 550, 200, 80);
  
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
      query.draw();
  }
   else if (currentPage == "filtering") {
    //filtering.draw();
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
  filteringButton.display();
}

void drawFlightsPage() {
  //textSize(32);
  //textAlign(CENTER, CENTER);
  //fill(0);
  //text("Bar Chart Page", width / 2, 50)
  
  barChart.draw();
}

void drawAirportsPage() {
  //textSize(32);
  //textAlign(CENTER, CENTER);
  //fill(0);
  //text("Pie Chart Page", width / 2, 50);
  
  scatterPlot.draw();
}

void drawAboutPage() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Scatter Plot Page", width / 2, 50);
}



void mousePressed() {
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
  }
  
   if (homeButton.isMouseOver()) {
     inHomePage = true;
    currentPage = "home";
  }
  
  if (query != null)
    query.mousePressed();
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


void mouseWheel(MouseEvent event) {
  float scrollAmount = event.getCount();
  scrollOffset -= scrollAmount * 20;
  scrollOffset = - abs(scrollOffset);
}
