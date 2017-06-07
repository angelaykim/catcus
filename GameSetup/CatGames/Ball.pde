class Ball {
  int rad;
  float xpos, ypos;
  float xspeed, yspeed;
  int xdirection, ydirection;
  int state; //0 is default (alive, default size), 1 is dead (dead, not on the screen), 2 is being enlarged(alive, bigger), 3 is being shrunk(alive, smaller)
  Ball(float xcor, float ycor) {
    rad = 30;
    xspeed = 3.5;
    yspeed = 3.5;
    xdirection = 1;
    ydirection = 1;
    state = 1;
    xpos = xcor;
    ypos = ycor;
  }//constructor 

  void display() {
    noStroke();
    fill(190, 81, 163);
    ellipse(xpos, ypos, rad, rad);
  }
  void move(Ball a) {
    xpos = xpos +(xspeed * xdirection);
    ypos = ypos +(yspeed * ydirection);
    if (a.ypos < 0) {
      yspeed *= -1;
    }
    if (a.xpos < 0 || a.xpos > 640) {
      xspeed *= -1;
    }
  }//end of method move
  boolean hitBlock() {
    if (ypos >= 100) {
      return true;
    } else {
      return false;
    }
  }//end of method hitBlock
  void bounceBlock(Block a) {
    float[] centerPoint = {a.x + a.wid/2, a.y + a.high};
    float yDistance = dist(xpos, ypos, xpos, centerPoint[1]);
    if (yDistance >= 20) {
      ydirection *= -1;
    }
    float xDistance = dist(xpos, ypos, centerPoint[0], ypos);
    if (xDistance >= 128) {
      xdirection *= -1;
    }
  }//end of method bounceBlock

  boolean hitPlat(Platform a) {
    if (ypos > a.corner("top")  && xpos > a.corner("left") && xpos < a.corner("right")) {
      return true;
    } else {
      return false;
    }
  }//end of method hitPlat
  void bouncePlat(Platform a) {
    ydirection *= -1;
    xdirection *= -1;
    xspeed = (dist(xpos, a.y, a.x, a.y)) * .05;
  }//end of method bouncePlat

  boolean dead() {
    if (ypos > height) {
      return true;
    } else {
      return false;
    }
  }//end of method dead
}//end of class ball