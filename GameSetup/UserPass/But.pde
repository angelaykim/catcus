class But{
String but1Label, but2Label;
int but1X, but1Y, but2X, but2Y,but3X, but3Y;    // Position of square button
  //int circleX, circleY;  // Position of circle button
int butSize = 90;     // Diameter of rect
//int circleSize = 93;   // Diameter of circle
color but1Color, but2Color, but3Color, baseColor;
color but1Highlight, but2Highlight, but3Highlight;
color currentColor;
boolean but1Over = false;
boolean but2Over = false;
boolean but3Over = false;

But(){
  but1Color = color(255, 77, 77);
  but1Highlight = color(255, 204, 204);
  
  but2Color = color(255, 204, 102);
  but2Highlight = color(255, 238, 204);
  
  
  but3Color = color(204, 102, 255);
  but3Highlight = color(238, 204, 255);
  
  
  baseColor = color(255, 255, 255);
  currentColor = baseColor;
  
  but1X = 100;//width/2-butSize/2-130;
  but1Y = height/2-butSize/2;
  but2X = 275;//width/2-butSize+130;
  but2Y = height/2-butSize/2;
  but3X = 450;
  but3Y = height/2-butSize/2;
  ellipseMode(CENTER);

}
  


void drawBut() {
  update();
  background(currentColor);
  
  
  textSize(40);
  fill(255, 255, 255);
  text("Welcome to CatGames!", 320, 30); 

  textSize(20);
  fill(255, 255, 255);
  text("Please choose a game to start playing!", 320, 65);
  

  textSize(32);
  textAlign(CENTER, CENTER);
   
  
  
  if (but1Over) {
    fill(but1Highlight);
  } else {
    fill(but1Color);
  }
  
  stroke(255);
  
  rect(but1X, but1Y, butSize, butSize);

    if (but2Over) {
    fill(but2Highlight);
  } else {
    fill(but2Color);
  }
  
  
  stroke(255);
  rect(but2X, but2Y, butSize, butSize);
  
    if (but3Over) {
    fill(but3Highlight);
  } else {
    fill(but3Color);
  }


  stroke(255);
  rect(but3X, but3Y, butSize, butSize);
  
}

    


void update() {
  if ( overBut2(but2X, but2Y, butSize, butSize) ) {
    but2Over = true;
    but1Over = false;
    but3Over = false;
  } else if ( overBut1(but1X, but1Y, butSize, butSize) ) {
    but1Over = true;
    but2Over = false;
    but3Over = false;
  } else if ( overBut3(but3X, but3Y, butSize, butSize) ) {
    but3Over = true;
    but1Over = false;
    but2Over = false;
  } else {
    but2Over = but1Over = false;
  }
}

/*
void mousePressed() {
  if (but2Over) {
    currentColor = but2Color;
  }
  if (but1Over) {
    currentColor = but1Color;
  }
}
*/


boolean overBut1(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
          currentColor = but2Color;
      return true;
  } else {
    return false;
  }
}

boolean overBut2(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        currentColor = but3Color;
    return true;
  } else {
    return false;
  }
}

boolean overBut3(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
          currentColor = but1Color;
      return true;
  } else {
    return false;
  }
}

}