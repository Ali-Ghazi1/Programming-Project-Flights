import java.util.HashSet;

class Query {
  
  QueryUI ui;
  Boolean confirmed = false;
  ArrayList<DataRow> rows = new ArrayList<>();
  float distance;
  
  Query () {
    font = createFont("Arial", 32);
    textFont(font);
    ui = new QueryUI(parent, this);  
  }
  
  void draw() {
    background(#1c618c);
    stroke(1);
        
    if (!confirmed)
      drawSelect();
    else
      drawData();
  }  
  
  void drawSelect()  {    
    strokeWeight(15);
    stroke(#042e4a);
    fill(#F0F0FF);
    rect(SCREENX / 2 - 350, 100, 700, 500, 20);
    
    strokeWeight(1);
    drawText();
    confirmButton();
    homeButton.display();
  }
  
  void drawData()  {
    
    for (DataRow row : rows)
      row.draw();
        
        
    fill(#0c416c);
    rect(15, 0, SCREENX - 30, 45, 5);
    
    
    textAlign(LEFT, CENTER);
    fill(255);
    textSize(25);
    text("Date", 25, 23);
    text("Origin", 200, 23);
    text("Dest", 350, 23);
    text("Dep Time", 525, 23);
    text("Arr Time", 725, 23);
    text("Sch Dep", 950, 23);
    text("Sch Arr", 1150, 23);
    
    returnButton();
  }
  
  void loadRows()  {
    rows = new ArrayList<>();
    scrollOffset = 0;
    int rowCount = 0;
    
    for (int i = 0; i < fullTable.getRowCount(); i++)  {
      TableRow row = fullTable.getRow(i);
      
      String dateString = row.getString("FL_DATE");
      String[] date = dateString.split("/");
      
      Integer day =  Integer.valueOf(date[1]);
      
      String origin = row.getString("ORIGIN");
      String dest = row.getString("DEST");
      
      String airport;
      
      String depTime = row.getString("DEP_TIME");
      String arrTime = row.getString("ARR_TIME");
      
      String schDep = row.getString("CRS_DEP_TIME");
      String schArr = row.getString("CRS_ARR_TIME");
      
      if (ui.showDepartures)
        airport = origin;
      else
        airport = dest;
        
      if (ui.selectedAirport.equalsIgnoreCase(airport) && ui.selectedDate == (day))  {
        rowCount++;
        rows.add(new DataRow(rowCount * 45, origin, dest, ui.selectedDate, depTime, arrTime, schDep, schArr));
      }
    }
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
  
  void returnButton()  {
    noStroke();
    distance = dist(mouseX, mouseY, SCREENX - 75, SCREENY - 75);
    
      if (distance < 50)
        fill(#00aaff);
      else
        fill(#002d5a);
        
      circle(SCREENX - 75, SCREENY - 75, 75);
      fill(255);
      textAlign(CENTER);
      text("Back", SCREENX - 75, SCREENY - 67);
  }
  
  void mousePressed()  {
    if (mouseX > SCREENX / 2 - 100 && mouseX < SCREENX / 2 + 100 && mouseY > 500 && mouseY < 550) {
      confirmed = true;
      ui.cp5.hide();
      loadRows();
    }
    
    distance = dist(mouseX, mouseY, SCREENX - 75, SCREENY - 75);
    if (distance < 50)  {
      confirmed = false;
      ui.cp5.show();
    }

  }
}
