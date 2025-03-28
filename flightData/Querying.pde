import java.util.HashSet;

class Query {
  
  QueryUI ui;
  Boolean confirmed = false;
  
  Query () {
    font = createFont("Arial", 32);
    textFont(font);
    ui = new QueryUI(parent, this);  
  }
  
  void draw() {
    if (!confirmed)
     drawSelect();
  }  
  
  void drawSelect()  {
    background(#1c618c);
    
    strokeWeight(15);
    stroke(#042e4a);
    fill(#F0F0FF);
    rect(SCREENX / 2 - 350, 100 , 700, 500, 20);
    drawText();
    confirmButton();
  }
  
  void drawText() {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Input Date and Airport", width / 2, 200);
    textSize(25);
    textAlign(RIGHT);
    text("Date: ",SCREENX / 2 - 120, 275);
    text("Airport: ",SCREENX / 2 - 120, 350);
    text("Dep / Arr:",SCREENX / 2 - 120, 425);
    
    //println("Selected Date: " + ui.selectedDate);
    //println("Selected Airport: " + ui.selectedAirport);
    //text("");
  }
  
  void confirmButton()  {
      noStroke();
      if (mouseX > SCREENX / 2 - 100 && mouseX < SCREENX / 2 + 100 && mouseY > 500 && mouseY < 550)
        fill(#00aaff);
      else
        fill(#002d5a);
      rect(SCREENX / 2 - 100, 500, 200, 50);
      fill(255);
      textAlign(CENTER);
      text("Confirm", SCREENX / 2, 535);

  }
  
  void mousePressed()  {
    if (mouseX > SCREENX / 2 - 100 && mouseX < SCREENX / 2 + 100 && mouseY > 500 && mouseY < 550) {
      confirmed = true;
      ui.cp5.hide();
    }
  }
  
  
}
