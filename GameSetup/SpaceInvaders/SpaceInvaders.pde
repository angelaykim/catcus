ArrayList<Alien> aliens;
ArrayList<Bullet> bullets;
PImage user;
int lives = 3;
float xcoor = 290.00;
int press = 0;
int time = 0;
int points;

void setup() {
  size(620, 400);

  //user = createShape(RECT, xcoor, 360, 30, 15);
  //user.setFill(color(0, 255, 0));
  user = loadImage("cookiecat.png"); 

  bullets = new ArrayList<Bullet>();

  float xpos = 100.00;
  aliens = new ArrayList<Alien>();
  //30 points
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(30, .5, 10, xpos, 50.00, 255, 0, 0));
    aliens.get(x).setState(x);
    xpos += 45;
  }  
  //20 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(20, .5, 10, xpos, 80.00, 0, 255, 0));
    aliens.get(x+10).setState(x);
    xpos += 45;
  }
  //20 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(20, .5, 10, xpos, 110.00, 0, 255, 0));
    aliens.get(x+20).setState(x);
    xpos += 45;
  }
  //10 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(10, .5, 10, xpos, 140.00, 255, 255, 255));
    aliens.get(x+30).setState(x);
    xpos += 45;
  }
  //10 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(10, .5, 10, xpos, 170.00, 255, 255, 255));
    aliens.get(x+40).setState(x);
    xpos += 45;
  }
}

void draw() {
  background(0);

  lives();

  score();

  //shape(user);
  image(user, xcoor, 360, 40, 20);

  //pew pew pew
  for (int x = 0; x < bullets.size(); x++) {
    Bullet bbang = bullets.get(x);
    bbang.display();
    bbang.move();
  }

  //user die
  for (int x = 0; x < bullets.size(); x++) {
    Bullet bang = bullets.get(x);
    if ((bang.getX() >= xcoor && bang.getX() < xcoor+20) && (bang.getY() == 360)) {
      lives--;
      image(user, 290, 360, 40, 20);
      bullets.remove(x);
    }
  }

  // aliens appear
  for (int i = 0; i < aliens.size(); i++) {
    aliens.get(i).display();
  }
  //alien die 
  for (int i = 0; i < aliens.size(); i++) {
    for (int x = 0; x < bullets.size(); x++) {
      Bullet bong = bullets.get(x);
      if ((bong.getX() >= aliens.get(i).getX() && bong.getX() < aliens.get(i).getX()+15) && (bong.getY() == aliens.get(i).getY()) && (bong.getState() == 0)) {
        points+=aliens.get(i).getScore();
        aliens.get(i).die();
        bullets.remove(x);
      }
    }
  }

  if (millis() - time > 1000) {
    int rand = (int) random(aliens.size());

    Bullet pewpew = new Bullet(-2, aliens.get(rand).getX()+15, aliens.get(rand).getY(), 1);
    bullets.add(pewpew);
    time = millis();
  }

  for (int a = 40; a < 50; a++) {
    //end screen if aliens are not all dead
    if (aliens.get(a).getY() > 300) {
      //exit();
    }
    aliens.get(a).move();
  }
  for (int b = 30; b < 40; b++) {
    aliens.get(b).move();
  }

  for (int c = 20; c < 30; c++) {
    aliens.get(c).move();
  }
  for (int d = 10; d < 20; d++) {
    aliens.get(d).move();
  }
  for (int e = 0; e < 10; e++) {
    aliens.get(e).move();
  }

  if (lives <=0) {
    dieScreen();
  }
}

void dieScreen() {
  background(0);
  textAlign(CENTER);
  textSize(20);
  text("GAME OVER", width/2, 30);
}

void lives() {
  textAlign(RIGHT);
  textSize(15);
  text("LIVES", 480, 30);

  float xc = 0;

  for (int x = 0; x < lives; x++) {
    xc = 480 + 30*x + 10*(x+1);
    image(user, xc, 15, 30, 15);
  }
  /*
  image(user, 490, 15, 30, 15);
   image(user, 530, 15, 30, 15);
   image(user, 570, 15, 30, 15);
   */
}

void score() {
  textAlign(LEFT);
  textSize(15);
  text("SCORE: " + points, 50, 30);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode  == RIGHT && xcoor < 560) {
      //user = createShape(RECT, xcoor+2, 360, 30, 15);
      image(user, xcoor+3, 360, 30, 15);
      xcoor += 3;
      //user.setFill(color(0, 255, 0));
    }
    if (keyCode  == LEFT && xcoor > 20) {
      //user = createShape(RECT, xcoor-2, 360, 30, 15);
      image(user, xcoor-3, 360, 30, 15);
      xcoor -= 3;
      //user.setFill(color(0, 255, 0));
    }
  }
  if (key == ' ') {
    Bullet pew = new Bullet(2, xcoor+20, 360, 0);
    bullets.add(pew);
  }
}

/*
boolean isMeet(Alien blob) {
 return (bill.getX() > blob.getX() && bill.getX() < blob.getX() + blob.getWid()) &&
 (bill.getY() < blob.getY() && bill.getY() > blob.getY() + blob.getLen());
 }
 
 void hitAlien(Alien blob) {
 if ((bill.getX() >= blob.getX() && bill.getX() < blob.getX() + blob.getWid()) && (bill.getY() <= blob.getY()+blob.getLen())) { //&& bill.getY() > blob.getY() + blob.getLen())) {
 bill = null;
 blob = null;
 }
 }
 */