class Ball {
  int rad;
  float xpos, ypos;
  float xspeed, yspeed;
  int xdirection, ydirection;

  //constructor
  Ball() {
    rad = 2;
    xpos = 0;
    ypos = 0;
    xspeed = 3.5;
    yspeed = 3.5;
    xdirection = 1;
    ydirection = 1;
  }
  //overloaded
  Ball(int radius, float xposition, float yposition, float xvelocity, float yvelocity, int xdirect, int ydirect) {
    Ball magicBall = new Ball();
    rad = radius;
    xpos = xposition;
    ypos = yposition;
    xspeed = xvelocity;
    yspeed = yvelocity;
    xdirection = xdirect;
  }
  void draw() {
    ellipse(xpos, ypos, rad, rad);
    xpos = xpos +(xspeed * xdirection);
    ypos = ypos +(yspeed * ydirection);
    if (xpos > width-rad || ypos < rad) {
      xdirection *= -1;
    }
    if (ypos > height-rad || ypos < rad) {
      ydirection *= -1;
    }
  }
  void shrink(){
    
  }//end shrink method
  void bounceBack(){
    
  }//end bounceBack method
}