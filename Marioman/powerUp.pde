public class powerUp{
  private String[] p = new String [4];
  
  public powerUp(){
    p[0] = "boost"; //player moves faster
    p[1] = "god"; //player can not be killed by ghost
    p[2] = "teleport"; //player teleports to another location
    p[3] = "ghost"; //the ghosts are reset to their starting location
  }
  
  public void shufflePower(){//randomly mix powerUps
   for(int i = 0; i < 4; i++){
     int ind = (int)random(4); 
     String temp = p[i]; 
     p[i] = p[ind]; 
     p[ind]= temp; 
    }
  }
  
  public String getPower(int index){
    return p[index];
  }
}


  
  
  
