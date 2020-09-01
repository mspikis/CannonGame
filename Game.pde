boolean shot;
boolean hit;


class Game
{
  Cannon cannon;
  Ball ball;

  Target[] targets;

  long timer;
  int enemy, enemiesDown, trig;
  boolean fire, bug;
  PImage img;


  Game() {

    cannon = new Cannon(30, height / 2);
    ball = new Ball(cannon.getLocation().x, cannon.getLocation().y);
    timer = 0;
    enemy = 0;
    trig = 0;
    enemiesDown = 0;
    shot = false;
    fire = false;
    hit = false;

    img=loadImage("forestbackground.png");



    targets = new Target[tarNum];

    for (int i = 0; i < targets.length; i++) 
    {
      targets[i] = new Target();
      if (random(0, 1) < 0.5)
      {
        targets[i].bug = true;
      } else
      {
        targets[i].bug = false;
      }
    }
  }

  Target[] getTargets() {
    return targets;
  }



  void display()
  {
    background(250);
    image(img, 0, 0);
    fill(0, 40);
    rect(width - 90, 15, 75, 40, 2);
    fill(0, 80);
    textSize(23);
    text(enemiesDown + "/" + targets.length, width - 76, 20 + 25);

    // target creation delay
    if (millis()-timer > 200*(random(7, 15)) && enemy < targets.length)
    {
      enemy++;
      timer = millis();
    }

    // target display
    for (int i = 0; i < enemy; i++) 
    {
      if ( targets[i].getIsAlive())
      {
        //display target
        targets[i].display();
      }
    }

    //leap motion cannon movement Y axis and rotate
    for  (Hand hand : leap.getHands())
    {
      PVector handPosition = hand.getPosition();
      float   handRoll = hand.getRoll();

      if (hand.isLeft())
      {
        //rotate cannon and ball direction
        if (handRoll >= -90 && handRoll <= 90)
        {
          cannon.setAngle(radians(handRoll));
        }

        //move cannon Y axis
        if (handPosition.y >= 100 && handPosition.y <= 310) 
        {
          cannon.setY(map(handPosition.y, 100, 310, 10, height-10));
          ball.setTempLocY(cannon.getLocation().y);
        }
      }
    }



    // when ball is shot
    if (shot) 
    { 
      PVector gravity = new PVector(0, 0.2);
      ball.applyForce(gravity);
      ball.update();

      // check if any of the targets is hit 
      for (int i = 0; i < enemy; i++) 
      {
        if ((hit = ball.hit(targets[i])) && targets[i].getIsAlive() )
        {
          targets[i].setIsAlive(false);
          kill.play();
          enemiesDown++;
        }
      }
    }

    //display ball
    ball.display();

    // display cannon
    cannon.display();

    //Reload
    if (ball.getY() < 0|| ball.getY() > height || ball.getX() > width) 
    {
      ball = new Ball(cannon.getLocation().x, cannon.getLocation().y);  
      shot = false;
      keyPressed = false;
    }

    //Shot
    if ( keyPressed && key == ' ' && !shot)
    {
      shot = true;
      PVector force = PVector.fromAngle(cannon.getAngle());
      force.mult(100);
      ball.setY(cannon.getLocation().y);
      ball.applyForce(force);
      fire = false;
      shoot.play();
    }


    if (enemiesDown == targets.length) {
      gameMode = 3;
      cong.play();
    } else {
      for (int i = 0; i < targets.length; i++)
      {
        if (targets[i].getLocation().x < 1)
        {
          gameMode = 4;
          loo.play();
        }
      }
    }
  }
}