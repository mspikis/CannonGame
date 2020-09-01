import de.voidplus.leapmotion.*;
import processing.sound.*;

Menu m;
Game g;
GameOver go;
int gameMode, dLvl;
LeapMotion leap;
boolean over[];
final int NUMBER_OF_BUTTONS = 5;
boolean gameFinished;

SoundFile exp, shoot, kill, click, cong, loo;

void setup() {
  size(640, 360);
  m = new Menu();
  g = new Game();
  go = new GameOver();
  gameMode = 1;
  dLvl = 1;
  
  exp = new SoundFile(this, "8bit_bomb_explosion.wav");
  shoot = new SoundFile(this, "boom6.wav");
  kill = new SoundFile(this, "Socapex - blub_hurt.wav");
  click = new SoundFile(this, "MenuSelection Click.wav");
  cong = new SoundFile(this, "1.wav");
  loo = new SoundFile(this, "GAMEOVER (1).wav");
  
  over = new boolean[NUMBER_OF_BUTTONS];
  
  finished = false;

  leap = new LeapMotion(this).allowGestures();
}

void draw() {
  background(255);
  if (gameMode == 1)
  {
    m.display();
  } else if (gameMode == 2)
  {
    if(gameFinished == true) {
      g = new Game();
      gameFinished = false;
    }
    
    g.display();
    
  }
  else if (gameMode == 3 || gameMode == 4)
  {
    gameFinished = true;
    go.display();
  }
}

void mousePressed() {
  //difficulty levels
  if(gameMode == 1) {
    for (int i=0; i < 3; i++)
    {
      if (over[i]) {
        tarNum  = (i+1)*8;
        vel = (float) (i+1) * 3 / 4;
        gameFinished = true;
        dLvl = i + 1;
        click.play();
      }
    }

    //start button
    if (over[3])
    {
      gameMode = 2;
      exp.play();
    }
  }
  else if(gameMode == 3 || gameMode == 4)
  {
    //play again
    if (over[4])
    {
      gameMode = 1;
      click.play();
    }
  }
}