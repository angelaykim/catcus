/** 
 * No Repeat username Input (v1.10)
 * by GoToLoop (2013/Nov)
 * 
 * forum.processing.org/two/discussion/869
 * /check-array-contents-with-arraylist
 */
 
import static javax.swing.JOptionPane.*;
 
int curScreen = 0;
Player player;

final StringList usernames = new StringList( new String[] {"Eric", "Beth", "Katniss"});

void setup(){
  size(500,430);
  player = new Player();
}

void draw(){
  //display current screen
  if (curScreen == 0){
    userPassScreen();
  }
  else{
    println("hei");
  }
}
  
void userPassScreen() {
  
 
  String username = showInputDialog("Please enter your username:");
 
  if (username == null)   exit();
 
  else if ("".equals(username))
    showMessageDialog(null, "Empty username Input, please enter again.", 
    "Alert", ERROR_MESSAGE);
 
  else if (usernames.hasValue(username))
    showMessageDialog(null, "username \"" + username + "\" has already been taken, please choose a new one.", 
    "Alert", ERROR_MESSAGE);
 
  else {
    showMessageDialog(null, "username \"" + username + "\" successfully added!!!", 
    "Info", INFORMATION_MESSAGE);
    player.name = username;
    System.out.println(player.name);
    usernames.append(username);
  }
}


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