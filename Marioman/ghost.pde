public class ghost{
  private int x;
  private int y;
  private int direction;
  private PImage ghostImage;
  private float[][] directions = new float[][]{{0,-2},{2,0},{0,2},{-2,0}};
  
  public ghost(int startX, int startY, PImage ghostImage) {
    x = startX;
    y = startY;
    this.ghostImage = ghostImage;
    direction = 3; 
  }
  

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(ghostImage, x, y, 30, 30);
  }
   
}
