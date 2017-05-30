class Bullet{
    int wid;
    int len;
    color c;
    int speed;
    
    //constructor
    Bullet(int fast){
        int wid = 1;
        int len = 2;
        c = color(255, 255, 255);
        speed = fast;
    }
    
    //it ded
    void die(){
       wid = 0;
       len = 0;
    }
}//end class