class Block {
  //inst vars
  int hits;
  color c;
  int score;
  int wid;
  int len;
  int state;

  //constructor
  Block(int r, int g, int b, int point) {
    hits = 1;
    c = color(r, g, b);
    score = point;
    wid = 5;
    len = 3;
    state = random(2);
  }

  //checks if block has a cat inside
  boolean hasCat() {
    if(state == 0){
       return false; 
    }
    else{
       return true; 
    }
  }

  //how to die
  void die() {
    wid = 0;
    len = 0;
  }
}//end class