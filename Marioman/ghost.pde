public class ghost{
  private int x;
  private int y;
  private float distanceAbove;
  private float distanceRight;
  private float distanceLeft;
  private float distanceBelow;
  private PImage ghostImage;
  
  public ghost(int startX, int startY, PImage ghostImage) {
    x = startX;
    y = startY;
    this.ghostImage = ghostImage;
  }
  
  public void leaveSpawn(){   
      x = 405;
      y = 345;
  }
  
  public void calcDistance(int playerX, int playerY){
    if(map[(y-16)/30][x/30].identifier < 0){
      distanceAbove = dist(map[(y-16)/30][x/30].centerX, map[(y-16)/30][x/30].centerY, playerX, playerY);
    } else{
      distanceAbove = -1
    }
    if(map[y/30][(x+15)/30].identifier < 0){
      distanceRight = dist(map[y/30][(x+15)/30].centerX, map[y/30][(x+15)/30].centerY, playerX, playerY);
    } else{
      distanceRight = -1
    }
    if(map[(y+15)/30][x/30].identifier < 0){
      distanceBelow = dist(map[(y+15)/30][x/30].centerX, map[(y+15)/30][x/30].centerY, playerX, playerY);
    } else{
      distanceBelow = -1
    }
    if(map[y/30][(x-16)/30].identifier < 0){
      distanceLeft = dist(map[y/30][(x-16)/30].centerX, map[y/30][(x-16)/30].centerY, playerX, playerY);
    } else{
      distanceLeft = -1
    }
  }
  
  public void move(int playerX, int playerY){
    if(
  }
  
   public void move(int playerX, int playerY){
     int dX = playerX - x;
     int dY = playerY - y;
     if (Math.abs(dX) < Math.abs(dY)){
        if (dX > 0 && map[(y/30)][((x+15)/30)].identifier < 0){
          x++;
         } 
         else if (dX < 0 && map[(y/30)][((x-16)/30)].identifier < 0){
            x--;
          }
        } 
        else{
          if (dY > 0 && map[((y+15)/30)][(x/30)].identifier < 0){
             y++;
           } 
           else if (dY < 0 && map[((y-16)/30)][(x/30)].identifier < 0){
             y--;
           }
        }
  }
  

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(ghostImage, x, y, 30, 30);
  }
   
}
