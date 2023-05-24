levelOne l;
PImage coin;
pixel[][] map = new pixel[27][27];


void setup(){
  background(0);
  size(810,810);
  int x = 0;
  int y = 0;
  
  for(int i = 0; i < map.length; i++){ // sections the map into pixels
    for(int j = 0; j < map[0].length; j++){
      map[i][j] = new pixel(x,y);
      x+= 30;
    }
    x = 0;
    y+=30;
  }
  
  l = new levelOne();
  int[][] level = l.getLevel();
  coin = loadImage("Coin.png");
  

  drawMaze();
  drawBorder();
  for(int i = 0; i < map.length; i++){ // test, implement this in class to draw the initial maze
    for(int j = 0; j < map[0].length; j++){
      map[i][j].drawPixel();
    }
  }
   
}

void draw(){
  
}

public void drawMaze(){
  l = new levelOne();
  int[][] level = l.getLevel();
  for (int i = 0; i < map.length; i++){
    for (int j = 0; j < map[i].length; j++){
      map[i][j].identifier = level[i][j];
    }
  }
}

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
      map[26][i].identifier = pixel.BLCORNER;
    } else if(i == 26){
      map[26][i].identifier = pixel.BRCORNER;
    } else{
      map[26][i].identifier = pixel.HWALL;
    }
  }
  for(int i = 1; i < map.length-1; i++){
    map[i][0].identifier = pixel.VWALL;
  }
  for(int i = 1; i < map.length-1; i++){
    map[i][26].identifier = pixel.VWALL;
  }
  map[13][0].identifier = pixel.BRCORNER;
  map[14][0].identifier = pixel.SPACE;
  map[15][0].identifier = pixel.SPACE;
  map[16][0].identifier = pixel.TRCORNER;
  map[13][26].identifier = pixel.BLCORNER;
  map[14][26].identifier = pixel.SPACE;
  map[15][26].identifier = pixel.SPACE;
  map[16][26].identifier = pixel.TLCORNER;
  map[1][1].identifier = pixel.COIN;
  map[1][2].identifier = pixel.POWER;
}
