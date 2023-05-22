public class grid{
  private int x;
  private int y;
  public int identifier;
  private final int WALL = 0;
  private final int SPACE = 1;
  private final int COIN = 2;
  private final int POWER = 3;
  public drawGrid(){
    if(identifier == WALL){
      square(x,y,30);
    }
    if(identifier == COIN){
      // coin pimg
    }
    if(identifier == POWER){
      // pimg
    }
  }
}
