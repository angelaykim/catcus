/*
*/
Block[] blocks;
Ball playingBall = new Ball();
Platform playingPlat;
Ball newBall = new Ball();
Ball extraBall = new Ball();
float[] holdXCor;
float[] holdYCor;
int numBalls;
int lives;
int score;
int currHS;
void setup() {
  size(640, 360);
  lives = 5;
  score = 0;
  currHS = 0;
  numBalls = 0;
  blocks = new Block[0];
  playingPlat = new Platform();
  for (int z = 0; z < blocks.length; z ++) {


    for (float i = 0; i < 640; i += 5.0) {
      holdXCor[z] = i;
    }//goes through to find the x coordinate for the block


    for (float f = 0; f < 360; f += 3.0) {
      holdYCor[z] = f;
    }//goes through to find the y coordinate for the blocks

    for (int p = 0; p < holdXCor.length; p ++) {
      blocks[z] = new Block(0, 0, 0, 50, holdXCor[p], holdYCor[p]);
    }
  }//gives the blocks properties
}//end setup
/*Catari(int lifes, int scores, int currHSs, int numBallss, Block[] blockss, Platform playingPlats) {
 lives = lifes;
 score = scores;
 currHS = currHSs;
 numBalls = numBallss;
 blocks = blockss;
 playingPlat = playingPlats;
 }//end overloaded constructor*/

/* Draw Blocks on the Screen*/
void draw() {
  stroke(255);
  background(0);
  for(Block bluck: blocks){
    bluck.display();
  }
}//end of draw
boolean isDead() {
  return false;
  /*if (playingBall.state == 1){
   retBool = true;
   }
   return retBool;*/
}//end method isDead
void resurrect() {
  if ((lives > 0) && (numBalls == 0)) {
    newBall = new Ball(2, playingPlat.x, playingPlat.y, 3.5, 3.5, 1, 1, 0);
    lives -=1;
    numBalls = 1;
  }
}//end resurrect method
void hitBlock() {
}//end of method hitBlock

/* HITTING NORMAL BLOCKS */
boolean ifHitNorm() {
  return true;
}//end of method ifHitNorm
/* END OF HITTING NORMAL BLOCKS */

/* MAKE BALL LARGER BLOCKS */

boolean ifHitMakeLarger() {
  makeLarger();
  return true;
}//end of method ifHitMakeLarger
void makeLarger() {
  playingBall.enlarge();
}//end of method makeLarger
/* END OF MAKE BALL LARGER BLOCKS */

/* MAKE BALL SMALLER BLOCKS */
boolean ifHitMakeSmaller() {
  makeSmaller();
  return true;
}//end of method ifHitMakeSmaller
void makeSmaller() {
  playingBall.shrink();
}//end of method makeSmaller
/* END OF MAKE BALL SMALLER BLOCKS*/

/* CREATE MORE BLOCKs */
boolean ifHitCreateMoreBlock() {
  createMore();
  return true;
}//end of method ifHitCreateMoreBlock
void createMore() {
  extraBall = new Ball(playingBall.rad, playingPlat.x, playingPlat.y, playingBall.xspeed, playingBall.yspeed, playingBall.xdirection, playingBall.ydirection, 0);
  //numBalls > 1;
  numBalls += 1;
}//end of method createMore
boolean moreThanOne() {
  return false;
}//end of method moreThanOne
/* END OF CREATE MORE BLOCKS */

//}//end class