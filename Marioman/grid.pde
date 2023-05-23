public class grid{
  private int[][] map;
  private int x;
  private int y;
  private static final int WALL = 1;
  private static final int SPACE = 4;
  private static final int COIN = 0;
  private static final int POWER = 2;
  
  public void drawGrid(int[][] map){
    for (int i = 0; i < map.length; i++){
      for (int j = 0; j < map[i].length; j++){
        int identifier = map[i][j];
        if(identifier == WALL){
          square(x,y,30);
        }
        if(identifier == SPACE){
          square(x,y,30);
        }
        if(identifier == COIN){
          //coin pimg
          square(x,y,30);
        }
        if(identifier == POWER){
          // powerup pimg
          square(x,y,30);
        }
      }
    }
  }
  
  
  
}
