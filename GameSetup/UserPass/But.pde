Class But{
  int but1X, but1Y, but2X, but2Y;    // Position of square button
  //int circleX, circleY;  // Position of circle button
int butSize = 90;     // Diameter of rect
//int circleSize = 93;   // Diameter of circle
color but1Color, but2Color, baseColor;
color but1Highlight, but2Highlight;
color currentColor;
boolean but1Over = false;
boolean but2Over = false;

void setup() {
  size(640, 360);
  but1Color = color(0);
  but1Highlight = color(51);
  but2Color = color(255);
  but2Highlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  but1X = width/2-butSize/2-130;
  but1Y = height/2-butSize/2;
  but2X = width/2-butSize+130;
  but2Y = height/2-butSize/2;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
 textSize(32);
text("word", 10, 30); 
fill(0, 102, 153);
text("word", 10, 60);
fill(0, 102, 153, 51);
text("word", 10, 90); 
  
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
  stroke(0);
  rect(but2X, but2Y, butSize, butSize);
}

void update(int x, int y) {
  if ( overBut2(but2X, but2Y, butSize, butSize) ) {
    but2Over = true;
    but1Over = false;
  } else if ( overBut1(but1X, but1Y, butSize, butSize) ) {
    but1Over = true;
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
        currentColor = but1Color;
    return true;
  } else {
    return false;
  }
}