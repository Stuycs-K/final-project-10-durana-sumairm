public class character{
  private int x;
  private int y;
  private int direction;
  private PImage charImage;
  private int[][] directions = new int[][]{{0,-2},{2,0},{0,2},{-2,0}};
  public character(String selection){
    x = -27;
    y = 405;
    direction = 1;
    charImage = loadImage(character + ".png");
  }
  
  
  public void move(){
    if(x<0 || x>=790){
      x+=directions[direction][0];
    } else{
      if(directions[direction][0] > 0 && map[(y/30)][((x+15)/30)].identifier < 0){
        x+=directions[direction][0];
      } else if(directions[direction][0] < 0 && map[(y/30)][((x-16)/30)].identifier < 0){
        x+=directions[direction][0];
      } else if(directions[direction][1] > 0 && map[((y+15)/30)][(x/30)].identifier < 0){
        y+=directions[direction][1];
      } else if(directions[direction][1] < 0 && map[((y-16)/30)][(x/30)].identifier < 0){
        y+=directions[direction][1];
      } else{
        if(x/15 !=0){
          x = (x/15)*15;
        }
        if(y/15 != 0){
          y = (y/15)*15;
        }
      }
    }
    if(direction == 3 && x<=-16){
      x = 825;
    }
    if(x >= 840 && direction == 1){
      x = -30;
    }
  }

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(charImage,x,y,30,30);
  }
}
