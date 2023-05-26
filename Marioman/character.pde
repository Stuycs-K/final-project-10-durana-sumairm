public class character{
  private int x;
  private int y;
  private int direction;
  private PImage charImage;
  private float[][] directions = new float[][]{{0,-2},{2,0},{0,2},{-2,0}};
  public character(){
    x = -27;
    y = 432;
    direction = 1;
  }
  
  
  public void move(){
    if(x<0 || x>=790){
      x+=directions[direction][0];
    } else{
      if(directions[direction][0] > 0 && map[(int)(y/30)][(int)((x+25)/30)].identifier < 0){
        x+=directions[direction][0];
      }
      if(directions[direction][0] < 0 && map[(int)(y/30)][(int)((x-5)/30)].identifier < 0){
        x+=directions[direction][0];
      }
      if(directions[direction][1] > 0 && map[(int)((y+20)/30)][(int)(x/30)].identifier < 0){
        y+=directions[direction][1];
      }
      if(directions[direction][1] < 0 && map[(int)((y-15)/30)][(int)(x/30)].identifier < 0){
        y+=directions[direction][1];
      }
    }
    if(x == 837){
      x = -27;
    }
  }

  public void display(){
    fill(255);
    stroke(255);
    square(x+5,y-2.5,10);
  }
}
