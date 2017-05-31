/*
*/
class Catari implements GameScreen{
  Block[] blocks;
  Ball playingBall = new Ball();
  Platform playingPlat;
  int numBalls;
  int lives;
  int score;
  int currHS;
  Catari(){
    lives = 5;
    score = 0;
    currHS = 0;
    numBalls = 0;
    blocks = new Block[0];
    playingPlat = new Platform();
  }//end empty constructor
  Catari(int lifes, int scores, int currHSs, int numBallss, Block[] blockss, Platform playingPlats){
    lives = lifes;
    score = scores;
    currHS = currHSs;
    numBalls = numBallss;
    blocks = blockss;
    playingPlat = playingPlats;
  }//end overloaded constructor
  boolean isDead(){
    if(playingBall.state == 1);
  }//end method isDead
  void resurrect(){
    if((lives > 0) && (numBalls == 0)){
      Ball newBall = new Ball(2, playingPlat.xpos, playingPlat.ypos, 3.5, 3.5, 1, 1, 0);
      lives -=1;
    }
  }//end resurrect method
  void hitBlock(){
    
  }
  /* HITTING NORMAL BLOCKS */
  boolean ifHitNorm(){
    
  }//end of method ifHitNorm
  /* END OF HITTING NORMAL BLOCKS */
  
  /* MAKE BALL LARGER BLOCKS */
  boolean ifHitMakeLarger(){
    makeLarger();
  }//end of method ifHitMakeLarger
  void makeLarger(){
    playingBall.enlarge();
  }//end of method makeLarger
  /* END OF MAKE BALL LARGER BLOCKS */
  
  /* MAKE BALL SMALLER BLOCKS */
  boolean ifHitMakeSmaller(){
    makeSmaller();
  }//end of method ifHitMakeSmaller
  void makeSmaller(){
    playingBall.shrink();
  }//end of method makeSmaller
  /* END OF MAKE BALL SMALLER BLOCKS*/
  
  /* CREATE MORE BLOCKs */
  boolean ifHitCreateMoreBlock(){
    createMore();
  }//end of method ifHitCreateMoreBlock
  void createMore(){
    Ball extraBall = new Ball(playingBall.radius, playingPlat.xpos, playingPlat.ypos, playingBall.xspeed, playingBall.yspeed, playingBall.xdirection, playingBall.ydirection, 0);
  }//end of method createMore
  boolean moreThanOne(){
    return false;
  }//end of method moreThanOne
  /* END OF CREATE MORE BLOCKS */
  
}//end class