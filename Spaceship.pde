public class Spaceship
{
  private int thrustY = 807;
  
  private int y = 775;
  
  private int orangeWidth = 20;
  private int orangeHeight = 50;
  
  private int boosterWidth = 7;
  private int boosterHeight = 30;
  
  private int mainSpaceshipWidth = 10;
  private int mainSpaceshipHeight = 40;
  
  private int turboWidth = 10;
  private int turboHeight = 3;
  
  private int thrustWidth = 10;
  private int thrustHeight = 10;
  private int thrustBlue = 0;
  private int thrustRed = 255;
  private int transparency = 255;
  
  private int speed = 0;
  
  private int score = 0;
  
  public void display()
  {
    // Orange Rocket of Spaceship
    fill(#FF6600);
    rectMode(CENTER);
    noStroke();
    rect(width/2, y, orangeWidth, orangeHeight);
    triangle(width/2 - (orangeWidth/2), y - (orangeHeight/2), width/2, y - 30, width/2 + (orangeWidth/2), y - (orangeHeight/2));
    
    // White Boosters of Spaceship
    fill(255);
    rect(width/2 + 13, y, boosterWidth, boosterHeight);
    triangle(width/2 + 10, y - (boosterHeight/2), width/2 + 13.5, y - 20, width/2 + 16.5, y - (boosterHeight/2));
    
    rect(width/2 - 13, y, 7, 30);
    triangle(width/2 - 10, y - (boosterHeight/2), width/2 - 13.5, y - 20, width/2 - 16.5, y - (boosterHeight/2));
    
    // Right Wing of Main Spaceship
    beginShape();
    fill(255);
    stroke(0);
    vertex(width/2 + 5, y - 5);
    vertex(width/2 + 8, y + 7);
    vertex(width/2 + 20, y + 20);
    vertex(width/2 + 5, y + 20);
    endShape();
    
    // Left Wing of Main Spaceship
    stroke(0);
    beginShape();
    vertex(width/2 - 5, y - 5);
    vertex(width/2 - 8, y + 7);
    vertex(width/2 - 20, y + 20);
    vertex(width/2 - 5, y + 20);
    endShape();
    
    // Main spaceship
    fill(255);
    stroke(255);
    rect(width/2, y, mainSpaceshipWidth, mainSpaceshipHeight);
    stroke(0);
    triangle(width/2 - (mainSpaceshipWidth/2), y - (mainSpaceshipHeight/2), width/2, y - 25, width/2 + (mainSpaceshipWidth/2), y - (mainSpaceshipHeight/2));
    stroke(255);
    line(width/2 - 4, y - 20, width/2 + 4, y - 20);
    
    // Turbo/boost
    stroke(0);
    fill(100);
    rect(width/2, y + 21, turboWidth, turboHeight);
  }
  
  public void move(int pace)
  {
    y = constrain(y, 25, 775);
    speed = pace;
    
    if (keyPressed && key == 'w')
    {
      y -= speed;
    }
    
    
    if (keyPressed && key == 's')
    {
      y += speed;
    }  
  }
  
  int getYPosition()
  {
    return y;
  }
  
  public void thrust(int pace)
  {
    thrustY = constrain(thrustY, 57, 807);
    int speed = pace;
    
    thrustBlue = constrain(thrustBlue, 0 , 255);
    transparency = constrain(transparency, 0, 255);
    thrustRed = constrain(thrustRed, 0, 255);
    
    noStroke();
    
    fill(thrustRed, 0, thrustBlue, transparency);
    
    int randomXMovement = int(random(-5, 5));
    int randomYMovement = int(random(-2, 2));
    ellipse(width/2, thrustY, thrustWidth + randomXMovement, thrustHeight + randomYMovement);
    
    if (keyPressed && key == 'w')
    {
      thrustY -= speed;
      transparency += 10;
      thrustBlue += 5;
      thrustRed -= 1;
      
    }
    
    else
    {
      thrustBlue -= 5;
      thrustRed += 5;
    }
    
    if (keyPressed && key == 's')
    {
      thrustY += speed;
      transparency -= 10;
    }
    
    else
    {
      transparency += 5;
    }
  }
  
  int getY()
  {
    return y;
  }
  
  public String topReached()
  {
    if (y < 27)
    {
      y = 775;
      thrustY = 807;
      score++;
    }
    
    String scoreString = str(score);
    return scoreString;
  }
}
