// bobbymtz
// 05/22/2022

// Cubie is an individual cube in a Rubiks cube
class Cubie
{
  // This is a 3D vector to hold the center of the cube
  PVector center;
  
  Face[] faces = new Face[6];

  Cubie(PVector center)
  {
    this.center = center;
    // Left face
    faces[0] = new Face(new PVector(-1, 0, 0), L);
    // Right face
    faces[1] = new Face(new PVector(1, 0, 0), R);
    // Top face
    faces[2] = new Face(new PVector(0, -1, 0), U);
    // Bottom face
    faces[3] = new Face(new PVector(0, 1, 0), D);
    // Front face
    faces[4] = new Face(new PVector(0, 0, 1), F);
    // Back face
    faces[5] = new Face(new PVector(0, 0, -1), B);
    
  }
  
  void rotate(char axis, int direction)
  {
    int x, y;
    
    if (axis == 'x')
    {
      x = round(center.z);
      y = round(center.y);
        
      int xprime = round(x * cos(HALF_PI * direction) - y * sin(HALF_PI * direction));
      int yprime = round(x * sin(HALF_PI * direction) + y * cos(HALF_PI * direction));
        
      center = new PVector(center.x, yprime, xprime);
    }
    else if (axis == 'y')
    {
      x = round(center.x);
      y = round(center.z);
        
      int xprime = round(x * cos(HALF_PI * direction) - y * sin(HALF_PI * direction));
      int yprime = round(x * sin(HALF_PI * direction) + y * cos(HALF_PI * direction));
        
      center = new PVector(xprime, center.y, yprime);
    }
    else
    {
      x = round(center.x);
      y = round(center.y);
        
      int xprime = round(x * cos(HALF_PI * direction) - y * sin(HALF_PI * direction));
      int yprime = round(x * sin(HALF_PI * direction) + y * cos(HALF_PI * direction));
        
      center = new PVector(xprime, yprime, center.z);
    }
    
    for(int i = 0; i< faces.length; i++)
    {
      faces[i].rotate(axis, direction);
    }
  }
  
  void show()
  {
    pushMatrix();
    translate(center.x, center.y, center.z);
    
    for (int i = 0; i < faces.length; i++)
    {
      faces[i].show();
    }
    
    popMatrix();
  }
}
