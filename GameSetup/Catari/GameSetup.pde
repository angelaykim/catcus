class GameSetup {
  int score;
  int level;
  boolean stillPlaying;
  GameSetup() {
    score = 0;
    level = 1;
    stillPlaying = false;
  }//end of empty constructor

  void addPoints(int a) {
    score += a;
  }//end of method addPoints

  int rowFinder(Ball a) {
    float y = a.ypos;
    int row = 0;
    if (y >= 0 && y <=  128) { 
      row = 0;
    } else if (y > 128 && y <=  256) { 
      row = 1;
    } else if (y > 256 && y <=  384) { 
      row = 2;
    } else if (y > 384 && y <=  512) { 
      row = 3;
    } else if (y > 512 && y <= 640) { 
      row = 4;
    } else {
      row = 0;
    }
    return row;
  }//end of method rowFinder
  int colFinder(Ball a) {
    float x = a.xpos;
    int col = 0;
    if (x >=  0 && x <=  72) { 
      col = 0;
    } else if (x >  72 && x <=  144) { 
      col = 1;
    } else if (x >  144 && x <= (72 *3)) { 
      col = 2;
    } else if (x > (72 * 3) && x <= (72 * 4)) { 
      col = 3;
    } else if (x > (72 * 4) && x <= (72 * 5)) { 
      col = 4;
    } else {
      col = 0;
    }
    return col;
  }//end of method rowFinder

  Block whichBlock(Ball a, Block[][] b) {
    int row = rowFinder(a);
    int col = colFinder(a);
    return b[a][b];
  }//end of method whichBlock

  Block whichBlock(Ball a, Block[][] b) {
  }//end of method whichBlock
  void makeBlocks(Block[][] a) {
    for (int y = 0; y < a.length - 1; y ++) {
      for (int x = 0; x < a[y].length - 1; x ++) {
        a[y][x].display();
      }
    }//end of method makeBlocks
  }//end of class BeginPlay