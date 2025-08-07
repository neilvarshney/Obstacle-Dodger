public class Obstacles
{
  
  private int xPosition = int(random(0, 800));
  private int yPosition = int(random(0, 700));
  private int obstacleSpeed;
  
  private boolean hit = false;

  public Obstacles(int speed)
  {
    obstacleSpeed = speed;
  }

  public void display()
  {
    fill(67);
    stroke(0);
    strokeWeight(3);
    ellipse(xPosition, yPosition, 20, 20);
  }
  
  public void move()
  {
    xPosition += obstacleSpeed;
  }
  
  public void bounce(String level)
  {
    if (level == "e")
    {
      if (xPosition > 790)
      {
        obstacleSpeed = int(random(1, 10));
        obstacleSpeed = -obstacleSpeed;
      }
      
      if (xPosition < 10)
      
      {
        obstacleSpeed = int(random(-10, -1));
        obstacleSpeed = -obstacleSpeed;
      }
    }
    
    else if (level == "m")
    {
      if (xPosition > 790)
      {
        obstacleSpeed = int(random(6, 15));
        obstacleSpeed = -obstacleSpeed;
      }
      
      if (xPosition < 10)
      
      {
        obstacleSpeed = int(random(-15, -6));
        obstacleSpeed = -obstacleSpeed;
      }
    }
    
    else
    {
      if (xPosition > 790)
      {
        obstacleSpeed = int(random(11, 20));
        obstacleSpeed = -obstacleSpeed;
      }
      
      if (xPosition < 10)
      
      {
        obstacleSpeed = int(random(-20, -11));
        obstacleSpeed = -obstacleSpeed;
      }
    }
  }
  
  
  public boolean hitObstacle (int y)
  {
    if (xPosition > width/2 - 22 && xPosition < width/2 + 22 && yPosition > y - 40 && yPosition < y + 33)
    {
      hit = true;
    }
    return hit;
  }
}
