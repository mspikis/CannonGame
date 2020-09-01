class CircleButton {
  PVector location;
  int r;
  boolean shrink;
  PImage img;

  CircleButton(int x, int y, PImage img) 
  {
    location = new PVector(x, y);
    r = (img.width-10)/2;
    shrink = false;
    this.img = img;
  }

  void display()
  {
    if(shrink)
    {
      image(img, location.x + (img.width*0.1)/2 , location.y + (img.height*0.1)/2, img.width * 0.9, img.height * 0.9);
    }
    else
    {
    image(img, location.x, location.y);
    }
  }


  boolean overButton(int x, int y) {
    if (sq(location.x + img.width/2 - x) + sq(location.y + img.height/2 - y) <= sq(r))
    {
      shrink = true;
      return true;
    }
    shrink = false;
    return false;
  }
}