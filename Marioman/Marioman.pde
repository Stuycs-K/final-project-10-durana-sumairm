//menus
boolean mainMenu = true;
boolean playing = false;
boolean levelSelection = false;
boolean characterSelection = false;

//levels
levels l;
int levelNum = 1; // should start at zero, but we'll worry about this when we implement a menu
pixel[][] map = new pixel[27][27];
int score = 0;
//character stuff
character player;
String character = "Mario";
//power-ups
int countdown;
powerUp pow = new powerUp();
PImage FIRSTimg;
PImage SECimg;
PImage THIRDimg;
PImage FOURTHimg;
//fonts
PFont pacman;
PFont pixelFont;

void setup(){
  //load fonts
  pacman = createFont("CrackMan.otf",100);
  pixelFont = createFont("PixelFont.otf",100);
  //begin w/ main menu
  drawMainMenu();
  
  //player = new character();
  size(810,810);
  countdown = 0;
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
  
  if(playing){
    background(0);
    drawMaze();
    drawBorder();
    drawGhostSpawn();
  }
}

void draw(){
  background(0);
  if(mainMenu){
    drawMainMenu();
  }
  if(levelSelection){
    drawLevelMenu();
  }
  if(characterSelection){
    background(100);
  }
  if(playing){
    background(0);
    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[0].length; j++){
        map[i][j].drawPixel();
      }
    }
    player.move();
    countScore();
    player.display();
    println(player.x + " " + player.y);
    drawScore();
  }
}

public void drawMainMenu(){
  textFont(pacman);
  textSize(100);
  fill(#FFFF00);
  textAlign(CENTER);
  text("MARIO-MAN",400,405);
  rectMode(CENTER);
  rect(250,460,260,50);
  rect(560,460,260,50);
  rectMode(CORNER);
  textAlign(CENTER,CENTER);
  textFont(pixelFont);
  textSize(20);
  fill(0);
  text("PLAY",250,460);
  textSize(10);
  text("CHARACTER\nCUSTOMIZATION",560,460);
  textAlign(LEFT,BASELINE);
}

public void drawLevelMenu(){
  textFont(pixelFont);
  textAlign(CENTER,CENTER);
  textSize(15);
  rectMode(CENTER);
  int num = 1;
  for(int x = 100;  x < 810; x+= 151){
    fill(#FFFF00);
    rect(x,350,140,40);
    fill(0);
    text("LEVEL " + num,x,350);
    num++;
  }
  for(int x = 100;  x < 810; x+= 151){
    fill(#FFFF00);
    rect(x,410,140,40);
    fill(0);
    text("LEVEL " + num,x,410);
    num++;
  }
  fill(#f3cf34);
  rect(405,480,140,40);
  fill(0);
  text("BACK",405,480);
  rectMode(CORNER);
  textAlign(LEFT,BASELINE);
}

void mouseClicked(){
  if(mainMenu){
    if((mouseX >= 120 && mouseX <= 380) && (mouseY >= 435 && mouseY <= 485)){
      mainMenu = false;
      levelSelection = true;
    }
    if((mouseX >= 430 && mouseX <= 690) && (mouseY >= 435 && mouseY <= 485)){
      mainMenu = false;
      characterSelection = true;
    }
  }
  if(levelSelection){
    drawBorder();
    if(mouseX >= 30 && mouseX <= 170){
      if(mouseY >= 330 && mouseY <= 370){
        levelNum = 1;
        drawMaze();
        drawGhostSpawn();
        levelSelection = false;
        playing = true;
        player = new character(character);
      }
      if(mouseY >= 390 && mouseY <= 430){
        levelNum = 6;
        drawMaze();
        drawGhostSpawn();
        levelSelection = false;
        playing = true;
        player = new character(character);
      }
    }
  }
}

void keyPressed(){
  if(playing){
    if((player.x+15) < 810 && (player.x-16) > 0){
      if((keyCode == UP && map[((player.y-16)/30)][(player.x/30)].identifier < 0) && (player.x%15 == 0)){
        player.direction = 0;
      }
      if((keyCode == RIGHT && map[(player.y/30)][((player.x+15)/30)].identifier < 0) && (player.y%15 == 0)){
        player.direction = 1;
      }
      if((keyCode == DOWN && map[((player.y+15)/30)][(player.x/30)].identifier < 0) && (player.x%15 == 0)){
        player.direction = 2;
      }
      if((keyCode == LEFT && map[(player.y/30)][((player.x-16)/30)].identifier < 0) && (player.y%15 == 0)){
        player.direction = 3;
      }
    }
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
  map[12][0].identifier = pixel.BRCORNER;
  map[13][0].identifier = pixel.SPACE;
  map[14][0].identifier = pixel.TRCORNER;
  map[12][26].identifier = pixel.BLCORNER;
  map[13][26].identifier = pixel.SPACE;
  map[14][26].identifier = pixel.TLCORNER;
}

void drawScore(){
  fill(0);
  rect(0, 0, 110, 20);
  fill(255);
  textSize(15);
  text("SCORE: " + score , 5, 15);
}

void displayPower(){//need to figure out how to make it last longer
   pow.shufflePower();
   fill(180,150,40);
   stroke(255, 215, 80);
   strokeWeight(3);
   rect(335, 0, 30, 20);
   FIRSTimg = loadImage(pow.getPower(0) + ".png");
   image(FIRSTimg,343,3,15,15);
   rect(370, 0, 30, 20);
   SECimg = loadImage(pow.getPower(1) + ".png");
   image(SECimg,378,3,15,15);
   rect(405, 0, 30, 20);
   THIRDimg = loadImage(pow.getPower(2) + ".png");
   image(THIRDimg,413,3,15,15);
   rect(440, 0, 30, 20);
   FOURTHimg = loadImage(pow.getPower(3) + ".png");
   image(FOURTHimg,448,3,15,15);  
}

void countScore(){
  int x = (int) player.x;
  int y = (int) player.y;
  if((x>0 && y>0) && (x < 810)){
    if (map[y/30][x/30].identifier == pixel.COIN){
      score += 10;
      map[y/30][x/30].identifier = pixel.SPACE;
    }
    if (map[y/30][x/30].identifier == pixel.POWER){
      displayPower();
      map[y/30][x/30].identifier = pixel.SPACE;
    }
  }
}
