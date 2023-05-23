void setup(){
  background(0);
  size(810,810);
  stroke(0);
  square(0,0,30); //
 
 
 
    rect(390, 365, 30, 10);
    square(360, 360, 30);
    square(330, 360, 30);
    square(300, 360, 30);
    square(360, 450, 30);    
    square(330, 450, 30);
    square(300, 390, 30);
    square(300, 420, 30);
    square(300, 450, 30);   
    square(420, 360, 30);
    square(450, 360, 30);
    square(480, 360, 30);  
    square(390, 450, 30);
    square(420, 450, 30);
    square(450, 450, 30);
    square(480, 390, 30);
    square(480, 420, 30);
    square(480, 450, 30);
 for (int i = 0; i < 27; i++){
      square(i * 30, 0, 30);
      square(i * 30, 780, 30);
      square(0, i * 30, 30);
      square(780, i * 30, 30);
  }
}
