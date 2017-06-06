PImage img, img2, img3, img4; //import images
float imgSize = 40; //constant img size
int x = 320; //original x position of cat
int y = 180; //original y position of cat
ArrayList<Dots> dotList = new ArrayList();
ArrayList<Dogs> dogList = new ArrayList();
int dotNum = 20; //beginning num of dots
int dogNum = 2;


float dogX;              //declared variable for the circle that will move along x-axis
float dogY;              //declared variable for the circle that will move along y-axis
float dogVx = random (-10, 10); //sets the speed of the circle moving on the x-axis
float dogVy = random (-10, 10); 



void setup(){
  
  size(640, 360);
  ellipseMode(RADIUS);
  for (int i = 0; i < dotNum; i ++){ //create dotNum number of dots
    Dots d = new Dots((int)random(width), (int)random(height)); 
    //random() returns float --> needs to be converted to int
    //and limit it within the size of the world
    dotList.add(d); //add newly created dots
  }
  
  for (int u = 0; u < dogNum; u ++){
    Dogs dog = new Dogs();
    dogList.add(dog);
  }
    
  img = loadImage("cat.png");
  img2 = loadImage("moumou.png");
  img3 = loadImage("bub.png");
  img4 = loadImage("doge.png");
  
  for (int i = 0; i < dotNum; i ++){
    Dots dt = new Dots((int)random(width), (int)random(height)); 
    //random --> scatter mice (dots) randomly
    dotList.add(dt);
    //generate dots --> store them in dot list
  }
  
  dogX = 0;  //initial value for circle on x-axis
  dogY = 0;  //initial value for circle on y-axis
  dogX = 0;
  dogY = 0;

}

void draw(){
  background(255);
  textAlign(CENTER);
  textSize(30); 
  fill(255, 51, 51);
  text("You Have Caught " + str(20 - dotNum) + " Mice!" , width/2, 30);
  image(img, x, y, imgSize, imgSize); 
  for (int i = 0; i < dotNum; i ++){
    Dots ptr = dotList.get(i);
    ptr.appear(); //display the dot
    if (dist(ptr.x, ptr.y, x, y) < imgSize/2){
      dotList.remove(ptr);
      dotNum -= 1;
    }
  }
  
  for (int u = 0; u < dogNum; u ++){
    Dogs d = dogList.get(u);
    //d.Wander();
  }
  

  
  if ( 20 - dotNum >= 3 && 20 - dotNum < 5){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255, 51, 51);
    text("I am still hungary.", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 6 && 20 - dotNum < 8){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255, 51, 51);
    text("Yum...Some more!", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 9 && 20 - dotNum < 11){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255, 51, 51);
    text("These mice are cute!", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 12 && 20 - dotNum < 14){
    image(img3, x+20, y-70,imgSize+100, imgSize+40);
    textSize(10);
    fill(255, 51, 51);
    text("Stupid dog...Haha!", x+77, y-30);
  }
  
  else if ( 20 - dotNum >= 18 && 20 - dotNum < 20){
    image(img3, x+20, y-70,imgSize+75, imgSize+40);
    textSize(10);
    fill(255, 51, 51);
    text("I am so full!", x+77, y-30);
  }
  
  
  /*
  if (mousePressed) {  //if mouse is pressed, the ball will change to a random color, hold down for constant change
  fill (random(25, 255), random (25, 255), random (25, 255), random (25, 255));} //code to fill in random color
  */

  
  image(img4,dogX, dogY, imgSize, imgSize);
  image(img4, dogX, dogY, imgSize, imgSize);
  /*
  dogX = dogX + dogVx;
  dogY = dogY + dogVy;
  
  if (dogX > width){
    dogVx = -5;
  }
  if (dogX < 0){
    dogVx = 5;
  }
  if (dogY > height){
    dogY = -5;
  }
  if (dogY < 0){
    dogY = 5;
  }
  */
  dogX = dogX + dogVx;    //code to change the speed of circle on x-axis
  dogY = dogY + dogVy;    //code to change speed of circle on y-axis

  if (dogX > width) {    //prevents the ball from moving offscreen on right of x-axis
      dogVx = -5;        //if ball is greater than width, it'll bounce off end screen and move in opposite direction
  }
  if (dogX < 0){  //prevents ball from moving offscreen on left of axis
      dogVx = 5;}    //if ball is less than 0, it'll bounce off end screen and move in opposite direction
  if (dogY > height) { //prevents ball from moving offscreen at the top
      dogVy = -5;}    //if ball is greater than height, it'll bounce off top of screen and move down
  if (dogY < 0) {  //if ball is less than 0 in height, it'll bounce off bottom and move up
      dogVy = 5;}    //prevents ball from disappearing at the bottom of the screen
}
  
   /*
    
    ellipse (dogX, dogY, 30, 30); 
     dogX += dogVx; //keep moving in Vx direction by increasing its x axis position
    dogX += dogVy; //keep moving in Vy direction by increasing its y axis postion
    
    //reverse direction if it touches the boundary
    if (dogX > width){
      dogVx = -10; 
    }
    if (dogX < 0){
      dogVx = 10; 
    }
    if (dogY < 0){
      dogVy = 10; 
    }
     if (dogY > height){
      dogVy = -10; 
    }
    */
    

  
  



  
 void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {     
      if (y < 0){
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

  

class Dots{
  int x, y; //every dot has its own xy coordinates
  
  Dots(int a, int b){//overloaded constructor --> used in setup to generate dots
    x = a;
    y = b;
  }  
  void appear(){  
  image(img2, x, y, imgSize, imgSize);    
  }
}


class Dogs{
  
  void Wander(){
    fill (random(25, 255), random (25, 255), random (25, 255), random (25, 255)); //code to fill in random color
    ellipse (dogX, dogY, 30, 30); 
    image(img2, dogX, dogY, imgSize, imgSize);
  }
}
    
  