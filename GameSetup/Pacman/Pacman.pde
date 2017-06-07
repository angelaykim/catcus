PImage img, img2, img3, img4; //import images
float imgSize = 40; //constant img size
int x = 320; //original x position of cat
int y = 180; //original y position of cat
ArrayList<Dots> dotList = new ArrayList();
ArrayList<Dogs> dogList = new ArrayList();
int dotNum = 20; //beginning num of dots
int dogNum = 1;
int lives = 3;
int level = 1;
float dogX = random(imgSize, width-imgSize);              //declared variable for the circle that will move along x-axis
float dogY = random(imgSize, height-imgSize);              //declared variable for the circle that will move along y-axis
float dogVx = random (-10, 10); //sets the speed of the circle moving on the x-axis
float dogVy = random (-10, 10); 
boolean isDead = false;



void setup(){
  background(0);
  size(640, 360);
  ellipseMode(RADIUS);
  for (int i = 0; i < dotNum; i ++){ //create dotNum number of dots
    Dots d = new Dots((int)random(imgSize, width-imgSize), (int)random(imgSize+30, height-imgSize)); 
    //random() returns float --> needs to be converted to int
    //and limit it within the size of the world
    dotList.add(d); //add newly created dots
  }
  
  for (int u = 0; u < dogNum; u ++){
    Dogs dog = new Dogs();
    dogList.add(dog);
  }
    
  img = loadImage("cat.gif");
  img2 = loadImage("moumou.png");
  img3 = loadImage("bub.png");
  img4 = loadImage("doge.gif");
}

void draw(){
  background(0);
  
  if (!isDead){
  textAlign(CENTER);
  
  //Import cat images
  image(img, x, y, imgSize+5, imgSize+5); 
  
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
  
  
  //Display doge
  for (int u = 0; u < dogNum; u ++){
    Dogs d = dogList.get(u);
    d.Wander();
    
    if (dist(dogX, dogY, x, y) < imgSize){
      lives --;
      x = width/2;
      y = height/2;
      delay(1000);  
    }
    
  }

  

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
  rect(width - 130, 10, lives * 40, 10);
  //color block
  fill(255, 20, 40);
  rect(width - 130, 10, lives * 40, 10);
  }
  
  else{
    dieScreen();
  }
  
  
}
  
  
  /*
  if (mousePressed) {  //if mouse is pressed, the ball will change to a random color, hold down for constant change
  fill (random(25, 255), random (25, 255), random (25, 255), random (25, 255));} //code to fill in random color
  */

void dieScreen(){

      


  delay(4000);
  fill(250,128,114);
  rect(-1, -1, width+1, height+1);
  
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
    if (lives <= 0){
    image(img4, 200, 50, imgSize * 7, imgSize * 7);
    isDead = true;
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
 image(img4,dogX, dogY, imgSize, imgSize);


 
  dogX += dogVx; //keep moving in Vx direction by increasing its x axis position
  dogY += dogVy; //keep moving in Vy direction by increasing its y axis postion

  if (dogX + imgSize > width) {    
      dogVx = -1;     
  }
  if (dogX < 0){  
      dogVx = 1;
  }
      
  if (dogY + imgSize > height) { 
      dogVy = -1;
  }
  
  if (dogY < 30) {  
      dogVy = 1;
  }
  }
}  
  