// bobbymtz
// 05/26/2022
// Main class
import peasy.*;

// colors of the faces
// BLUE
final color L = color(13, 72, 172);
// GREEN
final color R = color(25, 155, 76);
// WHITE
final color U = color(255, 255, 255);
// YELLOW
final color D = color(254, 213, 47);
// ORANGE
final color B = color(255, 85, 37);
// RED
final color F = color(137, 18, 20);


// All possible moves
Move mL = new Move('L',-1, -1, 0, 0);
Move mR = new Move('R',1, 1, 0, 0);
Move mU = new Move('U',-1, 0, -1, 0);
Move mD = new Move('D',1, 0, 1, 0);
Move mB = new Move('B',-1, 0, 0, -1);
Move mF = new Move('F',1, 0, 0, 1);

Move mLp = new Move('L', 1, -1, 0, 0);
Move mRp = new Move('R', -1, 1, 0, 0);
Move mUp = new Move('U', 1, 0, -1, 0);
Move mDp = new Move('D', -1, 0, 1, 0);
Move mBp = new Move('B', 1, 0, 0, -1);
Move mFp = new Move('F', -1, 0, 0, 1);

Move[] moveList = {mL, mR, mU, mD, mB, mF, mLp, mRp, mUp, mDp, mBp, mFp};

int moveSize = 25;
ArrayList<Move> moves = new ArrayList<Move>();

RubiksCube cube = new RubiksCube();

int counter = 0;
boolean scramble = false;

Move currentMove;

void setup()
{
  PeasyCam camera = new PeasyCam(this, 0, 0, 0, 100);
  size(800, 600, P3D);
  
  // Populating the moves list with random moves
  for (int i = 0; i < moveSize; i++)
  {
    Move toAdd = moveList[int(random(moveList.length))];
    moves.add(toAdd);
  }
  
  // Adding the reverse moves to "solve" the cube
  for (int i = moveSize - 1; i >= 0; i--)
  {
    // Copy is needed to reverse direction
    Move reverse = moves.get(i).copy();
    reverse.reverse();
    moves.add(reverse);
  }

}

void draw()
{
  background(200);
  scale(10);
  // Initial viewing angle
  rotateY(PI / 4);
  rotateX(-PI / 8);
  rotateZ(-PI / 8);

  if(currentMove != null)
  {
    currentMove.update();
    
    // If you want to see the cube move by itself
    if (scramble)
    {
      if (currentMove.finished())
      {
        if (counter < moves.size()-1)
        {
          counter++;
          currentMove = moves.get(counter);
          currentMove.start();
        }
      }
    }
    
    for (int i = 0; i < cube.cubies.length; i++)
    {
      pushMatrix();
      // Checking which cubie needs to be rotated for animation
      if (abs(cube.cubies[i].x)  > 0 &&  cube.cubies[i].x == currentMove.x)
      {
        rotateX(currentMove.angle);
      }
      else if (abs(cube.cubies[i].y) > 0 &&  cube.cubies[i].y == currentMove.y)
      {
        rotateY(currentMove.angle);
      }
      else if (abs(cube.cubies[i].z) > 0 &&  cube.cubies[i].z == currentMove.z)
      {
        rotateZ(currentMove.angle);
      }
      cube.cubies[i].show();
      popMatrix();
    }
  }

}

// User specified input
void keyPressed()
{
  if (key == 'L')
  {
    currentMove = mL;
    currentMove.start();
  }
  else if (key == 'R')
  {
    currentMove = mR;
    currentMove.start();
  }
  else if (key == 'U')
  {
    currentMove = mU;
    currentMove.start();
  }
  else if (key == 'D')
  {
    currentMove = mD;
    currentMove.start();
  }
  else if (key == 'B')
  {
    currentMove = mB;
    currentMove.start();
  }
  else if (key == 'F')
  {
    currentMove = mF;
    currentMove.start();
  }
  else if (key == 'l')
  {
    currentMove = mLp;
    currentMove.start();
  }
  else if (key == 'r')
  {
    currentMove = mRp;
    currentMove.start();
  }
  else if (key == 'u')
  {
    currentMove = mUp;
    currentMove.start();
  }
  else if (key == 'd')
  {
    currentMove = mDp;
    currentMove.start();
  }
  else if (key == 'b')
  {
    currentMove = mBp;
    currentMove.start();
  }
  else if (key == 'f')
  {
    currentMove = mFp;
    currentMove.start();
  }
  // scramble mode
  else if (key == ' ')
  {
    scramble = true;
    currentMove = moves.get(counter);
    currentMove.start();
  }
  
}
