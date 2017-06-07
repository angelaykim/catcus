class Platform{
  //inst vars
  int len;
  int heit;
  color c;
  float x;
  float y;

  Platform() {
    len = 100;
    heit = 25;
    c = (212);
    x = width/2.0;
    y = 300.0;
  }//end of constructor
  void display() {
    x = constrain(mouseX, len/2, width - (len/2));
    rectMode(CENTER);
    noStroke();
    fill(c);
    rect(x, y, len, heit);
  }//end of display method

  float corner(String a) {
    if (a == "left") {
      return x - (len/2.0);
    } else if (a == "right") {
      return x + (len/2.0);
    } else if (a == "top") {
      return y - (5.0);
    } else {
      return 0.0;
    }
  }//end of corner method
}//end of class Platform