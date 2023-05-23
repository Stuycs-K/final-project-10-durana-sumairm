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
  drawBorders();
  for(int i = 0; i < map.length; i++){ // test
    for(int j = 0; j < map[0].length; j++){
      map[i][j].drawPixel();
    }
  }
}

public void drawBorders(){
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
  map[14][0].identifier = pixel.SPACE;
  map[15][0].identifier = pixel.SPACE;
  map[14][29].identifier = pixel.SPACE;
  map[15][29].identifier = pixel.SPACE;
}
