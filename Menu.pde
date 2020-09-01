int tarNum;
float vel;

class Menu {
  SquareButton[] buttons;
  CircleButton btStart;
  PImage imgBa, imgEs, imgIn, imgEx, imgSt;

  Menu() {

    buttons = new SquareButton[3];



    tarNum = 8;

    vel = 2.0 / 3.0;

    imgBa=loadImage("menu_background.png");
    imgEs=loadImage("bt_easy.png");
    imgIn=loadImage("bt_normal.png");
    imgEx=loadImage("bt_hard.png");
    imgSt=loadImage("bomb_final.png");

    btStart = new CircleButton(130, 110, imgSt);
    buttons[0] = new SquareButton(width - 190, height - 220, imgEs);
    buttons[1] = new SquareButton(width - 195, height - 160, imgIn);
    buttons[2] = new SquareButton(width - 189, height - 98, imgEx);

    ellipseMode(CENTER);
  }

  void display() {
    image(imgBa, 0, 0);
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].display(i+1);
    }
    btStart.display();

    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].overButton(mouseX, mouseY)) {
        over[i] = true;
      } else {
        over[i] = false;
      }
    }
    if (btStart.overButton(mouseX, mouseY)) {
      over[3] = true;
    } else
    {
      over[3] = false;
    }
  }
}