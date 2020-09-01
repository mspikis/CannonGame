class Target {
  float velocity;
  int r; //radius
  PVector location;
  boolean isAlive;
  boolean bug;
  PImage imgb, imgm;

  Target() {
    r = 25;
    location = new PVector(600, random (20, 340));
    velocity = vel; //difLvl
    isAlive = true;
    imgb=loadImage("bug.png");
    imgm = loadImage("mosquito.png");
  }

  void display() { 
    fill(100, 50);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    if (bug) {
      image(imgb, -13, -30);
    } else
    {
      image(imgm, -18, -30);
    }
    popMatrix();
    location.x -= velocity;
  }

  public PVector getLocation() {
    return location;
  }
  public boolean getIsAlive()
  {
    return isAlive;
  }
  public void setIsAlive(boolean alive)
  {
    isAlive = alive;
  }
  
}