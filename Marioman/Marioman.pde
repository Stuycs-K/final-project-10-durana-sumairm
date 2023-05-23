void setup(){
  background(0);
  size(810,810);
  
  int[][] level = new levelOne();
  
  colorSquares(level);
   
}

void draw(){
  colorSquares(level);
}

void colorSquares(levelOne level){
  int[][] map = level.createLevel();
  for (int r = 0; r < map.length; r++){
    for (int c = 0; c < map[r].length; c++){
      if (map[r][c] == grid.WALL){
        fill(255);
      }
      else if (map[r][c] == grid.SPACE){
        fill(0);
      }
      else if (map[r][c] == grid.COIN){
        fill(150);
      }
    }
  }
}
