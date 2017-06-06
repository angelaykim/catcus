color black = color(0);
color green = color(110, 212, 111);
color pink = color(190, 81, 163);
color purple = color(97, 81, 190);
color blue = color(142, 185, 234);
color yellow = color(212, 197, 110);
Block[][] blocks = new Block[5][5]; 
Block[] pinkOnes = new Block[5];
Block[] blueOnes = new Block[5];
Block[] yellowOnes = new Block[5];
Block[] greenOnes = new Block[5];
Block[] purpleOnes = new Block[5];
GameSetup game;
Ball playingBall;
Platform playingPlat;


void setup() {
  size(640, 360);
  frameRate(80);
  game = new GameSetup();
  playingBall = new Ball(320, 180);
  playingPlat = new Platform();
  for (int x = 0; x < 4; x++) {
    pinkOnes[x] = new Block(x * 128, 20, pink);
    blueOnes[x] = new Block(x * 128, 40, blue);
    yellowOnes[x] = new Block(x * 128, 60, yellow);
    greenOnes[x] = new Block(x * 128, 80, green);
    purpleOnes[x] = new Block(x * 128, 100, purple);
  }//initiates all the different blocks
  for (int x = 0; x < blocks.length - 1; x++) {
    blocks[x][0] = pinkOnes[x];
    blocks[x][1] = blueOnes[x];
    blocks[x][2] = yellowOnes[x];
    blocks[x][3] = greenOnes[x];
    blocks[x][4] = purpleOnes[x];
  }
}//end setup


void draw() {
  background(black);
  game.makeBlocks(blocks);
  playingBall.display();
  playingPlat.display();
  if (playingBall.dead() == false) {
    playingBall.move(playingBall);
  }
  if (playingBall.dead() == true) {
    game.stillPlaying = false;
  }
  if (playingBall.hitBlock()) {
    //Block blockHit = game.whichBlock(playingBall, blocks);
    if (blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].isAlive == true) {
      blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].die();
      playingBall.bounceBlock(blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)]);
      if (blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].c == pink) {
        game.addPoints(10);
      } else if (blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].c == blue) {
        game.addPoints(20);
      } else if (blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].c == yellow) {
        game.addPoints(30);
      } else if (blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].c == green) {
        game.addPoints(40);
      } else if (blocks[game.rowFinder(playingBall)][game.colFinder(playingBall)].c == purple) {
        game.addPoints(50);
      }
    }
  }
  if (playingBall.hitPlat(playingPlat) == true) {
    playingBall.bouncePlat(playingPlat);
  }
}//end of draw