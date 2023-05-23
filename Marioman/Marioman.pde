grid map;
levelOne l;

void setup(){
  background(0);
  size(810,810);
  
  l = new levelOne();
  map = new grid(l.getLevel());
  
  colorSquares(map);
   
}

void draw(){
  background(0);
  colorSquares(map);
}

void colorSquares(grid map){
  int[][] level = l.getLevel();
  int squareSize = 30;;

  for (int r = 0; r < level.length; r++) {
    for (int c = 0; c < level[r].length; c++) {
      if (level[r][c] == grid.WALL) {
        fill(0);
      } 
      else if (level[r][c] == grid.SPACE) {
        fill(255);
      } 
      else if (level[r][c] == grid.COIN) {
        fill(225);
      } 
      else if (level[r][c] == grid.POWER) {
        fill(200, 0, 0); // Adjust color for powerup
      }
      else if (level[r][c] == grid.GATE) {
        fill(150); 
      }

      rect(c * squareSize, r * squareSize, squareSize, squareSize);
    }
}
}
