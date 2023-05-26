public class character{
  private float x;
  private float y;
  private int direction;
  private PImage charImage;
  private float[][] directions = new float[][]{{0,-2},{2,0},{0,2},{-2,0}};
  public character(){
    x = -27;
    y = 405;
    direction = 1;
    charImage = Mario;
  }
  
  
  public void move(){
    if(x<0 || x>=790){
      x+=directions[direction][0];
    } else{
      if(directions[direction][0] > 0 && map[(int)(y/30)][(int)((x+15)/30)].identifier < 0){
        x+=directions[direction][0];
      }
      if(directions[direction][0] < 0 && map[(int)(y/30)][(int)((x-16)/30)].identifier < 0){
        x+=directions[direction][0];
      }
      if(directions[direction][1] > 0 && map[(int)((y+15)/30)][(int)(x/30)].identifier < 0){
        y+=directions[direction][1];
      }
      if(directions[direction][1] < 0 && map[(int)((y-16)/30)][(int)(x/30)].identifier < 0){
        y+=directions[direction][1];
      }
    }
    if(direction == 3 && x==-16){
      x = 825;
    }
    if(x == 840){
      x = -30;
    }
  }

  public void display(){
    fill(255);
    stroke(255);
    imageMode(CENTER);
    image(charImage,x,y,30,30);
  }
}
