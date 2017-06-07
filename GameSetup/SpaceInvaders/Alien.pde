class Alien {
  int score;
  float speedx, speedy;
  color c;
  float x, y;
  int state = 0;
  int wid, len;

  //constructor
  Alien() {
    score = 10;
    speedx = 1;
    speedy = 5;
  }

  Alien(int points, float fastx, float fasty, float xcoor, float ycoor) {
    score = points;
    speedx = fastx;
    speedy = fasty;
    x = xcoor;
    y = ycoor;
    c = color(255, 255, 255);
    wid = 30;
    len = 15;
  }

  void display() {
    rect(x, y, wid, len);
    fill(c);
  }

  //how move
  void move() {
    x += speedx;
    if (state == 9) {
      if (x < 425 || x > 560) {
        y += speedy;
        speedx = speedx*(-1);
      }
    } else if (state == 8) {
      if (x < 380 || x > 515) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 7) {
      if (x < 335 || x > 470) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 6) {
      if (x < 290 || x > 425) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 5) {
      if (x < 245 || x > 380) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 4) {
      if (x < 200 || x > 335) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 3) {
      if (x < 155 || x > 290) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 2) {
      if (x < 110 || x > 245) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 1) {
      if (x < 65 || x > 200) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
    if (state == 0) {
      if (x < 20 || x > 155) {
        y += speedy;
        speedx = speedx*(-1);
      }
    }
  }

  //it ded
  void die() {
    wid = 0;
    len = 0;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  int getWid() {
    return wid;
  }

  int getLen() {
    return len;
  }

  void setState(int stet) {
    state = stet;
  }
  //e
}//end class