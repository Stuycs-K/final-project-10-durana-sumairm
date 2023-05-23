public class pixel{
  private int x;
  private int y;
  public int identifier = -1; // default for an empty space
  private static final int SPACE = -1;
  private static final int VWALL = 0;
  private static final int HWALL = 1;
  private static final int TLCORNER = 2;
  private static final int TRCORNER = 3;
  private static final int BLCORNER = 4;
  private static final int BRCORNER = 5;
  private static final int COIN = 6; // every empty space starts off as a coin (per pacman game)
  private static final int POWER = 7; // scattered in corners of the maps
  public pixel(int x1, int y1){
    this.x = x1;
    this.y = y1;
  }
  public void drawPixel(){
    if(identifier == VWALL){
      stroke(#2121DE);
      fill(#2121DE);
      rect(x+4,y,4,27);
      rect(x+19,y,4,27);
    }
    if(identifier == HWALL){
      stroke(#2121DE);
      fill(#2121DE);
      rect(x,y+4,27,4);
      rect(x,y+19,27,4);
    }
  }
  
  //public void startCenter(){
  // rect(390, 365, 30, 10);
  //  square(360, 360, 30);
  //  square(330, 360, 30);
  //  square(300, 360, 30);
  //  square(360, 450, 30);    
  //  square(330, 450, 30);
  //  square(300, 390, 30);
  //  square(300, 420, 30);
  //  square(300, 450, 30);   
  //  square(420, 360, 30);
  //  square(450, 360, 30);
  //  square(480, 360, 30);  
  //  square(390, 450, 30);
  //  square(420, 450, 30);
  //  square(450, 450, 30);
  //  square(480, 390, 30);
  //  square(480, 420, 30);
  //  square(480, 450, 30);
  //}
  
  //public void borders(){
  //  for (int i = 0; i < 27; i++){
  //    square(i * 30, 0, 30);
  //    square(i * 30, 780, 30);
  //    square(0, i * 30, 30);
  //    square(780, i * 30, 30);
  //}
  //}
}
