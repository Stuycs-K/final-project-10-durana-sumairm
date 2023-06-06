//menus
boolean mainMenu = true; //<>// //<>//
boolean playing = false; //<>// //<>//
boolean levelSelection = false;
boolean characterSelection = false;
boolean overScreen = false;
boolean winScreen = false;

//directions
final int dUP = 0;
final int dRIGHT = 1;
final int dDOWN = 2;
final int dLEFT = 3;

//levels
levels l;
int levelNum = 1;
pixel[][] map = new pixel[27][27];
int score = 0;

//character stuff
PImage Mario;
PImage PrincessPeach;
PImage Luigi;
PImage pla; //player for lives display
character player;
List<ghost> ghosts;
PImage Bowser;
ghost g1;
PImage KingBoo;
ghost g2;
PImage Wario;
ghost g3;
PImage Waluigi;
ghost g4;
String character = "Mario";
int lives = 3;

//power-ups
int countdown;
int ghostCountdown = 900; //<>//
powerUp pow = new powerUp(); //<>//
boolean notGodMode = true; //if it is true then you can die
int godCount = 90; //<>//
PImage power; //<>//
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
  
  //load enemies
  Bowser = loadImage("Bowser.png");
  g1 = new ghost(345,405, Bowser);
  KingBoo = loadImage("KingBoo.png");
  g2 = new ghost(390,405, KingBoo);
  Wario = loadImage("Wario.png");
  g3 = new ghost(450,405, Wario);
  Waluigi = loadImage("Waluigi.png");
  g4 = new ghost(420, 405, Waluigi);
  
  size(810,810);
 
  countdown = 0;
  pow.shufflePower();
  
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
    drawCharacterMenu();
  }
  if (lives == 0 || overScreen){
    playing = false;
    drawGameOver();
  }
  if(playing){
    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[0].length; j++){
        map[i][j].drawPixel();
      }     
    }
    player.move();
    countScore();
    player.display();
    drawScore();
    g1.display();
    g2.display();
    g3.display();
    g4.display();
    ghostKill();
    drawLives();
    if(ghostCountdown%300 == 0){
      freeGhost();
    }
    if(ghostCountdown > 0){
      ghostCountdown--;
    }
    if(g1.leftSpawn){
      g1.move();
      if(g1.direction < 0 || g1.isCentered()){
        g1.findDirection();
      }
    }
    if(g2.leftSpawn){
      g2.move();
      if(g2.direction < 0 || g2.isCentered()){
        g2.findDirection();
      }
    }
    if(g3.leftSpawn){
      g3.move();
      if(g3.direction < 0 || g3.isCentered()){
        g3.findDirection();
      }
    }
    if(g4.leftSpawn){
      g4.move();
      if(g4.direction < 0 || g4.isCentered()){
        g4.findDirection();
      }
    }
    if (countdown > 0){
      displayPower();
      countdown--;
    }
    if (godCount > 0){
      godCount--;
    }
    if(isDone()){
      playing = false;
      winScreen = true;
      drawWin();
    }
  }
  if (winScreen){
      drawWin();
  }
}

void reset(){
  mainMenu = true;
  ghostCountdown = 900;
  lives = 3;
  g1.leftSpawn = false;
  g2.leftSpawn = false;
  g3.leftSpawn = false;
  g4.leftSpawn = false;
  g1.x = 345; g1.y = 405;
  g2.x = 390; g2.y = 405;
  g3.x = 450; g3.y = 405;
  g4.x = 420; g4.y = 405;
}


//=============================== MENU DRAWING METHODS

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

public void drawCharacterMenu(){
  Mario = loadImage("Mario.png");
  PrincessPeach = loadImage("PrincessPeach.png");
  Luigi = loadImage("Luigi.png");
  imageMode(CENTER);
  textAlign(CENTER,CENTER);
  fill(255);
  textSize(10);
  if(character.equals("Mario")){
    rectMode(CENTER);
    fill(0);
    stroke(#2121DE);
    strokeWeight(4);
    square(200,350,65);
    rectMode(CORNER);
  }
  image(Mario,200,350,60,60);
  fill(255);
  text("Mario",200,400);
  if(character.equals("PrincessPeach")){
    rectMode(CENTER);
    fill(0);
    stroke(#2121DE);
    strokeWeight(4);
    square(300,350,65);
    rectMode(CORNER);
  }
  image(PrincessPeach,300,350,60,60);
  fill(255);
  text("Princess\nPeach",300,400);
  if(character.equals("Luigi")){
    rectMode(CENTER);
    fill(0);
    stroke(#2121DE);
    strokeWeight(4);
    square(400,350,65);
    rectMode(CORNER);
  }
  image(Luigi,400,350,60,60);
  fill(255);
  text("Luigi",400,400);
  noStroke();
  rectMode(CENTER);
  fill(#f3cf34);
  rect(405,480,140,40);
  rectMode(CORNER);
  fill(0);
  text("BACK",405,480);
  imageMode(CORNER);
  textAlign(LEFT,BASELINE);
}

public void drawGameOver(){
  overScreen = true;
  power = loadImage("Power.png");
  background(0);
  textFont(pixelFont);
  textAlign(CENTER,CENTER);
  textSize(70);
  fill(255);
  text("GAME  OVER", 405, 370);
  imageMode(CENTER);
  image(power,410,380,70,70);
  image(loadImage(character + ".png"),130,250,100,100);
  image(Bowser,350,250,100,100);
  image(KingBoo,480,250,100,100);
  image(Waluigi,590,250,100,100);
  image(Wario,710,250,100,100);
  
  fill(#f3cf34);
  noStroke();
  rectMode(CENTER);
  rect(405,480,240,60);
  rectMode(CORNER);
  fill(0);
  textSize(20);
  text("PLAY AGAIN",405,475);
  imageMode(CORNER);
  textAlign(LEFT,BASELINE);
}

public void drawWin(){
  textFont(pixelFont);
  textAlign(CENTER,CENTER);
  textSize(70);
  fill(255);
  text("WINNER", 405, 370);
  
  fill(#f3cf34);
  noStroke();
  rectMode(CENTER);
  rect(405,480,240,60);
  rectMode(CORNER);
  fill(0);
  textSize(20);
  text("PLAY AGAIN",405,475);
  imageMode(CORNER);
  textAlign(LEFT,BASELINE);
}

//=============================== MENU FUNCTIONALITY & PLAYER CONTROLS

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
        drawLives();
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
    if(mouseX >= 181 && mouseX <= 321){
      if(mouseY >= 330 && mouseY <= 370){
        levelNum = 2;
        drawMaze();
        drawGhostSpawn();
        levelSelection = false;
        playing = true;
        player = new character(character);
      }
      if(mouseY >= 390 && mouseY <= 430){
        levelNum = 7;
        drawMaze();
        drawGhostSpawn();
        levelSelection = false;
        playing = true;
        player = new character(character);
      }
    }
    if((mouseX >= 335 && mouseX <= 475) && (mouseY >= 460 && mouseY <= 500)){ // back button
      levelSelection = false;
      mainMenu = true;
    }
  }
  if(characterSelection){
    if(mouseY >= 290 && mouseY <= 410){
      if(mouseX >= 140 && mouseX <= 260){
        character = "Mario";
      }
      if(mouseX >= 240 && mouseX <= 360){
        character = "PrincessPeach";
      }
      if(mouseX >= 340 && mouseX <= 460){
        character = "Luigi";
      }
    }
    if((mouseX >= 335 && mouseX <= 475) && (mouseY >= 460 && mouseY <= 500)){ // back button
      characterSelection = false;
      mainMenu = true;
    }
  }
  if (overScreen){
    if ((mouseY >= 410 && mouseY <= 510) && (mouseX >= 285 && mouseX <= 525)){
      overScreen = false;
      reset();
    }
  }
  if (winScreen){
    if ((mouseY >= 410 && mouseY <= 510) && (mouseX >= 285 && mouseX <= 525)){
      winScreen = false;
      reset();
    }
  }
}

void keyPressed(){
  if(playing){
    if((player.x+15) < 810 && (player.x-16) > 0){
      if(keyCode == UP){
        if(canMoveUp()){
          player.direction = dUP;
        }
        if(player.direction == -1){
          player.direction = dUP;
        }
      }
      if(keyCode == RIGHT){
        if(canMoveRight()){
          player.direction = dRIGHT;
        }
        if(player.direction == -1){
          player.direction = dRIGHT;
        }
      }
      if(keyCode == DOWN){
        if(canMoveDown()){
          player.direction = dDOWN;
        }
        if(player.direction == -1){
          player.direction = dDOWN;
        }
      }
      if(keyCode == LEFT){
        if(canMoveLeft()){
          player.direction = dLEFT;
        }
        if(player.direction == -1){
          player.direction = dLEFT;
        }
      }
    }
  }
}

//=============================== CHARACTER KILLS 

void drawLives(){
  pla = loadImage(character.toString() + ".png");
  fill(0);
  rect(0, 785, 230, 20);
  fill(255);
  textFont(pixelFont);
  textSize(14);
  text("LIVES: " + lives, 5, 801);
  if (lives == 3){    
    image(pla, 140, 797, 15, 15);
    image(pla, 175, 797, 15, 15);
    image(pla, 205, 797, 15, 15);
  }
  if (lives == 2){    
    image(pla, 140, 797, 15, 15);
    image(pla, 175, 797, 15, 15);
  }
  if (lives == 1){    
    image(pla, 140, 797, 15, 15);
  }
}

public void ghostKill(){
  if((player.x >= 29 && player.x <= 780) && (player.y >= 29 && player.y <= 780)){
    if (lives > 0 && notGodMode){
      if ((g1.x / 30) ==  (player.x / 30) && (g1.y / 30) == (player.y / 30) ){
        player.start();
        lives--;
      }
      if (map[g2.y/30][g2.x/30] == map[player.y/30][player.x/30]){
        player.start();
        lives--;
      }
      if (map[g3.y/30][g3.x/30] == map[player.y/30][player.x/30]){
        player.start();
        lives--;
      }
      if (map[g4.y/30][g4.x/30] == map[player.y/30][player.x/30]){
        player.start();
        lives--;
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
  map[12][13].identifier = pixel.INVISWALL;
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
  g1.x = 345;
  g1.y = 405;
  g2.x = 390;
  g2.y = 405;
  g3.x = 450;
  g3.y = 405;
  g4.x = 420;
  g4.y = 405;
}

public void drawBorder(){
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

boolean isDone(){ //checks if all the coins have been collected
  for (int i = 0; i < 27; i++){
    for (int j = 0; j < 27; j++){
      if (map[i][j].identifier == pixel.COIN){
        return false;
      }
    }
  }
  return true;
}

void displayPower(){
   fill(180,150,40);
   stroke(255, 215, 80);
   strokeWeight(3);
   rect(285, 390, 50, 50);
   FIRSTimg = loadImage(pow.getPower(0) + ".png");
   image(FIRSTimg,310,415,40,40);
   fill(35,10,135);
   stroke(115, 80, 255);
   rect(345, 390, 50, 50);
   SECimg = loadImage(pow.getPower(1) + ".png");
   image(SECimg,370,415,40,40);
   rect(405, 390, 50, 50);
   THIRDimg = loadImage(pow.getPower(2) + ".png");
   image(THIRDimg,430,415,40,40);
   rect(465, 390, 50, 50);
   FOURTHimg = loadImage(pow.getPower(3) + ".png");
   image(FOURTHimg,490,415,40,40); 
}

void drawScore(){
  fill(0);
  rect(0, 0, 200, 20);
  fill(255);
  textFont(pixelFont);
  textSize(14);
  text("SCORE: " + score , 5, 16);
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
      countdown += 45;
      pow.shufflePower();
      pUP();
      map[y/30][x/30].identifier = pixel.SPACE;
    }
  }
}


void freeGhost(){
  if(!g1.leftSpawn){
    g1.leaveSpawn();
  } else if(!g2.leftSpawn){
    g2.leaveSpawn();
  } else if(!g3.leftSpawn){
    g3.leaveSpawn();
  } else if(!g4.leftSpawn){
    g4.leaveSpawn();
  }
}

void pUP(){
  if (pow.getPower(0).equals("boost")){
    if (player.direction == dDOWN){
      player.y += 16;
    }
    if (player.direction == dUP){
      player.y -= 16;
    }
    if (player.direction == dLEFT){
      player.x -= 16;
    }
    if (player.direction == dRIGHT){
      player.x += 16;
    }
    
  }
  if (pow.getPower(0).equals("god")){
    notGodMode = false;
    if (godCount == 0){
      notGodMode = true;
    }
    
  }
  if (pow.getPower(0).equals("teleport")){
    int indX = (int) random(27);
    int indY = (int) random(27);
    if (map[indX][indY].identifier < 0){
      player.x = map[indX][indY].centerX;
      player.y = map[indX][indY].centerY;
    }
  }
  if (pow.getPower(0).equals("ghost")){
    g1.x = 345;
    g1.y = 405;
    g2.x = 390;
    g2.y = 405;
    g3.x = 450;
    g3.y = 405;
    g4.x = 420;
    g4.y = 405;
    g1.leftSpawn = false;
    g2.leftSpawn = false;
    g3.leftSpawn = false;
    g4.leftSpawn = false;
    ghostCountdown = 900;
  }
}

boolean canMoveLeft(){
  return (map[(player.y/30)][((player.x-16)/30)].identifier < 0 && player.isCentered());
}

boolean canMoveDown(){
  return (map[((player.y+15)/30)][(player.x/30)].identifier < 0 && player.isCentered());
}

boolean canMoveUp(){
  return (map[((player.y-16)/30)][(player.x/30)].identifier < 0 && player.isCentered());
}

boolean canMoveRight(){
  return (map[(player.y/30)][((player.x+15)/30)].identifier < 0 && player.isCentered());
}
