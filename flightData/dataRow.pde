class DataRow {
  
  int y, date, time, hours, minutes;
  String origin, dest, depTime, arrTime, schDep, schArr; 
  
  DataRow(int y, String origin, String dest, int date, String depTime, String arrTime, String schDep, String schArr) {
    this.y = y;
    this.origin = origin;
    this.dest = dest;
    this.date = date;
    
    if (depTime.equals("") || arrTime.equals("")) {
      this.depTime = depTime;
      this.arrTime = arrTime;
    }
    else {
      time = Integer.valueOf(depTime);
      hours = time / 100;
      minutes = time % 100;
      this.depTime = String.format("%02d:%02d", hours, minutes);
      
      if (!arrTime.equals(""));
      time = Integer.valueOf(arrTime);
      hours = time / 100;
      minutes = time % 100;
      this.arrTime = String.format("%02d:%02d", hours, minutes);
    }

      time = Integer.valueOf(schDep);
      hours = time / 100;
      minutes = time % 100;
      this.schDep = String.format("%02d:%02d", hours, minutes);
      
      time = Integer.valueOf(schArr);
      hours = time / 100;
      minutes = time % 100;
      this.schArr = String.format("%02d:%02d", hours, minutes);  
      
      
    
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
    text(dest, 350, 30 + y + scrollOffset);
    
    text(depTime, 525, 30 + y + scrollOffset);
    text(arrTime, 725, 30 + y + scrollOffset);
    
    text(schDep, 950, 30 + y + scrollOffset);
    text(schArr, 1150, 30 + y + scrollOffset);
  }
}
