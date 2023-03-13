// Represents a single cubie
class Cubie
{
  int x, y, z;
  Face[] faces = new Face[6];
  
  // Each cubie is centered at a point and has a collection of 6 faces
  Cubie(int x, int y, int z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
    
    // left face
    faces[0] = new Face(-1, 0, 0, L);
    // right face
    faces[1] = new Face(1, 0, 0, R);
    // up face
    faces[2] = new Face(0, -1, 0, U);
    // down face
    faces[3] = new Face(0, 1, 0, D);
    // back face
    faces[4] = new Face(0, 0, -1, B);
    // front face
    faces[5] = new Face(0, 0, 1, F);
  }
  
  // To rotate a cubie 90 degrees the following matrix math is used
  void rotate(char axis, int direction)
  {
    PMatrix2D plane = new PMatrix2D();
    
    if (axis == 'x')
    {
      plane.rotate(-direction * PI/2);
      plane.translate(z, y);
      z = round(plane.m02);
      y = round(plane.m12);
      
      
    }
    else if (axis == 'y')
    {
      plane.rotate(-direction * PI/2);
      plane.translate(x, z);
      x = round(plane.m02);
      z = round(plane.m12);
    }
    else
    {
      plane.rotate(direction * PI/2);
      plane.translate(x, y);
      x = round(plane.m02);
      y = round(plane.m12);
    }
    
    for(int i = 0; i< faces.length; i++)
    {
      faces[i].rotate(axis, direction);
    }
  }
  
  void show()
  {
    pushMatrix();
    translate(x, y, z);
    strokeWeight(0.1);
    
    for (int i = 0; i < faces.length; i++)
    {
      faces[i].show();
    }
    
    popMatrix();
    
  }
}
