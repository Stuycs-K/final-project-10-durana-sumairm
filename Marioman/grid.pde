public class grid{
  private int[][] map;
  private int x;
  private int y;
  //public int identifier;
  private final int VWALL = 0;
  private final int HWALL = 1;
  private final int TLCORNER = 2;
  private final int TRCORNER = 3;
  private final int BLCORNER = 4;
  private final int BRCORNER = 5;
  private final int SPACE = 7;
  private final int COIN = 8;
  private final int POWER = 9;
  public void drawGrid(int[][] map){
    for (int i = 0; i < map.length; i++){
      for (int j = 0; j < map[i].length; j++){
        int identifier = map[i][j];
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
    startCenter();
    borders();
  }
  
  public void startCenter(){
   rect(390, 365, 30, 10);
    square(360, 360, 30);
    square(330, 360, 30);
    square(300, 360, 30);
    square(360, 450, 30);    
    square(330, 450, 30);
    square(300, 390, 30);
    square(300, 420, 30);
    square(300, 450, 30);   
    square(420, 360, 30);
    square(450, 360, 30);
    square(480, 360, 30);  
    square(390, 450, 30);
    square(420, 450, 30);
    square(450, 450, 30);
    square(480, 390, 30);
    square(480, 420, 30);
    square(480, 450, 30);
  }
  
  public void borders(){
    for (int i = 0; i < 27; i++){
      square(i * 30, 0, 30);
      square(i * 30, 780, 30);
      square(0, i * 30, 30);
      square(780, i * 30, 30);
  }
  }
}
