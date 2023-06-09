public class pixel{
  private int x;
  private int y;
  private int centerX;
  private int centerY;
  public int identifier = -1; // default for an empty space
  private static final int SPACE = -1;
  private static final int VWALL = 0;
  private static final int HWALL = 1;
  private static final int TLCORNER = 2;
  private static final int TRCORNER = 3;
  private static final int BLCORNER = 4;
  private static final int BRCORNER = 5;
  private static final int BLOCK = 6;
  private static final int tEND = 7;
  private static final int rEND = 8;
  private static final int bEND = 9;
  private static final int lEND = 10;
  private static final int INVISWALL = 100; //for the ghost entrance/exit
  private static final int COIN = -2; // every empty space starts off as a coin (per pacman game)
  private static final int POWER = -3; // scattered in corners of the maps
  private PImage COINimg;
  private PImage POWERimg;
  
  public pixel(int x1, int y1){
    this.x = x1;
    this.y = y1;
    centerX = this.x+15;
    centerY = this.y+15;
  }
  
  public String toString(){
    return centerX + " " + centerY;
  }
  
// ==============================================================================================================

  public void drawPixel(){
    fill(0);
    strokeWeight(1);
    stroke(255);
    //square(x,y,30); // FOR TESTING PURPOSES, to easily visualize the pixels
    if(identifier == VWALL){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x+4,y,4,30);
      rect(x+22,y,4,30);
    }
    if(identifier == HWALL){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x,y+4,30,4);
      rect(x,y+22,30,4);
    }
    if(identifier == TLCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x+30,y+6,x+6,y+30);
      line(x+30,y+24,x+24,y+30);
    }
    if(identifier == TRCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x,y+6,x+24,y+30);
      line(x,y+24,x+6,y+30);
    }
    if(identifier == BLCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x+6,y,x+30,y+24);
      line(x+24,y,x+30,y+6);
    }
    if(identifier == BRCORNER){
      stroke(#2121DE);
      strokeWeight(6);
      line(x+6,y,x,y+6);
      line(x+24,y,x,y+24);
    }
    if(identifier == BLOCK){
      stroke(#2121DE);
      strokeWeight(6);
      fill(0);
      square(x+5,y+5,20);
    }
    if(identifier == tEND){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x+4,y,4,30);
      rect(x+22,y,4,30);
      rect(x+4,y,22,4);
    }
    if(identifier == rEND){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x,y+4,30,4);
      rect(x,y+22,30,4);
      rect(x+26,y+4,4,22);
    }
    if(identifier == bEND){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x+4,y,4,30);
      rect(x+22,y,4,30);
      rect(x+4,y+26,22,4);
    }
    if(identifier == lEND){
      stroke(#2121DE);
      strokeWeight(1);
      fill(#2121DE);
      rect(x,y+4,30,4);
      rect(x,y+22,30,4);
      rect(x,y+4,4,22);
    }
    
    if(identifier == COIN){
      fill(#FAE73A);
      stroke(#B9AD36);
      square(x+11.5, y+11.5, 7);
      fill(#E3CC59);
      stroke(255);
      rect(x+12.5, y+12.5, 1, 3);
    }
    if(identifier == POWER){
      POWERimg = loadImage("Power.png");
      imageMode(CORNER);
      image(POWERimg,x+4.5,y+4.5,20,20);
    }
  }
 
}
