int curScreen = 0;
But but;
Catman cat;
SpaceInvaders space;

//final StringList usernames = new StringList( new String[] {"Eric", "Beth", "Katniss"});

void setup(){
  background(255, 255, 255);
  size(640,360);
  //player = new Player();
  but = new But();
  cat = new Catman();
  space = new SpaceInvaders();
  
  
}

void draw(){
  //display current screen
  if (curScreen == 0){
    gameSelectScreen();
  }
  else if (curScreen == 1){
    catManScreen();
  }
  else if (curScreen == 4){
    spaceScreen();
  }
}
 
 void keyPressed(){
   if (curScreen == 1){
     if (key == CODED) {
    if (keyCode == UP) {     
      if (cat.y < 0){
        cat.y = height;
      }  
      cat.y -= 10;
    } else if (keyCode == DOWN) {
    
      if (cat.y > height){
        cat.y = 0;
      }
      cat.y += 10;
    
    } else if (keyCode == LEFT) {
      if (cat.x < 0){
        cat.x = width;
      }
      cat.x -= 10;
     
    } else if (keyCode == RIGHT) {
      if (cat.x > width){
        cat.x = 10;
      }
      cat.x += 10;
    }  
  }
 
  }
  else if (curScreen == 4){
    if (key == CODED) {
    if (keyCode  == RIGHT && space.xcoor < 560) {
      //user = createShape(RECT, xcoor+2, 360, 30, 15);
      image(space.user, space.xcoor+3, 360, 30, 15);
      space.xcoor += 3;
      //user.setFill(color(0, 255, 0));
    }
    if (keyCode  == LEFT && space.xcoor > 20) {
      //user = createShape(RECT, xcoor-2, 360, 30, 15);
      image(space.user, space.xcoor-3, 360, 30, 15);
      space.xcoor -= 3;
      //user.setFill(color(0, 255, 0));
    }
  }
  if (key == ' ') {
    Bullet pew = new Bullet(2, space.xcoor+20, 360, 0);
    space.bullets.add(pew);
  }
  }
  
 }
     
 void mousePressed() {
  //If user selects Catman on Game Selection Screen
  if (curScreen == 0 && but.but1Over) {
    //Switch to Catman screen
    cat = new Catman();
    curScreen = 1;   
  }
  
  else if (curScreen == 0 && but.but2Over){
    space = new SpaceInvaders();
    curScreen = 4;
  }
  else if ((curScreen == 2 || curScreen == 3) && cat.dogeOver()){
    cat = new Catman(); //reset
  }
  else if ((curScreen == 2 || curScreen == 3) && cat.but1Over()){
    curScreen = 0;
  }
  else if ((curScreen == 2 || curScreen == 3) && cat.but2Over()){
    exit();
  }
 }
    
    
  

 

void gameSelectScreen(){
     but.drawBut();
}

void catManScreen(){
  cat.drawCat();
}
  
void spaceScreen(){
  space.drawSpace();
}
 