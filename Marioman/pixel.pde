public class pixel{
  private int x;
  private int y;
  public int identifier = -1; // default for an empty space
  private static final int SPACE = 6;
  private static final int VWALL = -1;
  private static final int HWALL = 1;
  private static final int TLCORNER = 2;
  private static final int TRCORNER = 3;
  private static final int BLCORNER = 4;
  private static final int BRCORNER = 5;
  private static final int COIN = 0; // every empty space starts off as a coin (per pacman game)
  private static final int POWER = 7; // scattered in corners of the maps
  private PImage COINimg;
  private PImage POWERimg;
  
  public pixel(int x1, int y1){
    this.x = x1;
    this.y = y1;
  }
  
// ==============================================================================================================

  public void drawPixel(){
    fill(0);
    strokeWeight(1);
    stroke(255);
    square(x,y,27); // FOR TESTING PURPOSES, to easily visualize the pixels
    if(identifier == VWALL){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x+4,y,4,27);
      rect(x+19,y,4,27);
    }
    if(identifier == HWALL){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x,y+4,27,4);
      rect(x,y+19,27,4);
    }
    if(identifier == TLCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x+30,y+6,x+6,y+30);
      line(x+30,y+21,x+21,y+30);
    }
    if(identifier == TRCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x,y+6,x+21,y+30);
      line(x,y+21,x+6,y+30);
    }
    if(identifier == BLCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x+6,y,x+30,y+21);
      line(x+21,y,x+30,y+6);
    }
    if(identifier == BRCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x+6,y,x,y+6);
      line(x+21,y,x,y+21);
    }
    if(identifier == COIN){
      //COINimg = loadImage("Coin.png");
      //image(COINimg,x+7,y+7,15,15);
      fill(255);
      square(x+7, y+7, 5);
    }
    if(identifier == POWER){
      POWERimg = loadImage("Power.png");
      image(POWERimg,x+4.5,y+4.5,20,20);
    }
  }
}
