public class grid{
  private int x;
  private int y;
  public int identifier;
  private final int VWALL = 0;
  private final int HWALL = 1;
  private final int TLCORNER = 2;
  private final int TRCORNER = 3;
  private final int BLCORNER = 4;
  private final int BRCORNER = 5;
  private final int SPACE = 7;
  private final int COIN = 8;
  private final int POWER = 9;
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
