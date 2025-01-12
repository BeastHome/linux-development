#include <rogue.h>

void cursesSetup(void)
{
  initscr();
  keypad(stdscr, TRUE);
  noecho();
  curs_set(0);
}

void gameLoop(void)
{
  int ch;

  drawEverything();

  while(ch = getch())
  {
    if (ch == 'q')
    {
      break;
    }

    handleInput(ch);
    drawEverything();
  }
}

void closeGame(void)
{
  endwin();
  free(player);
}