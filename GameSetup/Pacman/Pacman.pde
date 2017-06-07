//import images
PImage img, img2, img3, img4; 

int dotNum = 20; 
int dogNum = 1;
int lives = 3;
int screen = 0; 

float imgSize = 40; 
float x = 320; 
float y = 180;            
float dogVx = random(-10, 10);
float dogVy = random(-10, 10); 
float dogX = random(imgSize, width-imgSize);              
float dogY = random(imgSize, height-imgSize);

ArrayList<Dots> dotList = new ArrayList();
ArrayList<Dogs> dogList = new ArrayList();
  
//continue to display cat and everything?
boolean contDis = true; 

void setup(){
  
  //used for restart
  dotNum = 20;
  lives = 3;
  dogX = random(imgSize, width-imgSize); 
  dogY = random(imgSize, height-imgSize);   
  dogVx = random (-10, 10);
  dogVy = random (-10, 10); 
  contDis = true; 
  
  background(0);
  size(640, 360);
  ellipseMode(RADIUS);
  
  //Create dots (mice)
  for (int i = 0; i < dotNum; i ++){ 
    Dots d = new Dots((int)random(imgSize, width-imgSize), (int)random(imgSize+30, height-imgSize)); 
    
    //random() returns float --> needs to be converted to int
    //and limit it within the size of the world
    
    dotList.add(d); //add newly created dots
  }
  
  //Create dogs 
  for (int u = 0; u < dogNum; u ++){
    Dogs dog = new Dogs();
    dogList.add(dog);
  }
    
  img = loadImage("cat.png");
  img2 = loadImage("moumou.png");
  img3 = loadImage("bub.png");
  img4 = loadImage("doge.gif");
}

void draw(){
  background(0);
  textAlign(CENTER);

      //End this screen and switch to disScreen if cat is dead or cat wins
  if (lives <= 0 || (20-dotNum >= 20)){
    contDis = false;
  }
  
  if (contDis){
    

    
  //Import cat images
  image(img, x, y, imgSize+5, imgSize+5); 
  
  //Display randomly scatterd mice
  disMice();
  
  //Display bouncing-around doge 
  disDog();

  //Display text bubbles according to number of mice caught
  textBub(); 

  //Display status bar on the top
  bar();
 
  
  }
  
  //Cat-Mice Display ended --> Switch screens
  else{ 
    if (lives <= 0){
      image(img4, 200, 50, imgSize * 7, imgSize * 7);
      dieScreen(); 
    }
    else{
      winScreen();
    }
  }
}

  
 
void mousePressed() {
  if (screen == 1 && dogeOver()) {
    //restart the game (reset vars, including contDis)
    setup(); 
  }
  
  //Since buttons on screen 1 and 2 are at the same location
  //They can be put into the same if statment
  
  else if ((screen == 1 || screen == 2)&& but1Over()){
    //gsScreen();
  }
  else if ((screen == 1 || screen == 2) && but2Over()){ 
    exit();
  }
}

  
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {     
      if (y < 30){
        y = height;
      }  
      y -= 10;
    } else if (keyCode == DOWN) {
    
      if (y > height){
        y = 0;
      }
      y += 10;
    
    } else if (keyCode == LEFT) {
      if (x < 0){
        x = width;
      }
      x -= 10;
     
    } else if (keyCode == RIGHT) {
      if (x > width){
        x = 10;
      }
      x += 10;
    }  
  }
 
  }
  
 

//================================ Other methods

//================= dieScreen() Display die screen (cat loses)
void dieScreen(){
  screen = 1;
  background(250,128,114);
  image(img4, 160, 50, imgSize * 7, imgSize * 7);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Losing to a Doge So Cute is Your Honor.", width/2, 30);
  
  textSize(10);
  text("Click My Face to Restart.", width/2 - 15, height - 15);
  
  fill(255);
  rect(10, 100, 180, 30);
  
  fill(0);
  textAlign(LEFT);
  textSize(15);
  text("Game Selection Screen", 20, 120);
  
  fill(255);
  rect(455, 100, 175, 30);
  
  fill(0);
  textAlign(LEFT);
  textSize(15);
  text("Say Goodbye to Doge", 465, 120);
  
}
  
//================= winScreen() Display win screen (cat wins) 
void winScreen(){
  screen = 2;
  background(250,128,114);
  image(img, 160, 50, imgSize * 7, imgSize * 7);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("You Have Caught All 20 Mice! Congrats!", width/2, 30);
  
  textSize(10);
  text("Click My Face to Restart.", width/2 - 15, height - 15);
  
  fill(255);
  rect(10, 100, 180, 30);
  
  fill(0);
  textAlign(LEFT);
  textSize(15);
  text("Game Selection Screen", 20, 120);
  
  fill(255);
  rect(455, 100, 175, 30);
  
  fill(0);
  textAlign(LEFT);
  textSize(15);
  text("Say Goodbye to Cat", 465, 120);
}

//================= textBub() Display text bubbles
void textBub(){
  if (lives > 0){
   //Display text according to number of mice caught
  if ( 20 - dotNum >= 3 && 20 - dotNum < 5){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255);
    text("I am so hungry.", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 6 && 20 - dotNum < 8){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255);
    text("Yum...Some more!", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 9 && 20 - dotNum < 11){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255);
    text("These mice are cute!", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 12 && 20 - dotNum < 14){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255);
    text("Stupid dog...Haha!", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 18 && 20 - dotNum < 20){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255);
    text("I am so full!", x+77, y-30);
  }
  }
}

//================= bar() Display status bar 
void bar(){
  //Display white block on the top
  fill(255);
  rect(-1, -1, width+1, 30);
  
  
  //Display number of mice caught 
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("Number of Mice Caught: " + str(20 - dotNum), 10, 20);
  

  //Display number of mice caught as rectangular block
  //frame block
  fill(255);
  rect(220, 10, 20 * 10, 10);
  
  int leng = 20 - dotNum;
  
  //color gradient: light --> deep
  if (leng <= 5 && leng >= 0){
    fill(255, 204, 204);
  }
  else if (leng > 5 && leng <= 10){
    fill(255, 128, 128);
  }
  else if (leng > 10 && leng <= 15){
    fill(255, 51, 51);
  }
  else if (leng > 15){
    fill(230, 0, 0);
  }
  
  //color block
  rect(220, 10, leng * 10, 10);
  
  
  //Display number of mice caught 
  fill(0);
  textSize(15);
  textAlign(RIGHT);
  text("Lives: ", width - 130, 20);
  
  //Display lives as rectangular block
  //frame block
  fill(255);
  rect(width - 130, 10, 3 * 40, 10);
  
  //color block
  fill(255, 20, 40);
  rect(width - 130, 10, lives * 40, 10);
}

//================= disDog() Display dog
void disDog(){
  //Display doge
  for (int u = 0; u < dogNum; u ++){
    Dogs d = dogList.get(u);
    d.Wander();
    
    //If cat collides with dog 
    //--> lives decreases by 1
    //--> cat teleported to the center to avoid dog
    
    if (dist(dogX, dogY, x, y) < imgSize){
      lives --;
      image(img3, x+20, y-70,imgSize+75, imgSize+40);
      textSize(10);
      fill(255);
      text("OUCH!", x+77, y-30);
      x = dogX - 100;
      y = dogY - 100;
      delay(500);  
    }
    
  }
}

//================= disMice() Display mice
void disMice(){
  //Display dotNum of mice
  for (int i = 0; i < dotNum; i ++){
    Dots ptr = dotList.get(i);
    ptr.appear(); 
    
    //Mice eliminated if met by a cat
    if (dist(ptr.x, ptr.y, x, y) < imgSize){
      dotList.remove(ptr);
      dotNum -= 1;
    }
  }
}



//================= Check if mouse is over doge / cat's face 

//(Since doge and cat are at the same location on screen 1 and 2, 
// the same dogeOver() method can be used for both cat and doge)

boolean dogeOver(){
  if (mouseX >= 200 && mouseX <= 200 + imgSize * 7 && 
      mouseY >= 50 && mouseY <= 50 + imgSize * 7) { 
      return true;
  } else {
    return false;
  }
}

//================= Check if the mouse is over the "Game Selection Screen" button
boolean but1Over(){
  if (mouseX >= 10 && mouseX <= 190 && 
      mouseY >= 100 && mouseY <= 130) { 
      return true;
  } else {
    return false;
  }
}

//================= Check if the mouse is over the "Say Goodbye" button
boolean but2Over(){
  if (mouseX >= 455 && mouseX <= 630 && 
      mouseY >= 100 && mouseY <= 130) { 
      return true;
  } else {
    return false;
  }
}



 