// bobbymtz
// 05/22/2022

import peasy.*;
PeasyCam cam;

int dimension = 3;

Cubie[] cubes = new Cubie[dimension * dimension * dimension];

// ORANGE
final color B = color(255, 85, 37);
// RED
final color F = color(137, 18, 20);
// WHITE
final color U = color(255, 255, 255);
// YELLOW
final color D = color(254, 213, 47);
// GREEN
final color R = color(25, 155, 76);
// BLUE
final color L = color(13, 72, 172);

void setup() 
{
  // Initial window size
  // P3D is used to call the 3D renderer
  size(800, 600, P3D);
  
  // Initializing the camera for easy viewing
  // Look at x, y, z, distance from look at point
  cam = new PeasyCam(this, 0, 0, 0, 100);
  
  // This loop gets the initial vector positions and makes Cubies
  int index = 0;
  for (int i = -1; i <= 1; i++)
  {
    for (int j = -1; j <= 1; j++)
    {
      for (int k = -1; k <= 1; k++)
      {
        PVector center = new PVector(i, j, k);
        Cubie cube = new Cubie(center);
        cubes[index] = cube;
        index++;
      }
    }
  }
}

// Turning function
void turn(char letter)
{
  char axis;
  int direction;
  int index;
  
  switch(letter) 
  {
    case 'L':
      axis = 'x';
      direction = 1;
      index = -1;
      break;
    case 'l':
      axis = 'x';
      direction = -1;
      index = -1;
      break;
    case 'R':
      axis = 'x';
      direction = -1;
      index = 1;
      break;
    case 'r':
      axis = 'x';
      direction = 1;
      index = 1;
      break;
    case 'U':
      axis = 'y';
      direction = 1;
      index = -1;
      break;
    case 'u':
      axis = 'y';
      direction = -1;
      index = -1;
      break;
    case 'D':
      axis = 'y';
      direction = -1;
      index = 1;
      break;
    case 'd':
      axis = 'y';
      direction = 1;
      index = 1;
      break;
    case 'F':
      axis = 'z';
      direction = 1;
      index = 1;
      break;
    case 'f':
      axis = 'z';
      direction = -1;
      index = 1;
      break;
    case 'B':
      axis = 'z';
      direction = -1;
      index = -1;
      break;
    case 'b':
      axis = 'z';
      direction = 1;
      index = -1;
      break;
    default:
      axis = 'N';
      direction = 1;
      index = -1;
  }
  
  // LR
  if (axis == 'x')
  {
    for (int i = 0; i < cubes.length; i++)
    {
      if (cubes[i].center.x == index)
      {
        cubes[i].rotate(axis, direction);
      }
    }
  }
  // UD
  else if (axis == 'y')
  {
    for (int i = 0; i < cubes.length; i++)
    {
      if (cubes[i].center.y == index)
      {
        cubes[i].rotate(axis, direction);
      }
    }    
  }
  // FB
  else if (axis == 'z')
  {
    for (int i = 0; i < cubes.length; i++)
    {
      if (cubes[i].center.z == index)
      {
        cubes[i].rotate(axis, direction);
      }
    }    
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
  
  // Axis
  strokeWeight(1);
  
  // X+
  stroke(255, 0, 0);
  line(0, 0, 0, 100, 0, 0);
  // Y+
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 100, 0);
  // Z+
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 100);
  
  stroke(0, 0, 0);
  
  pushMatrix();
  translate(0,-2,0);
  for (int i = 0; i < cubes.length; i++)
  {
    cubes[i].show();
  }
  popMatrix();
}

// User input
void keyPressed()
{
  turn(key);
}
