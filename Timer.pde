public class Timer
{
  private float time;

  public Timer(float setTime)
  {
    time = setTime;
  }

  public void setTime(float setTime)
  {
    time = setTime;
  }

  public void countDown()
  {
    time -= 1/frameRate;
  }
  
  public void countUp()
  {
    time += 1/frameRate;
  }
  
  public float getTime()
  {
    return time;
  }
  
  public float stopTime()
  {
    time += 1/frameRate;
    time -= 1/frameRate;
    
    return time;
  }
}
