ArrayList<Alien> aliens;
PShape user;
float xcoor = 290.00;
Bullet bill;

void setup() {
  size(620, 400);

  user = createShape(RECT, xcoor, 360, 30, 15);
  user.setFill(color(0, 255, 0));

  float xpos = 100.00;
  aliens = new ArrayList<Alien>();
  //30 points
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(30, .5, 10, xpos, 50.00));
    aliens.get(x).setState(x);
    xpos += 45;
  }  
  //20 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(20, .5, 10, xpos, 80.00));
    aliens.get(x+10).setState(x);
    xpos += 45;
  }
  //20 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(20, .5, 10, xpos, 110.00));
    aliens.get(x+20).setState(x);
    xpos += 45;
  }
  //10 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(10, .5, 10, xpos, 140.00));
    aliens.get(x+30).setState(x);
    xpos += 45;
  }
  //10 points
  xpos = 100.00;
  for (int x = 0; x < 10; x++) {
    aliens.add(new Alien(10, .5, 10, xpos, 170.00));
    aliens.get(x+40).setState(x);
    xpos += 45;
  }
}

void draw() {
  background(0);

  shape(user);

  if (bill != null) {
    bill.display();
    bill.move();
  }

  // aliens appear
  for (int i = 0; i < aliens.size(); i++) {
    aliens.get(i).display();
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

/*  for (int ab = 0; ab < aliens.size(); ab++) {
    hitAlien(aliens.get(ab));
  }*/
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode  == RIGHT && xcoor < 560) {
      user = createShape(RECT, xcoor+2, 360, 30, 15);
      xcoor += 2;
      user.setFill(color(0, 255, 0));
    }
    if (keyCode  == LEFT && xcoor > 20) {
      user = createShape(RECT, xcoor-2, 360, 30, 15);
      xcoor -= 2;
      user.setFill(color(0, 255, 0));
    }
    if (bill == null) {
      bill = new Bullet(3, xcoor+14, 352);
    }
  }
}
/*
boolean isMeet(Alien blob) {
 return (bill.getX() > blob.getX() && bill.getX() < blob.getX() + blob.getWid()) &&
 (bill.getY() < blob.getY() && bill.getY() > blob.getY() + blob.getLen());
 }
 */
void hitAlien(Alien blob) {
  if ((bill.getX() > blob.getX() || bill.getX() < blob.getX() + blob.getWid()) &&
    (bill.getY() < blob.getY() || bill.getY() > blob.getY() + blob.getLen())) {
    bill.die();
    blob = null;
  }
}