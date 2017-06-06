class Block {
  //inst vars
  int hits;
  color c;
  int score;
  int wid;
  int high;
  int state;
  int x;
  int y;
  boolean isAlive;

  Block(int xcor, int ycor, color calor) {
    hits = 1;
    c = calor;
    wid = 128;
    high = 20;
    x = xcor;
    y = ycor;
  }//end of constructor


  //checks if block has a cat inside
  boolean hasCat() {
    if (state == 0) {
      return false;
    } else {
      return true;
    }
  }//end of hasCat method

  void display() {
    rectMode(CORNER);
    stroke(0);
    fill(c);
    rect(x, y, wid, high);
  }//end of display method

  void die() {
    isAlive = false;
    c = 0;
  }//end of die method
}//end class