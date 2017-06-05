ArrayList<Alien> aliens;

void setup(){
  size(640, 360);
  
  aliens = new ArrayList<Alien>();
  for(int x = 0; x < 10; x++){
     aliens.add(new Alien()); 
  }
  for(int x = 0; x < 10; x++){
     aliens.add(new Alien(20, 10, 10, random(600), random(300))); 
  }  
}

void draw(){
   background(0);
   
  for(int x = 0; x < 20; x++){
     aliens.get(x).display(); 
  }
}