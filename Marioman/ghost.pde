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
  
  public void findDirection(List<ghost> ghosts){
    int dX = player.x - x;
    int dY = player.y - y;
    if (isCentered() && Math.abs(dX) > Math.abs(dY)){
      if (dX < 0){
        if (canMove(x - 2, y, ghosts)){
          direction = dLEFT;
        }
      } 
      else if (dX > 0){
        if (canMove(x + 2, y, ghosts)){
          direction = dRIGHT;
         }
      }
     } 
     else if (isCentered()){
       if (dY < 0){
          if (canMove(x, y - 2, ghosts)){
            direction = dUP;
          }
        } 
        else if (dY > 0){
          if (canMove(x, y + 2, ghosts)){
            direction = dDOWN;
          }
        }
     }
  }
  
  public void move(List<ghost> ghosts){
    if (direction >= 0){
      if (x < 0 || x >= 790){
        if (direction == dRIGHT){
          x += 2;
        }
        if (direction == dLEFT){
          x -= 2;
        }
      } 
      else{
        if (direction == dRIGHT && canMove(x + 2, y, ghosts)){
          x += 2;
         } 
         else if (direction == dLEFT && canMove(x - 2, y, ghosts)){
           x -= 2;
         } 
         else if (direction == dDOWN && canMove(x, y + 2, ghosts)){
           y += 2;
         } 
         else if (direction == dUP && canMove(x, y - 2, ghosts)){
           y -= 2;
         } 
         else{
           direction = -1;
          }
        }
        if (direction == dLEFT && x <= -16){
          x = 825;
         }
         if (x >= 840 && direction == dRIGHT){
           x = -17;
         }
       }
  }
  
  public boolean isCentered(){
    if((x >= 30 && x <= 780) && (y >= 30 && y <= 780)){
      return(x == map[y/30][x/30].centerX && y == map[y/30][x/30].centerY);
    } return false;
  }
  
  public boolean canMove(int newX, int newY, List<ghost> ghosts){
    for (ghost g : ghosts){
       if (g != this && Math.abs(newX - g.x) < 30 && Math.abs(newY - g.y) < 30){
          return false; 
       }
     }
    return map[newY/30][newX/30].identifier < 0; 
  }

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(ghostImage, x, y, 30, 30);
  }
   
}
