public class ghost{
  private int x;
  private int y;
  private int direction;
  private PImage ghostImage;
  private float[][] directions = new float[][]{{0,-2},{2,0},{0,2},{-2,0}};
  private Frontier frontier;
  
  public ghost(int startX, int startY, PImage ghostImage) {
    x = startX;
    y = startY;
    this.ghostImage = ghostImage;
    direction = 1; 
  }
  
  
   public void move(){
     Location place = frontier.remove();
     x = place.row;
     y = place.col;
     
    /*if(x<0 || x>=790){
      x+=directions[direction][0];
    } else{
      if(directions[direction][0] > 0 && map[(y/30)][((x+15)/30)].identifier < 0){
        x+=directions[direction][0];
      }
      if(directions[direction][0] < 0 && map[(y/30)][((x-16)/30)].identifier < 0){
        x+=directions[direction][0];
      }
      if(directions[direction][1] > 0 && map[((y+15)/30)][(x/30)].identifier < 0){
        y+=directions[direction][1];
      }
      if(directions[direction][1] < 0 && map[((y-16)/30)][(x/30)].identifier < 0){
        y+=directions[direction][1];
      }
    }
    if(direction == 3 && x<=-16){
      x = 825;
    }
    if(x >= 840 && direction == 1){
      x = -30;
    }*/
  }
  

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(ghostImage, x, y, 30, 30);
  }
   
}
