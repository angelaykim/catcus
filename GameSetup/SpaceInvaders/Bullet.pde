class Bullet {
  int wid;
  int len;
  color c;
  int speed;
  float x, y;

  //constructor
  Bullet(int fast, float xcoor, float ycoor) {
    wid = 4;
    len = 8;
    x = xcoor;
    y = ycoor;
    c = color(255, 255, 255);
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
}//end class