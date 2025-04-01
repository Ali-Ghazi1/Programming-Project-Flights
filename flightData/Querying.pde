import java.util.HashSet;

class Query {
  
  QueryUI ui;
  Boolean confirmed = false;
  ArrayList<DataRow> rows = new ArrayList<>();
  
  Query () {
    font = createFont("Arial", 32);
    textFont(font);
    ui = new QueryUI(parent, this);  
  }
  
  void draw() {
    background(#1c618c);
        
    if (!confirmed)
      drawSelect();
    else
      drawData();
  }  
  
  void drawSelect()  {    
    strokeWeight(15);
    stroke(#042e4a);
    fill(#F0F0FF);
    rect(SCREENX / 2 - 350, 100 , 700, 500, 20);
    drawText();
    confirmButton();
  }
  
  void drawData()  {
    fill(#00aaff);
    rect(15, 15, SCREENX - 30, 30);
    
    textAlign(LEFT);
    fill(255);
    text("Date", 25, 25);
    
    for (DataRow row : rows)
        row.draw();
  }
  
  void loadRows()  {
    int rowCount = 0;
    for (int i = 0; i < table.getRowCount(); i++)  {
      TableRow row = table.getRow(i);
      
      String dateString = row.getString("FL_DATE");
      String[] date = dateString.split("/");
      
      Integer day =  Integer.valueOf(date[1]);
      String origin = row.getString("ORIGIN");
      String dest = row.getString("DEST");
      String airport;
      
      if (ui.showDepartures)
        airport = origin;
      else
        airport = dest;
        
      if (ui.selectedAirport.equalsIgnoreCase(airport) && ui.selectedDate == (day))  {
        rowCount++;
        rows.add(new DataRow(rowCount * 45 , origin, dest));
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
  
  void mousePressed()  {
    if (mouseX > SCREENX / 2 - 100 && mouseX < SCREENX / 2 + 100 && mouseY > 500 && mouseY < 550) {
      confirmed = true;
      ui.cp5.hide();
      loadRows();
    }
   
  }
}
