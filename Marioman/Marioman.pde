grid map;
levelOne l;
PImage coin;

void setup(){
  background(0);
  size(810,810);
  
  l = new levelOne();
  map = new grid(l.getLevel());  
  colorSquares(map);
  
  coin = loadImage("Coin.png");
   
}

void draw(){
  background(255);
  colorSquares(map);
}

void colorSquares(grid map){
  coin = loadImage("Coin.png");
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
        fill(255);
        image(coin, r * 30 + 3, c * 30 + 3, 25, 25);
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
