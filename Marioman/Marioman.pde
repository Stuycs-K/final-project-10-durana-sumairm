levelOne l;
PImage coin;
pixel[][] map = new pixel[30][30];


void setup(){
  background(0);
  size(810,810);
  int x = 0;
  int y = 0;
  
  for(int i = 0; i < map.length; i++){ // sections the map into pixels
    for(int j = 0; j < map[0].length; j++){
      map[i][j] = new pixel(x,y);
      x+= 27;
    }
    x = 0;
    y+=27;
  }
  
  l = new levelOne();
  //map = new grid(l.getLevel());  
  //colorSquares(map);  
  coin = loadImage("Coin.png");
  


  drawBorder(); // SHOULD ONLY BE CALLED IN EACH LEVELS CLASS, here for testing purposes
  for(int i = 0; i < map.length; i++){ // test, implement this in class to draw the initial maze
    for(int j = 0; j < map[0].length; j++){
      map[i][j].drawPixel();
    }
  }
   
}

void draw(){
  
}

/*void colorSquares(grid map){
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
}*/



public void drawBorder(){ // should be moved to each level class later
  for(int i = 0; i < map[0].length; i++){
    if(i == 0){
      map[0][i].identifier = pixel.TLCORNER;
    } else if(i == 29){
      map[0][i].identifier = pixel.TRCORNER;
    } else{
      map[0][i].identifier = pixel.HWALL;
    }
  }
  for(int i = 0; i < map[0].length; i++){
    if(i == 0){
      map[29][i].identifier = pixel.BLCORNER;
    } else if(i == 29){
      map[29][i].identifier = pixel.BRCORNER;
    } else{
      map[29][i].identifier = pixel.HWALL;
    }
  }
  for(int i = 1; i < map.length-1; i++){
    map[i][0].identifier = pixel.VWALL;
  }
  for(int i = 1; i < map.length-1; i++){
    map[i][29].identifier = pixel.VWALL;
  }
  map[13][0].identifier = pixel.BRCORNER;
  map[14][0].identifier = pixel.SPACE;
  map[15][0].identifier = pixel.SPACE;
  map[16][0].identifier = pixel.TRCORNER;
  map[13][29].identifier = pixel.BLCORNER;
  map[14][29].identifier = pixel.SPACE;
  map[15][29].identifier = pixel.SPACE;
  map[16][29].identifier = pixel.TLCORNER;
  map[1][1].identifier = pixel.COIN;
  map[1][2].identifier = pixel.POWER;
}
