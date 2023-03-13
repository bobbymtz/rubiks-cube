// This class is how a move is animated
class Move
{
  char face;
  int direction;
  int x, y, z;
  
  float angle = 0;
  float angleDelta = 0.07;
  
  boolean animating;
  boolean finished;
  
  Move(char face, int direction, int x, int y, int z)
  {
    this.face = face;
    this.direction = direction;
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void start()
  {
    animating = true;
    finished = false;
    angle = 0;
  }
  
  void update()
  {
    if (animating)
    {
      angle += direction * angleDelta;
      if (abs(angle) >= PI / 2)
      {
        animating = false;
        finished = true;
        angle = 0;
        cube.rotateFace(face, direction);
      }
    }

  }
  
  boolean finished()
  {
    return finished;
  }
  
  // Needed to invert the move to appear as solving the cube
  void reverse()
  {
    direction = direction * -1;
  }

  Move copy()
  {
    return new Move(this.face, this.direction, this.x, this.y, this.z);
  }
  
}
