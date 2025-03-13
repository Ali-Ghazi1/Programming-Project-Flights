class FlightDays {
  int margin = 50;
  int[] days = new int[32];
  
  FlightDays() {
    for (TableRow row : table.rows()) {
      String dateString = row.getString("FL_DATE");
      String[] date = dateString.split("/");
      Integer day =  Integer.valueOf(date[1]);
      days[day]++;
    }
  }
  
  void draw() {
    line(margin, margin, margin, SCREENY - margin);
    line(margin, SCREENY - margin, SCREENX - margin, SCREENY - margin);
    fill(0,255,0);
    for (int i = 1; i < days.length; i++) {
      rect(margin + (30 * i), SCREENY - margin, 20, -days[i]);
    }
  }
}
