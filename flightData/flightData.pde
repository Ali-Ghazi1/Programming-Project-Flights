Button flightsButton;
Button airportsButton;
Button aboutButton;

String currentPage = "home";

void setup() {
  size(600, 400); 
  
  // initialising buttons
  flightsButton = new Button("Flights", 200, 150, 200, 50);
  airportsButton = new Button("Airports", 200, 220, 200, 50);
  aboutButton = new Button("About", 200, 290, 200, 50);
}

void draw() {
  background(255); 
  
  if (currentPage == "home") {
    drawHomepage();
  } else if (currentPage == "flights") {
    drawFlightsPage();
  } else if (currentPage == "airports") {
    drawAirportsPage();
  } else if (currentPage == "about") {
    drawAboutPage();
  }
}

void drawHomepage() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Welcome to Flight Explorer", width / 2, 50);
  
 
  flightsButton.display();
  airportsButton.display();
  aboutButton.display();
}

void drawFlightsPage() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Flights Page", width / 2, 50);
}

void drawAirportsPage() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Airports Page", width / 2, 50);
}

void drawAboutPage() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("About Flight Explorer", width / 2, 50);
}

void mousePressed() {
  if (flightsButton.isMouseOver()) {
    currentPage = "flights";
  }
  
  if (airportsButton.isMouseOver()) {
    currentPage = "airports";
  }
  
  if (aboutButton.isMouseOver()) {
    currentPage = "about";
  }
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
