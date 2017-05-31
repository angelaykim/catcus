/*
*/

class Catari implements GameScreen{
  Block blocks [];
  Ball playingBall = new Ball();
  int numBalls;
  int lives;
  int score;
  int currHS;
  Catari(){
    lives = 5;
    score = 0;
    currHS = 0;
  }//end empty constructor
  Catari(int lifes, int scores, int currHSs){
    lives = lifes;
    score = scores;
    currHS = currHSs;
  }//end overloaded constructor
  void die(){
    if(playingBall.ypos <= 0){
      playingBall.shrink();
      lives -= 1;
    }
  }//end die method
  void resurrect(){
    if(lives > 0 && numBalls == 0){
      
    }
  }//end resurrect method
  void hitBlock(){
    
  }
}//end class