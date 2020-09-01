class SquareButton {
  PVector location;
  PImage img;
  boolean shrink;

  SquareButton(int x, int y, PImage img) {
    location = new PVector(x, y);
    this.img = img;
    shrink = false;
  }

  void display(int i)
  {
    if (shrink || dLvl == i)
    {
      image(img, location.x + (img.width * 0.1)/2, location.y + (img.height * 0.1)/2, img.width*0.9, img.height*0.9);
    } 
    else
    {
      image(img, location.x, location.y);
    }
  }


  boolean overButton(int x, int y) {
    if (x >location.x && x < location.x + img.width && y > location.y && y < location.y + img.height) {
      
      shrink = true;
      return true ;
    }
    shrink = false;
    return false;
  }
}