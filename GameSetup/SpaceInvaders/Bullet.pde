class Bullet {
  int wid;
  int len;
  color c;
  int speed;
  float x, y;
  int state = 0;

  //constructor
  Bullet(int fast, float xcoor, float ycoor, int stat) {
    wid = 4;
    len = 8;
    x = xcoor;
    y = ycoor;
    state = stat;
    c = color(#942525);
    speed = fast;
  }

  void display() {
    rect(x, y, wid, len);
    fill(c);
  }

  //it ded
  void die() {
    wid = 0;
    len = 0;
  }
  
  void move(){
    y -= speed;
  }  
  
  float getX(){
   return x; 
  }
  
  float getY(){
   return y; 
  }
  
  int getState(){
     return state; 
  }
}//end class