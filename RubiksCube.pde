// Represents a 3 x 3 Rubik's cube
class RubiksCube
{
  // 3 x 3 x 3 individual cubies
  Cubie[] cubies = new Cubie[27];
  
  RubiksCube()
  {
    // Each cubie is centered at a point in 3D space
    int counter = 0;
    for (int x = -1; x <= 1; x++)
    {
      for (int y = -1; y <= 1; y++)
      {
        for (int z = -1; z <=1; z++)
        {
          Cubie cube = new Cubie(x, y, z);
          cubies[counter] = cube;
          counter++;
        }
      }
    } 
    
  }
  
  // A Rubik's cube can rotate each of its faces forwards or backwards
  void rotateFace(char face, int direction)
  {
    char axis = 'L';
    int coordinate = -1;
    
    switch(face)
    {
      // The left face needs to be rotated
      case 'L':
        // The left face is by definition the collection of
        // cubies whose x coordinate is -1
        // a rotation of the left face corresponds to a rotation about the x-axis
        coordinate = -1;
        axis = 'x';
        break;
      case 'R': 
        coordinate = 1;
        axis = 'x';
        break;
      case 'U': 
        coordinate = -1;
        axis = 'y';
        break;
      case 'D': 
        coordinate = 1;
        axis = 'y';
        break;
      case 'B': 
        coordinate = -1;
        axis = 'z';
        break;
      case 'F': 
        coordinate = 1;
        axis = 'z';
        break;
      default:
        break;
    }
    
    // Now that we have an axis and coordinate on that axis we can rotate those cubies individually
    for (int i = 0; i < cubies.length; i++)
    {
      if (axis == 'x')
      {
        if (cubies[i].x == coordinate)
        {
          cubies[i].rotate(axis, direction);
        }
      }
      else if (axis == 'y')
      {
        if (cubies[i].y == coordinate)
        {
          cubies[i].rotate(axis, direction);
        }
      }
      else
      {
        if (cubies[i].z == coordinate)
        {
          cubies[i].rotate(axis, direction);
        }
      }
    }
    
  }
  
  void show()
  {
    for (int i = 0; i < cubies.length; i++)
    {
      cubies[i].show();
    }
    
  }
  
}
