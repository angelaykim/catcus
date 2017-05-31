class Platform{
  //inst vars
  int len = 60;
  color c;
  float x;
  float y;
/*void setup(){
  size(640, 360);
  strokeWeight(20.0);
  stroke(255,100);
}
*/
  void draw(){
    background(0);
    x = mouseX;
    y = 300.0;
    createPlatform(x,y);
    //ellipse(x,y,20,20);
  }
  void createPlatform(float x, float y){
    pushMatrix();
    translate(x,y);
    rotate(0);
    line(0,0, len, 0);
    popMatrix();
  }
  void growLarger(float howMuchLarger){
    createPlatform(x + howMuchLarger, y);
  }
  void growSmaller(float howMuchSmaller){
    createPlatform(x + howMuchSmaller, y); 
  }
}//end class