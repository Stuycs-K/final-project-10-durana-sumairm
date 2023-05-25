levels l;
int levelNum = 1; // should start at zero, but we'll worry about this when we implement a menu
pixel[][] map = new pixel[27][27];
character player = new character();


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
  
  // will be moved somewhere else soon
  drawMaze();
  drawBorder();
  drawGhostSpawn();
}

void draw(){
  if(levelNum != 0){
    background(0);
    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[0].length; j++){
        map[i][j].drawPixel();
      }
    }
    player.move();
    player.display();
  }
  drawScore();
}

void drawScore(){
  fill(0);
  rect(0, 0, 150, 20);
  fill(255);
  textSize(15);
  text("SCORE: ", 5, 15);
}
void keyPressed(){
      if(keyCode == UP && map[(int)(player.y/30)-1][(int)(player.x/30)].identifier < 0){
        player.direction = 0;
      }
      if(keyCode == RIGHT && map[(int)(player.y/30)][(int)(player.x/30)+1].identifier < 0){
        player.direction = 1;
      }
      if(keyCode == DOWN && map[(int)(player.y/30)+1][(int)(player.x/30)].identifier < 0){
        player.direction = 2;
      }
      if(keyCode == LEFT && map[(int)(player.y/30)][(int)(player.x/30)-1].identifier < 0){
        player.direction = 3;
      }
  }
  

//=============================== MAZE DRAWING METHODS

public void drawMaze(){
  l = new levels(levelNum);
  int[][] level = l.getLevel();
  for (int i = 1; i < map.length-1; i++){
    for (int j = 1; j < map[i].length-1; j++){
      map[i][j].identifier = level[i-1][j-1];
    }
  }
}

public void drawGhostSpawn(){
  map[12][10].identifier = pixel.TLCORNER;
  map[12][11].identifier = pixel.HWALL;
  map[12][12].identifier = pixel.rEND;
  map[12][13].identifier = pixel.SPACE;
  map[12][14].identifier = pixel.lEND;
  map[12][15].identifier = pixel.HWALL;
  map[12][16].identifier = pixel.TRCORNER;
  map[13][16].identifier = pixel.VWALL;
  map[14][16].identifier = pixel.VWALL;
  map[15][16].identifier = pixel.BRCORNER;
  map[15][15].identifier = pixel.HWALL;
  map[15][14].identifier = pixel.HWALL;
  map[15][13].identifier = pixel.HWALL;
  map[15][12].identifier = pixel.HWALL;
  map[15][11].identifier = pixel.HWALL;
  map[15][10].identifier = pixel.BLCORNER;
  map[14][10].identifier = pixel.VWALL;
  map[13][10].identifier = pixel.VWALL;
}

public void drawBorder(){ // should be moved to each level class later
  for(int i = 0; i < map[0].length; i++){
    if(i == 0){
      map[0][i].identifier = pixel.TLCORNER;
    } else if(i == 26){
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
  // wraparound areas
  map[13][0].identifier = pixel.BRCORNER;
  map[14][0].identifier = pixel.SPACE;
  map[15][0].identifier = pixel.TRCORNER;
  map[13][26].identifier = pixel.BLCORNER;
  map[14][26].identifier = pixel.SPACE;
  map[15][26].identifier = pixel.TLCORNER;
}
