class Alien{
   int score;
   int speedx, speedy;
   color c;
   float x, y;
   
   //constructor
   Alien(){
      score = 10;
      speedx = 10;
      speedy = 10;
   }
   
   Alien(int points, int fastx, int fasty, float xcoor, float ycoor){
     score = points;
     speedx = fastx;
     speedy = fasty;
     x = xcoor;
     y = ycoor;
     c = color(0, 255, 0);
   }
   
   void display(){
     rect(10, 10, 10, 10);
     fill(0, 255, 0);
   }
   //ded
   void die(){
       
   }
   
   //how move
   void move(){
       x += speedx;
       y += speedy;
       if(x == 80 || x == 560){
          y += 10;
          speedx = speedx*(-1);
       }
   }
}//end class