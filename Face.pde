// The face class is used to represent the cubies faces with color
class Face
{
  int x, y, z;
  color c;
  
  // Each face is centered along an axis and has a color
  Face(int x, int y, int z, color c)
  {
    this.x = x;
    this.y = y;
    this.z = z;
    this.c = c;
  }
  
  // The same rotation as for a cubie
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
    
  }
  
  void show()
  {
    pushMatrix();
    translate(0.5 * x, 0.5 * y, 0.5 * z);
  
    rectMode(CENTER);
    strokeWeight(0.5);
    stroke(0);
    fill(c);
    
    // Rotation depends on the axis
    if(abs(x) == 1)
    {
      rotateY(PI/2);
      square(0, 0, 1);
    }
    else if (abs(y) == 1)
    {
      rotateX(PI/2);
      square(0, 0, 1);
    }
    else
    {
      square(0, 0, 1);
    }
    
    popMatrix();
  }
}
