public class grid{
  private int x;
  private int y;
  public identifier;
  private final WALL = 0;
  private final SPACE = 1;
  private final COIN = 2;
  private final POWER = 3;
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
