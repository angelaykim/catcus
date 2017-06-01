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
  
  /* Draw Blocks on the Screen*/
  void draw(){
    for(int x = 0; x < blocks.length(); x ++){
      setHits(blocks[x], random(51));
      setColor(blocks[x], random(0,1)
      setScore(blocks[x], random(501))
    }//gives the blocks properties
    
    
    for(int z = 0; z < blocks.length(); z ++){
      for(int i = 0; i < 640; i += 5){
        blocks[z].x = i;
      }//goes through to find the x coordinate for the block
      for(int f = 0; f < 360; f += 3){
        blocks[z].y = f;
      }//goes through to find the y coordinate for the blocks
    }
  }//end of draw
  /* End of Blocks */
  
  
  boolean isDead(){
    if(playingBall.state == 1);
  }//end method isDead
  void resurrect(){
    if((lives > 0) && (numBalls == 0)){
      Ball newBall = new Ball(2, playingPlat.xpos, playingPlat.ypos, 3.5, 3.5, 1, 1, 0);
      lives -=1;
      numBall = 1;
    }
  }//end resurrect method
  void hitBlock(){
    
  }//end of method hitBlock
  
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
    Ball extraBall = new Ball(playingBall.radius, playingPlat.x, playingPlat.y, playingBall.xspeed, playingBall.yspeed, playingBall.xdirection, playingBall.ydirection, 0);
    moreThanOne() = true;
    numBall += 1;
  }//end of method createMore
  boolean moreThanOne(){
    return false;
  }//end of method moreThanOne
  /* END OF CREATE MORE BLOCKS */
  
}//end class