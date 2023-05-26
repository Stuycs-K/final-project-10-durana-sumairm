public class powerUp{
  private String[] p = new String [4];
  
  public powerUp(){
    p[0] = "speed"; //player moves faster
    p[1] = "god"; //player can not be killed by ghost
    p[2] = "teleport"; //player teleports to another location
    p[3] = "ghost"; //the ghosts are reset to their starting location
  }
  
  public String getPower(){//randomly pick a powerUp
    int ind = int(random(0,4));
    return p[ind];
  }

}

  
  
  
