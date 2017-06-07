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