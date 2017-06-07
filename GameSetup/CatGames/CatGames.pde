int curScreen = 0;
But but;
Catman cat;

//final StringList usernames = new StringList( new String[] {"Eric", "Beth", "Katniss"});

void setup(){
  background(255, 255, 255);
  size(640,360);
  //player = new Player();
  but = new But();
  cat = new Catman();
  
  
}

void draw(){
  //display current screen
  if (curScreen == 0){
    gameSelectScreen();
  }
  else if (curScreen == 1){
    catManScreen();
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
  
 }
     
 void mousePressed() {
  //If user selects Catman on Game Selection Screen
  if (curScreen == 0 && but.but1Over) {
    //Switch to Catman screen
    cat = new Catman();
    curScreen = 1;   
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
  
 