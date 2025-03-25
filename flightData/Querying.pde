class Query {
  PFont font;
  
  Query () {
    font = createFont("Arial", 32);
    textFont(font);
    
    textAlign(CENTER);
  }
  
  void draw() {
    background(50);
    
    noStroke();
    fill(#CCEECC);
    rect(SCREENX / 2 - 350, 100 , 700, 500, 10);
    drawText();
    fill(255);
    rect(SCREENX / 2, 300, 250, 50, 10);
    rect(SCREENX / 2, 400, 250, 50, 10);
  }  
  
  void drawText() {
    fill(0);
    textSize(50);
    text("Input Date and Airport", width / 2, 200);
    textSize(30);
    text("Date: ",SCREENX / 2 - 150, 350);
    //text("");
  }
}
