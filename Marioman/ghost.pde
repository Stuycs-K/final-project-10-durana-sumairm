public class ghost{
  private int x;
  private int y;
  private PImage ghostImage;
  
  public ghost(int startX, int startY, PImage ghostImage) {
    x = startX;
    y = startY;
    this.ghostImage = ghostImage;
  }
  
  public void leaveSpawn(){   
      x = 405;
      y = 375;
  }
  
   public void move(int playerX, int playerY){
     int dX = playerX - x;
     int dY = playerY - y;
      if (Math.abs(dX) > Math.abs(dY)){
        if (dX > 0 && map[(y/30)][((x+15)/30)].identifier < 0){
          x++;
         } 
         else if (dX < 0 && map[(y/30)][((x-16)/30)].identifier > 0){
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
