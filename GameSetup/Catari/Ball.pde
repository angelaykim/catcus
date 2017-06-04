class Ball {
  int rad;
  float xpos, ypos;
  float xspeed, yspeed;
  int xdirection, ydirection;
  int state; //0 is default (alive, default size), 1 is dead (dead, not on the screen), 2 is being enlarged(alive, bigger), 3 is being shrunk(alive, smaller)

  //constructor
  Ball() {
    rad = 2;
    xpos = 0;
    ypos = 0;
    xspeed = 3.5;
    yspeed = 3.5;
    xdirection = 1;
    ydirection = 1;
    state = 1;
  }
  //overloaded
  Ball(int radius, float xposition, float yposition, float xvelocity, float yvelocity, int xdirect, int ydirect, int stat){
    rad = radius;
    xpos = xposition;
    ypos = yposition;
    xspeed = xvelocity;
    yspeed = yvelocity;
    xdirection = xdirect;
    ydirection = ydirect;
    state = stat;
  }
  void draw() {
    ellipse(xpos, ypos, rad, rad);
    xpos = xpos +(xspeed * xdirection);
    ypos = ypos +(yspeed * ydirection);
    if (xpos > width-rad || ypos < rad) {
      xdirection *= -1;
    }
    /*if (ypos > height-rad || ypos < rad) {
      ydirection *= -1;
    }
    */
  }
  void shrink(){
    
  }//end shrink method
  void enlarge(){
    
  }//end enlarge method
  void bounceBack(){
    
  }//end bounceBack method
  void die(Ball magicBall){
    if(magicBall.ypos <= 0){
    magicBall.shrink();
    state = 1;
    }
  }//end die method
}