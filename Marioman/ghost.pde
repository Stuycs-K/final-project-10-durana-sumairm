public class ghost{
  private int x;
  private int y;
  private PImage ghostImage;
  
  public ghost(int startX, int startY, PImage ghostImage) {
    x = startX;
    y = startY;
    this.ghostImage = ghostImage;
  }
  
  
   public void move(int playerX, int playerY){
     int dX = playerX - x;
     int dY = playerY - y;
     if (Math.abs(dX) > Math.abs(dY)) {
       if (dX > 0){
         x++;
        } 
        else{
         x--;
         }
        } 
        else{
         if (dY > 0){
           y++;
          } 
          else{
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
