class Block {
  //inst vars
  int hits;
  color c;
  int score;
  int wid;
  int state;
  float x;
  float y;

  //constructor
  Block(int r, int g, int b, int point, float xcor, float ycor) {
    hits = 1;
    c = color(r, g, b);
    score = point;
    wid = 5;
    height = 3;
    state = random(2);
    x = xcor;
    y = ycor;
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
  void draw(){
    background(0);
    rect(x,y,wid,height);
  }//end draw
}//end class