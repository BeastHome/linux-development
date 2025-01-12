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

Position newPos = { player->pos.y, player->pos.x };

  switch(input)
  {
    //move up
    case KEY_UP:
      newPos.y--;
      break;
    //move down
    case KEY_DOWN:
      newPos.y++;
      break;
    //move left
    case KEY_LEFT:
      newPos.x--;
      break;
    //move right
    case KEY_RIGHT:
      newPos.x++;
      break;
    //move up_left
    case KEY_HOME:
      newPos.x--;
      newPos.y--;
      break;
    //move down_left
    case KEY_END:
      newPos.x--;
      newPos.y++;
      break;
    //move up_right
    case KEY_PPAGE:
      newPos.x++;
      newPos.y--;
      break;
    //move down_right
    case KEY_NPAGE:
      newPos.x++;
      newPos.y++;
      break;
    //not defined keys
    default:
      break;
  }

movePlayer(newPos);

}

void movePlayer(Position newPos)
{
	if (map[newPos.y][newPos.x].walkable)
	{
		player->pos.y = newPos.y;
		player->pos.x = newPos.x;
	}
}