import java.util.*;
public class ghost{
  private int x;
  private int y;
  private int direction = -1;
  private PImage ghostImage;
  boolean leftSpawn = false;
  
  public ghost(int startX, int startY, PImage ghostImage) {
    x = startX;
    y = startY;
    this.ghostImage = ghostImage;
  }
  
  public void leaveSpawn(){   
      x = 405;
      y = 345;
      leftSpawn = true;
  }
  
  public void findDirection(){
    int[][] directions = {{-16,0},{0,15},{15,0},{0,-16}};
    int dX = player.x - x;
    int dY = player.y - y;
    if((isCentered() && (map[y/30][(x+15)/30].identifier < 0 || map[y/30][(x-16)/30].identifier < 0)) && (Math.abs(dX) > Math.abs(dY))){
      if(dX < 0 && map[y/30][(x-16)/30].identifier < 0){
        direction = dLEFT;
      } else if(dX > 0 && map[y/30][(x+15)/30].identifier < 0){
        direction = dRIGHT;
      }
    } else if(isCentered()){
      if(dY < 0 && map[(y-16)/30][x/30].identifier < 0){
        direction = dUP;
      } else if(dY > 0 && map[(y+15)/30][x/30].identifier < 0){
        direction = dDOWN;
      }
    }
    if(direction == -1){
      direction = (int)(random(4));
      while(map[(y+directions[direction][0])/30][(x+directions[direction][1])/30].identifier >= 0){
        direction = (int)(random(4));
      }
    }
  }
  
  public void move(){
    if(direction >= 0){
      if(x<0 || x>=790){
        if(direction == dRIGHT){
          x++;
        }
        if(direction == dLEFT){
          x--;
        }
      } else{
        if(direction == dRIGHT && map[(y/30)][((x+15)/30)].identifier < 0){
          x++;
        } else if(direction == dLEFT && map[(y/30)][((x-16)/30)].identifier < 0){
          x--;
        } else if(direction == dDOWN && map[((y+15)/30)][(x/30)].identifier < 0){
          y++;
        } else if(direction == dUP && map[((y-16)/30)][(x/30)].identifier < 0){
          y--;
        } else{
          direction = -1;
        }
      }
      if(direction == dLEFT && x<=-16){
        x = 825;
      }
      if(x >= 840 && direction == dRIGHT){
        x = -17;
      }
    }
  }
  
  public void repelGhosts(){
    
  }
  
  public boolean isCentered(){
    if((x >= 30 && x <= 780) && (y >= 30 && y <= 780)){
      return(x == map[y/30][x/30].centerX && y == map[y/30][x/30].centerY);
    } return false;
  }

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(ghostImage, x, y, 30, 30);
  }
   
}
