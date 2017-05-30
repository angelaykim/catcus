class Player{
  String username;
  //String password;
  int catariHS, spaceHS, catmanHS;
  Player(){
   username = "cat";
   //password = "kitty";
   catariHS = 0;
   spaceHS = 0;
   catmanHS = 0;
  }
  Player(String nombre, String pssword, int catariHighScore, int spaceHighScore, int catmanHighScore){
    Player tempPlayer = new Player();
    username = nombre;
    //password = pssword;
    catariHS = catariHighScore;
    spaceHS = spaceHighScore;
    catmanHS = catmanHighScore;
  }
}