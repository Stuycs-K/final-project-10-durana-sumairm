public class grid{
  PImage coin = loadImage("Coin.png");;
  private int[][] map;
  private int x;
  private int y;
  private static final int WALL = 1;
  private static final int SPACE = 4;
  private static final int COIN = 0;
  private static final int POWER = 2;
  private static final int GATE = 3;
  
  public grid(int[][] level){
    map = level;
  }
  
  public void drawGrid(){
    for (int i = 0; i < map.length; i++){
      for (int j = 0; j < map[i].length; j++){
        int identifier = map[i][j];
        if(identifier == WALL){
          square(i * 30,j * 30,30);
        }
        if(identifier == SPACE){
          square(i * 30,j * 30,30);
        }
        if(identifier == COIN){
          //coin pimg
          square(i * 30,j * 30,30);
          image(coin, i * 30, j * 30, 15, 15);
        }
        if(identifier == POWER){
          // powerup pimg
          square(i * 30,j * 30,30);
        }
      }
    }
  }
  
  
  
}
