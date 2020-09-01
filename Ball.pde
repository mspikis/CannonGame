
class Ball {
  PVector velocity;
  PVector acceleration;

  // Size
  float r;

  float topspeed;
  float tempLocY;

  PVector location;
  PImage img; //imgSp;

  Ball(float x, float y) {
    tempLocY = y;
    topspeed = 17;
    r = 20;
    velocity = new PVector();
    acceleration = new PVector();
    location = new PVector(x, y);

    img = loadImage("canonball.png");
    //imgSp = loadImage("goo.png");
  } 

  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() { 
    noStroke();
    fill(100, 80);
    if (shot == false)
    {
      pushMatrix();
      translate(location.x, tempLocY);
      //ellipse(0, 0, r, r);
      //image(img,-10,-10,img.width/4,img.height/4);
      popMatrix();
    } else
    {
      pushMatrix();
      translate(location.x, location.y);
      ellipse(0, 0, r, r);
      image(img, -10, -10, img.width/4, img.height/4);
      popMatrix();
    }
  }

  boolean hit(Target target)
  {
    float dis = dist(location.x, location.y, target.getLocation().x, target.getLocation().y);
    float overlap = dis - r - target.r;
    if (overlap <= 0)
    {
      
      return true;
    }
    return false;
  } 

  public PVector getLocation() {
    return location;
  }

  public void setY(float y) {
    this.location.y = y;
  }

  public float getY() {
    return location.y;
  }

  public float getX() {
    return location.x;
  }


  public void setTempLocY(float tempLocY) {
    this.tempLocY = tempLocY;
  }

  public float getTempLocY() {
    return tempLocY;
  }
}