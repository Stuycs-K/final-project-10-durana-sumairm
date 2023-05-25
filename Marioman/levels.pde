public class levels{
  private int[][] selectedLevel;
  private int[][] level1Map = new int[][]{
      {-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-3,-2,-2},
      {-2,7,-2,7,-2,2,8,-2,10,1,1,1,1,8,-2,10,1,3,-2,10,1,1,1,3,-2},
      {-2,9,-2,0,-2,0,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,0,-2,-2,-2,-2,-2,0,-2},
      {-2,-2,-2,0,-2,0,-2,2,1,1,1,8,-2,10,1,3,-2,0,-2,10,1,3,-2,9,-2},
      {-2,10,1,5,-2,9,-2,0,-2,-2,-2,-2,-3,-2,-2,0,-2,0,-2,-2,-2,0,-2,-2,-2},
      {-2,-2,-2,-2,-2,-2,-2,0,-2,10,1,1,1,1,1,5,-2,4,1,8,-2,0,-2,7,-2},
      {-2,10,1,1,1,3,-2,0,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,0,-2,0,-2},
      {-2,-2,-2,-2,-2,0,-2,4,1,1,8,-2,10,3,-2,7,-2,7,-2,7,-2,0,-2,0,-2},
      {-2,10,1,8,-2,0,-2,-2,-2,-2,-2,-2,-2,0,-2,0,-2,9,-2,4,1,5,-2,9,-2},
      {-2,-2,-2,-2,-2,0,-2,2,1,1,1,8,-2,9,-2,9,-2,-2,-2,-2,-2,-2,-2,-2,-2},
      {10,1,1,8,-2,9,-2,0,-2,-2,-2,-2,-2,-2,-2,-2,-2,10,1,8,-2,10,1,1,8},
      {-2,-2,-2,-2,-3,-2,-2,0,-2,2,1,1,-1,1,1,3,-2,-2,-2,-2,-2,-2,-2,-2,-2},
      {10,1,1,8,-2,7,-2,9,-2,0,-1,-1,-1,-1,-1,0,-2,10,1,8,-2,10,1,1,8},
      {-2,-2,-2,-2,-2,0,-2,-2,-2,0,-1,-1,-1,-1,-1,0,-2,-2,-2,-2,-2,-2,-2,-2,-2},
      {-2,7,-2,7,-2,0,-2,7,-2,4,1,1,1,1,1,5,-2,2,1,1,1,1,1,3,-2},
      {-2,9,-2,0,-2,0,-2,9,-2,-2,-2,-2,-2,7,-2,6,-2,9,-2,-2,-3,-2,-2,0,-2},
      {-2,-2,-2,0,-2,0,-2,-2,-2,2,1,3,-2,9,-2,-2,-2,-2,-2,6,-2,6,-2,0,-2},
      {-2,7,-2,0,-2,4,1,8,-2,0,-2,0,-2,-2,-2,7,-2,10,1,3,-2,-2,-2,0,-2},
      {-2,0,-2,0,-2,-2,-2,-2,-2,0,-2,0,-2,7,-2,0,-2,-2,-2,0,-2,2,1,5,-2},
      {-2,0,-2,4,1,1,1,3,-2,0,-2,0,-2,9,-2,0,-2,7,-2,9,-2,0,-2,-2,-2},
      {-2,0,-2,-2,-2,-2,-2,0,-2,0,-2,0,-2,-2,-2,0,-2,0,-2,-2,-2,0,-2,7,-2},
      {-2,0,-2,-2,-2,-2,-2,0,-2,0,-2,0,-2,-2,-2,0,-2,0,-2,-2,-2,0,-2,0,-2},
      {-2,0,-2,10,1,1,1,5,-2,9,-2,4,1,1,1,5,-2,4,1,1,1,5,-2,0,-2},
      {-2,0,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-3,-2,-2,0,-2},
      {-2,4,1,1,1,8,-2,10,1,1,1,1,8,-2,10,1,1,1,1,1,8,-2,10,5,-2}
  };
  
  // levelNum should range from 1-10
  public levels(int levelNum){
    if(levelNum == 1){
      selectedLevel = level1Map;
    }
  }
  
  public int[][] getLevel(){
    return selectedLevel;
  }
}
