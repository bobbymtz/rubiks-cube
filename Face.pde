// bobbymtz
// 05/22/2022

class Face
{
  PVector normal;
  color c;
  
  Face(PVector normal, color c)
  {
    this.normal = normal;
    this.c = c;
  }
  
  void rotate(char axis, int direction)
  {
    int x, y;
    if (axis == 'x')
    {
      x = round(normal.z);
      y = round(normal.y);
        
      int xprime = round(x * cos(HALF_PI * direction) - y * sin(HALF_PI * direction));
      int yprime = round(x * sin(HALF_PI * direction) + y * cos(HALF_PI * direction));
        
      normal = new PVector(normal.x, yprime, xprime);
    }
    else if (axis == 'y')
    {
      x = round(normal.x);
      y = round(normal.z);
        
      int xprime = round(x * cos(HALF_PI * direction) - y * sin(HALF_PI * direction));
      int yprime = round(x * sin(HALF_PI * direction) + y * cos(HALF_PI * direction));
        
      normal = new PVector(xprime, normal.y, yprime);
    }
    else
    {
      x = round(normal.x);
      y = round(normal.y);
        
      int xprime = round(x * cos(HALF_PI * direction) - y * sin(HALF_PI * direction));
      int yprime = round(x * sin(HALF_PI * direction) + y * cos(HALF_PI * direction));
        
      normal = new PVector(xprime, yprime, normal.z);
    }    
  }
  
  void show()
  {
    pushMatrix();
    translate(0.5 * normal.x, 0.5 * normal.y, 0.5 * normal.z);
    rectMode(CENTER);
    strokeWeight(0.1);
    fill(c);
    
    if(abs(round(normal.x)) == 1)
    {
      rotateY(PI / 2);
      square(0, 0, 1);
    }
    else if (abs(round(normal.y)) == 1)
    {
      rotateX(PI / 2);
      square(0, 0, 1);
    }
    else
    {
      square(0, 0, 1);
    }
    popMatrix();
  }
}
