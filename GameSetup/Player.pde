
/*
class Player{ 
  //class of player that keeps all its variables throughout the game
  int lives;
  int hs;
  String name;
  boolean dead;
  
  Player(){
    lives = 3;
    hs = 0;
    dead = false;
    name = "";
}
}
*/
class Player{
  String name;
  //String password;
  int catariHS, spaceHS, catmanHS;
  int lives;
  boolean dead;
  
  Player(){
   name = "cat";
   //password = "kitty";
   catariHS = 0;
   spaceHS = 0;
   catmanHS = 0;
   lives = 3;
   dead = false;
  }
  
  
  /*
  Player(String nombre, String pssword, int catariHighScore, int spaceHighScore, int catmanHighScore){
    Player tempPlayer = new Player();
    username = nombre;
    password = pssword;
    catariHS = catariHighScore;
    spaceHS = spaceHighScore;
    catmanHS = catmanHighScore;
  }
  */
}