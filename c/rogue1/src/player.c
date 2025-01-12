#include <rogue.h>

Entity* createPlayer(Position start_pos)
{
  Entity* newPlayer = calloc(1, sizeof(Entity));

  newPlayer->pos.y = start_pos.y;
  newPlayer->pos.x = start_pos.x;
  newPlayer->ch = '@';

  return newPlayer;
}

void handleInput(int input)
{
  switch(input)
  {
    //move up
    case KEY_UP:
      player->pos.y--;
      break;
    //move down
    case KEY_DOWN:
      player->pos.y++;
      break;
    //move left
    case KEY_LEFT:
      player->pos.x--;
      break;
    //move right
    case KEY_RIGHT:
      player->pos.x++;
      break;
    //move up_left
    case KEY_HOME:
      player->pos.x--;
      player->pos.y--;
      break;
    //move down_left
    case KEY_END:
      player->pos.x--;
      player->pos.y++;
      break;
    //move up_right
    case KEY_PPAGE:
      player->pos.x++;
      player->pos.y--;
      break;
    //move down_right
    case KEY_NPAGE:
      player->pos.x++;
      player->pos.y++;
      break;
    //not defined keys
    default:
      break;
  }
}