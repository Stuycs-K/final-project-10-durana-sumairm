public class character{
  private int x;
  private int y;
  private int direction;
  private PImage charImage;
  private int[][] directions = new int[][]{{0,-2},{2,0},{0,2},{-2,0}};
  public character(String selection){
    x = -27;
    y = 405;
    direction = dRIGHT;
    charImage = loadImage(character + ".png");
  }
  
  
  public void move(){
    if(x<0 || x>=790){
      x+=directions[direction][0];
    } else{
      if(direction == dRIGHT && map[(y/30)][((x+15)/30)].identifier < 0){
        x+=directions[direction][0];
      } else if(direction == dLEFT && map[(y/30)][((x-16)/30)].identifier < 0){
        x+=directions[direction][0];
      } else if(direction == dDOWN && map[((y+15)/30)][(x/30)].identifier < 0){
        y+=directions[direction][1];
      } else if(direction == dUP && map[((y-16)/30)][(x/30)].identifier < 0){
        y+=directions[direction][1];
      } else{
        direction = -1;
      }
    }
    if(direction == dLEFT && x<=-16){
      x = 825;
    }
    if(x >= 840 && direction == dRIGHT){
      x = -30;
    }
  }
  
  public boolean isCentered(){
    if((x >= 30 && x <= 780) && (y >= 30 && y <= 780)){
      return(x == map[y/30][x/30].centerX && y == map[y/30][x/30].centerY);
    } return false;
  }
  
  public void start(){
    x = -27;
    y = 405;
  }

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(charImage,x,y,30,30);
  }
}
