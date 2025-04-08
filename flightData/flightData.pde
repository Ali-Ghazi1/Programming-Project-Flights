import controlP5.*;

int scrollOffset;
PApplet parent = this;
PImage image;

boolean inHomePage = true;
float x = 0;

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
Table fullTable;

BarChart barChart;
ScatterPlot scatterPlot;
PieChartDepartures pieChart;
Query query;
DelayedFlights delayed;

String currentPage = "home";

void setup() {
  size(1280, 720); 
  table = loadTable("flights2k.csv", "header");
  fullTable = loadTable("flights_full.csv", "header");
  scatterPlot = new ScatterPlot();
  // initialising buttons
  barChartButton = new Button("Flights Per Day", 550, 150, 200, 80);
  scatterPlotButton = new Button("Scatter Plot", 550, 250, 200, 80);
  pieChartButton = new Button("Flights by State", 550, 350, 200, 80);
  homeButton = new Button("Home", 1150, 50, 100, 50);
  queryButton = new Button("Query Page", 550, 450, 200, 80);
  delayedButton = new Button("Most Delayed Flights", 550, 550, 200, 80);
  pieChart = new PieChartDepartures();
  image = loadImage("background-image.jpg");
}

void draw() {
  background(175, 200, 200); 
  stroke(1);
  
  image(image, x, height/2 - image.height/2);
  image(image, x - image.width, height/2 - image.height/2); 

  x += 2; 

  if (x >= image.width) {
    x = 0;
  }

  
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

void drawPieChart() {
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
        query.ui.cp5.hide();
      currentPage = "home";
   }
    
  if (currentPage.equals("query"))
    query.mousePressed();
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
    stroke(#242e4a);
    strokeWeight(3);
    fill(#00aaff); // Button color
    rect(x, y, w, h, 10); // Draw the button with rounded corners
    strokeWeight(1);
    textSize(22);
    textAlign(CENTER, CENTER);
    fill(255);
    text(label, x + w / 2, y + h / 2); // Place the text on the button
  }
  
  boolean isMouseOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
