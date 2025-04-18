class BarChart {
  int margin = 50;
  int[] days = new int[32];
  int maxHeight = 5000;
  
  
  
  BarChart() {
    for (TableRow row : fullTable.rows()) {
      String dateString = row.getString("FL_DATE");
      String[] date = dateString.split("/");
      Integer day =  Integer.valueOf(date[1]);
      days[day]++;
    }
    
    for (int i : days)
      println(i);
    textAlign(CENTER, BOTTOM);
  }
  
  
  void draw() {
    background(240, 255, 255);
    textSize(12);
    homeButton.display();
    line(margin + 30, margin, margin + 30, SCREENY - margin);
    line(margin, SCREENY - margin, SCREENX - margin, SCREENY - margin);
    
    for (int i = 1; i <= 10; i++) {
      fill(0);
      textSize(14);
      line(margin + 20, SCREENY - margin - (60 * i), margin + 30, SCREENY - margin - (60 * i));
      text(15000 + 500 * i, margin, SCREENY - margin - (60 * i));
    }
    
    for (int i = 1; i < days.length; i++) {
      int normalisedColour = normaliseColour(days[i] - 15000);
      fill(255 - normalisedColour / 2, normalisedColour, 0);
      rect(margin + (30 * i), SCREENY - margin, 20, -normaliseHeight(days[i] - 15000));
      fill(0);
      text(i, 60 + 30 * i, SCREENY - margin + 20);
    }
    
    textSize(26);
    text("Number of Flights per Day", SCREENX / 2, 50);
    textSize(12);
  }
  
  int normaliseHeight(int x) {
      float newHeight = ((float) x / maxHeight) * 600;
      return (int) newHeight;
  }
  
  int normaliseColour(int x) {
    float normalisedColour = (float) x  / maxHeight * 255;
    return (int) normalisedColour;
  }
}
