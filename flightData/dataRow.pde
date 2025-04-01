class DataRow {
  
  int y;
  String origin, dest;
  
  DataRow(int y, String origin, String dest) {
    this.y = y;
    this.origin = origin;
    this.dest = dest;
  }

  void draw() {
    fill(#00aaff);
    rect(15, 15 + y, SCREENX - 30, 30);
  }
}
