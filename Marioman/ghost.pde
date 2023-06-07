import java.util.*;
public class ghost{
  private int x;
  private int y;
  private int ghostNum; 
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
  }
  
  public void move(){
    if(direction >= 0){
      if(x<0 || x>=790){
        if(direction == dRIGHT){
          if(map[y/30][(x+1)/30].ghostOn != pixel.noGhost && map[y/30][(x+1)/30].ghostOn != this.ghostNum){
            direction = dLEFT;
          } else{
            x++;
          }
        }
        if(direction == dLEFT){
          if(map[y/30][(x-1)/30].ghostOn != pixel.noGhost && map[y/30][(x-1)/30].ghostOn != this.ghostNum){
            direction = dRIGHT;
          } else{
            x--;
          }
        }
      } else{
        if(direction == dRIGHT && map[(y/30)][((x+15)/30)].identifier < 0){
          if(map[y/30][(x+1)/30].ghostOn != pixel.noGhost && map[y/30][(x+1)/30].ghostOn != this.ghostNum){
            direction = dLEFT;
          } else{
            x++;
          }
        } else if(direction == dLEFT && map[(y/30)][((x-16)/30)].identifier < 0){
          if(map[y/30][(x-1)/30].ghostOn != pixel.noGhost && map[y/30][(x-1)/30].ghostOn != this.ghostNum){
            direction = dRIGHT;
          } else{
            x--;
          }
        } else if(direction == dDOWN && map[((y+15)/30)][(x/30)].identifier < 0){
          if(map[(y+1)/30][x/30].ghostOn != pixel.noGhost && map[(y+1)/30][x/30].ghostOn != this.ghostNum){
            direction = dUP;
          } else{
            y++;
          }
        } else if(direction == dUP && map[((y-16)/30)][(x/30)].identifier < 0){
          if(map[(y-1)/30][x/30].ghostOn != pixel.noGhost && map[(y-1)/30][x/30].ghostOn != this.ghostNum){
            direction = dDOWN;
          } else{
            y--;
          }
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
