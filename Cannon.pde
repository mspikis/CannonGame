class Cannon { 
  private float x, y;
  private float angle;
  int w, h, a;
  private PVector location;
  PImage img;

  Cannon(float x, float y)
  {
    w = 50;
    h = 10;
    angle = 0;
    location = new PVector(x, y);
    img = loadImage("cannonb.png");
  }

  void display() 
  {
    fill(100, 80);
    pushMatrix(); //save 0, 0 coordinate system
    translate(location.x, location.y); // set 0, 0 at cannon location
    rotate(angle); //rotate
    rect(0, -h/2, w, h); // draw cannon
    image(img,-10,-30);
    popMatrix(); // return initial 0, 0 coordinates
  }

  // set cannon angle
  public void setAngle(float angle) {
    this.angle = angle;
  }

  // return cannon angle
  public float getAngle() {
    return angle;
  }

  // set y cannon location
  public void setY(float y) {
    location.y = y;
  }

  //return cannon location
  public PVector getLocation() {
    return location;
  }
}