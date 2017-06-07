class Dogs{
  
  void Wander(){
 image(img4,dogX, dogY, imgSize, imgSize);
 
  dogX += dogVx; //keep moving in Vx direction by increasing its x axis position
  dogY += dogVy; //keep moving in Vy direction by increasing its y axis postion

  if (dogX + imgSize > width) {    
      dogVx = -random(5);     
  }
  if (dogX < 0){  
      dogVx = random(5);
  }
      
  if (dogY + imgSize > height) { 
      dogVy = -random(5);
  }
  
  if (dogY < 30) {  
      dogVy = random(5);
  }
  }
}  