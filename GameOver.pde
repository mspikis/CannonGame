
class GameOver 
{
  SquareButton buttonRe, buttonCo;
  boolean win;
  PImage imgBaL, imgBa1, imgBa2, imgBa3, imgRe, imgCo;

  GameOver()
  {
    win = false;
    imgBaL = loadImage("game_over.png");
    imgCo = loadImage("bt_continue.png");
    imgRe = loadImage("bt_restart.png");
    imgBa1 = loadImage("bronze_bomb.png");
    imgBa2 = loadImage("silver_bomb.png");
    imgBa3 = loadImage("golden_bomb.png");
    
    buttonCo = new SquareButton(320-imgRe.width/2, 290, imgCo);
    buttonRe = new SquareButton(320-imgRe.width/2, 290, imgRe);
  }


void display()
{
  image(imgBaL, 0, 0);
  if (gameMode == 3)
  {
    if (dLvl == 1)
    {
      image(imgBa1, 0, 0);
    }
    else if (dLvl == 2)
    {
      image(imgBa2, 0, 0);
    }
    else
    {
      image(imgBa3, 0, 0);
    }
    buttonRe.display(0);
  } else if (gameMode == 4)
  {
    image(imgBaL, 0, 0);
    buttonRe.display(0);
  }

  if (buttonRe.overButton(mouseX, mouseY) || buttonCo.overButton(mouseX, mouseY)) {
    over[4] = true;
  } else
  {
    over[4] = false;
  }
}
public void setWin(boolean x) {
  win = x;
}
}