PImage img; //import image
int faceDir = 1;
int x = 320;
int y = 180;
float radius = 40;
ArrayList<Dots> dotList = new ArrayList();
int dotNum = 50; //beginning num of dots


void setup(){
  
  size(640, 360);
  ellipseMode(RADIUS);
  for (int i = 0; i < dotNum; i ++){ //create dotNum number of dots
    Dots d = new Dots((int)random(width), (int)random(height)); 
    //random() returns float --> needs to be converted to int
    //and limit it within the size of the world
    dotList.add(d); //add newly created dots
  }
  img = loadImage("cat.png");
}

void draw(){
 
  
  background(255);
  /*
  textAlign(CENTER);
  textSize(30);
  
  fill(359);
  text("hey here", width/2, 30);
  
  
*/

  image(img, x, y, radius, radius);
  
}
  
 void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      
      
      if (y < 0){
        y = height;
      }
      
      y -= 5;
      faceDir = 2;
    } else if (keyCode == DOWN) {
      
 
      
      if (y > height){
        y = 0;
      }
      y += 5;
      faceDir = -2;
    } else if (keyCode == LEFT) {
      if (x < 0){
        x = width;
      }
      x -= 5;
      faceDir = 1;
    } else if (keyCode == RIGHT) {
      if (x > width){
        x = 0;
      }
      x += 5;
      faceDir = -1;
    }  
  } 
}
  

class Dots{
  int x, y; //every dot has its own xy coordinates
  
  Dots(int a, int b){//overloaded constructor
    x = a;
    y = b;
  }
  
  void display(){
    noStroke();
    fill(230, 0, 230); //purple!
    ellipse(x, y, 5, 5); //draw dots
  }
}