class DataRow {
  
  int y, date;
  String origin, dest;
  
  DataRow(int y, String origin, String dest, int date) {
    this.y = y;
    this.origin = origin;
    this.dest = dest;
    this.date = date;
  }

  void draw() {
    textAlign(LEFT, CENTER);
    textSize(18);
    
    if (y % 2 != 0)
      fill(#00aaff);
    else
      fill(50, 125, 175);
      
    rect(15, 15 + y + scrollOffset, SCREENX - 30, 30, 5);
    fill(255);
    text(date + "/01/2022", 25, 30 + y + scrollOffset);
    text(origin, 200, 30 + y + scrollOffset);
    text(dest, 325, 30 + y + scrollOffset);
  }
}
