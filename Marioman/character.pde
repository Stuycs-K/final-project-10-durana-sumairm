public class character{
  private int x;
  private int y;
  private int direction;
  private float[][] directions = new float[][]{{0,-2},{2,0},{0,2},{-2,0}};
  public character(){
    x = -27;
    y = 405;
    direction = 1;
  }
  
  public void move(){
    x+=directions[direction][0];
    y+=directions[direction][1];
    if(x == 837){
      x = -27;
    }
  }
  
  public void display(){
    fill(255);
    stroke(255);
    square(x,y-5,10);
  }
}
