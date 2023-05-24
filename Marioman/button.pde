public class button{
  static final int bLEFT = 0;
  static final int bRIGHT = 1;
  static final int bUP = 2;
  static final int bDOWN = 4;
  boolean [] inputs;
  
   public button() {
    inputs = new boolean[4];//4 valid buttons
  }

  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == LEFT)
      inputs[bLEFT] = true;
    if(code == RIGHT)
      inputs[bRIGHT] = true;
     if(code == DOWN)
      inputs[bDOWN] = true;
     if(code == UP)
     inputs[bUP] = true;
  }
  
  void release(int code) {
     if(code == LEFT)
      inputs[bLEFT] = false;
    if(code == RIGHT)
      inputs[bRIGHT] = false;
     if(code == DOWN)
      inputs[bDOWN] = false;
     if(code == UP)
     inputs[bUP] = false;
  }
}
  
  
