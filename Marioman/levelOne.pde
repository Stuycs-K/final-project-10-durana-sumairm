public class levelOne{
  
  private int[][] map;
  
  public levelOne(){
    map = createLevel();
  }
  
  public int[][] createLevel(){
    int[][] level = new int[][] { 
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,0,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1},
      {1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1},
      {1,0,0,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1},
      {1,0,1,1,1,0,1,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,1},
      {1,0,1,0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1},
      {1,0,1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1},
      {1,0,1,0,0,0,1,0,1,1,1,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
      {1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,1,0,1},
      {1,0,0,0,0,0,1,0,1,1,1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,0,1,0,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,1,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,0,1,0,1,0,1,4,4,4,4,4,1,0,1,1,1,0,1,1,1,1,1},
      {1,0,0,0,1,0,1,0,0,0,1,4,4,4,4,4,1,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1},
      {1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,1,0,1},
      {1,0,1,0,1,0,1,0,0,0,1,1,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1},
      {1,0,1,0,1,0,1,1,1,0,1,0,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1},
      {1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,1,1,0,1},
      {1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,1},
      {1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,1,1},
      {1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1},
      {1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1},
      {1,0,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1} };
    return level;
    }
}