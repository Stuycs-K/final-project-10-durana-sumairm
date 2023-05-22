public class grid{
  private int x;
  private int y;
  public int identifier;
  private final int VWALL = 0;
  private final int HWALL = 1;
  private final int CORNER = 2;
  private final int SPACE = 3;
  private final int COIN = 4;
  private final int POWER = 5;
  public void drawGrid(){
    if(identifier == VWALL){
      square(x,y,30);
    }
    if(identifier == HWALL){
      square(x,y,30);
    }
    if(identifier == CORNER){
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
