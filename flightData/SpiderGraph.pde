class SpiderGraph {
  
  PImage map;
  int mapWidth;
  int mapHeight;
  
  SpiderGraph() {
    map = loadImage("map.png");
    mapWidth = map.width;
    mapHeight = map.height;
  }
  
  void draw() {
    background(180);
    //image(map, 200, 100, mapWidth * 0.9, mapHeight * 0.9);
    image(map, 150, 100);
    fill(100);
    rect(0, 0, SCREENX, 100);
    
  }
}
