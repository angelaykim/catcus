class Alien{
   int score;
   int speedx, speedy;
   color c;
   float x, y;
   
   //constructor
   Alien(int points, int fastx, int fasty){
     score = points;
     speedx = fastx;
     speedy = fasty;
     c = color(0, 255, 0);
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