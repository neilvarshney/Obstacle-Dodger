// Obstacle Dodger

// This program is a mini game in which you control a spaceship that is only able to move vertically up or down with 'W' or 'S' on your keybaord. The main goal
// is to reach the top of the window to gain points before the timer ends, but there are obstacles you must dodge. There is also a 'power up' which can either
// make or break you. There are 3 levels of difficulty -- easy, medium, and hard. The speed of the spaceship, speed of the obstacles, and number of the obstacles
// vary depending on the difficulty chosen. 

// Neil Varshney

// Januray 20, 2022



import java.util.ArrayList;
// This imports the array list class which make me able to use array lists. The main purpose of this in this program is for me to be able to add and remove elements from an array.

ArrayList<Obstacles> obstacle = new ArrayList<Obstacles>();
// This creates an array list with the name of "obstacle". This array list will hold elements of the "Obstacles" class.

Spaceship spaceship = new Spaceship();
// This creates an reference variable for the "Spaceship" class. The variable is named "spaceship".

Timer startTimer;
// This creates, but does not initialize, a reference variable for the "Timer" class. The reference variable has a name of "startTimer".

boolean playButton = false;
// This variable of boolean type will hold 'true' if the play button is pressed, or 'false' if it is not pressed. It initially starts
// off at false becuase it has not been pressed yet.

boolean easyMode = false;
boolean mediumMode = false;
boolean hardMode = false;
// These variables of boolean type will hold 'true' if the corresponding difficulty buttons are pressed, or 'false' if they are not pressed. They initially start
// off at false becuase they have not been pressed yet.

int playButtonWidth = 200;
int playButtonHeight = 100;
// These variables are the dimensions of the play button. These variables will be sent to the button function
// to create a button of these dimensions.

int easyButtonWidth = 100;
int easyButtonHeight = 50;
// These variables are the dimensions of the easy difficulty button. These variables will be sent to the button function
// to create a button of these dimensions.

int mediumButtonWidth = 100;
int mediumButtonHeight = 50;
// These variables are the dimensions of the medium difficulty button. These variables will be sent to the button function
// to create a button of these dimensions.

int hardButtonWidth = 100;
int hardButtonHeight = 50;
// These variables are the dimensions of the hard difficulty button. These variables will be sent to the button function
// to create a button of these dimensions.

int easySpeed = 15;
int mediumSpeed = 10;
int hardSpeed = 5;
// These are the variables that hold the speed of the spaceship for the corresponding difficulties.

boolean obstacleHit = false;
// This boolean type variable holds whether the spaceship is hit by an obstacle or not. If the spaceship
// were to get hit by an obstacle, the obstacleHit variable would equal true. This will be shown 
// in the lines of code below.

int colour = 0;
// This variable holds the value of the red value and alpha value for the game over text. It starts of at 0
// and when the function is called, it increments, creating a fade in effect on the text.

int yPos;
// This variable will hold the y-position of the spaceship so it can be given to other functions to do calculations.

String score;
// This variable, of string type, will hold the score, which is the amount of times the user has reached the top
// of the window.

String difficulty;
// A string type variable that holds the difficulty level chosen by which button the user has clicked.

int time;
// This variable will get the time from the 'Timer' class and send it to the 'currentTime' variable below.
// This 'time' variable is used in a function in the main class which gets its value from the 'Timer' class
// and returns its value to the 'currentTime' variable so it can be used in the draw() function.

int currentTime;
// A integer variable that holds the value of the time. This variable will be used to display the time.

boolean noTime = false;
// A boolean variable that tell whether the time has ran out, by equalling 0, or not by being true or false.

int PowerUpXPosition = int(random(10, 790));
int PowerUpYPosition = int(random(10, 700));
// This creates a random x and y position between 10 and 790 of the power up obstacle in the window. The values are then stored
// in the corresponding variables.

int powerUpSpeed = 10;
// This variable hold the speed of the power up obstacle. The speed is always the same.

boolean powerUpHit = false;
// This variable detrermines whether the power up has hit the spaceship or not by the value it holds. It satrts off at false
// but can change if the power up were to touch the ship.


void setup()
// This function runs only once.
{
  size(800, 800);
  // This creates a window of 800 pixels wide and 800 pixels long.
  
  startTimer = new Timer(30);
  // This initializes the startTimer variable which was created earlier. It sends the contructor of the
  // 'Timer' class a value of 30. This means the time starts at 30 seconds.
}


void draw()
{
  background(#58F8FF);
  // This creates a light blue background.

  title();
  // This calls the 'title' function which displays the title.
  
  gameInstructions();
  // This calls the 'gameInstructions' function which displays the text about the instructions of the mini game.
  
  spaceship.display();
  // This calls the display function from the 'Spaceship' class using the reference variable which was created earlier.
  // This displays the spaceship.

  button(width/2, height/2, playButtonWidth, playButtonHeight, "Play", 66, 184, 193, 24);
  // This creates the play button by sending dimensions, rgb values, and text to the button function.

  playButtonPressed();
  // This calls the 'playButtonPressed' function which determines whether the mouse has been pressed in the area of the play button.
  // If it has, it changes the value of the global variable 'playButton' to true.
  
  if (playButton)
  // If the 'playButton' variable is true, it runs the block of code below.
  {
    background(#FF58BC);
    // This creates a pink-ish background.
    
    spaceship.display();
    // This calls the display function from the 'Spaceship' class using the reference variable which was created earlier.
    // This displays the spaceship.
    
    difficultyInstructions();
    // This calls the 'difficultyInstructions' function which displays text to the user to choose their difficulty level.

    button(200, 600, easyButtonWidth, easyButtonHeight, "Easy", 0, 200, 0, 24);
    button(400, 600, mediumButtonWidth, mediumButtonHeight, "Medium", 0, 0, 200, 24);
    button(600, 600, hardButtonWidth, hardButtonHeight, "Hard", 200, 0, 0, 24);
    // This creates 3 buttons with same dimensions and y positons, but different x posiotions, color, and text. Each button represents a difficulty level.

    easyMode = easy();
    // If the mouse is pressed in the area of the easy button, the 'easyMode' variable will equal true. The 'easy()" function
    // will determine if the mouse is pressed in the area of the easy button and return true if it is or false if it is not. That
    // values will be sent to the 'easyMode' variable.
    
    if (easyMode)
    // If 'easyMode' is true, then the block of code below will run.
    {
      difficulty = "e";
      // The 'difficulty' variable will equal a value of 'e' (String).
      
      spaceshipFunctions(easySpeed);
      // This calls the 'spaceshipFunctions' function and sends it a value of 'easySpeed'. This basically
      // makes it so the spaceship is now able to move if 'W' or 'S' is touched at a speed of the whatever
      // the value 'easySpeed' holds. It also displays the spaceship and the thrust.
      
      for (int i = 0; i < 10; i++)
      // This loop will iterate 10 times, meaning 10 obstacles will be created.
      {
        if (obstacleHit == false)
        // If the value of 'obstacleHit' is false, meaning if no obstacles have hit the spaceship,
        // then the block of code below will run.
        {
          obstacle.add(new Obstacles(5));
          // This adds new elements/objects of the Obstacles class to the array list called 'obstacle' with. The obstacles
          // will have the speed of the parameter, which is 5.
          
          Obstacles obstacles = obstacle.get(i);
          // This gets the element that is in the index of 'i' in the arrayList and assigns it to the 'obstacles' variable.
          // The 'obstacle' variable holds a class object.
          
          obstacles.display();
          // That class object calls the function to be 'display' from the 'Obstacles' class to display the obsatcle.
          
          obstacles.move();
          // That class object calls the function to be 'move' from the 'Obstacles' class to move the obstacle.
          
          obstacles.bounce(difficulty);
          // That class object is then given the function to be bounced when it hits the edges from the 'Obstacles' class. It is given the
          // String type variable 'difficulty' because the speed changes differently when it hits the edges depending on difficulty level
          
          yPos = spaceship.getY();
          // The y position of the spaceship is given to the 'yPos' variable by the 'getY()' function from the 'Spaceship' class which return the y position of the spaceship.
          
          obstacleHit = obstacles.hitObstacle(yPos);
          // The 'hitObstacle' function is called by the class object with parameters of the y position of the ship. This function will determine whether the obstacles position
          // is in the hitbox of the spaceship. It will return true or false and assign that value to 'obstacleHit'.
          
          score = spaceship.topReached();
          // The 'topReached' function is called by the class object which determines when the spaceship reaches the top and returns the amount of times
          // it has done so. That value gets assigned to 'score'.
          
          displayScore(score);
          // This function displays the score.
        }

        if (obstacleHit == true)
        // If the 'obstacleHit' variable is true, the block of code below will run.
        {
          for (int j = 0; j < obstacle.size(); j++)
          // This for loop iterates the amount of times as there are elements in the 'obstacle' array list.
          {
            obstacle.remove(j);
            // This removes all the elements in the array list.
          }
          colour = gameOver(colour);
          // This calls the 'gameOver' function and gives the parameters of the variable 'color'. The function then
          // returns the same value but incremented by 1. That value is then assigned to the same variable but is now
          // increased by 1. This causes the fade in effect by decreasing the transparency and increasing the red-ness.
        }
      } 
      
      powerUp();
      // This calls the 'powerU'p function which creates the power up obstacle and moves it and determines
      // whether the ship has touched it or not to do further action.
      
      currentTime = displayTimer();
      // The 'displayTimer' function counts down from 30 and returns the current time. That value is assigned to the
      // 'currentTime' variable.

      if (currentTime <= 0 || obstacleHit == true)
      // If the 'currentTime' were to equal 0, or 'obstacleHit' were to be true, the the block of code below will run.
      {
        colour = gameOver(colour);
        // This calls the 'gameOver' function and gives the parameters of the variable 'color'. The function then
        // returns the same value but incremented by 1. That value is then assigned to the same variable but is now
        // increased by 1. This causes the fade in effect by decreasing the transparency and increasing the red-ness.
      }
    }

    mediumMode = medium();
    // If the mouse is pressed in the area of the medium button, the 'mediumMode' variable will equal true. The 'medium()" function
    // will determine if the mouse is pressed in the area of the medium button and return true if it is or false if it is not. That
    // values will be sent to the 'mediumMode' variable.
    
    if (mediumMode)
    // If 'mediumMode' is true, then the block of code below will run.
    {
      difficulty = "m";
      // The 'difficulty' variable will equal a value of 'm' (String).
      
      spaceshipFunctions(mediumSpeed);
      // This calls the 'spaceshipFunctions' function and sends it a value of 'mediumSpeed'. This basically
      // makes it so the spaceship is now able to move if 'W' or 'S' is touched at a speed of the whatever
      // the value mediumSpeed' holds. It also displays the spaceship and the thrust.
      
      for (int i = 0; i < 15; i++)
      // This loop will iterate 15 times, meaning 15 obstacles will be created.
      {
        if (obstacleHit == false)
        // If the value of 'obstacleHit' is false, meaning if no obstacles have hit the spaceship,
        // then the block of code below will run.
        {
          obstacle.add(new Obstacles(10));
          // This adds new elements/objects of the Obstacles class to the array list called 'obstacle' with. The obstacles
          // will have the speed of the parameter, which is 10.
          
          Obstacles obstacles = obstacle.get(i);
          // This gets the element that is in the index of 'i' in the arrayList and assigns it to the 'obstacles' variable.
          // The 'obstacle' variable holds a class object.
          
          obstacles.display();
          // That class object calls the function to be 'display' from the 'Obstacles' class to display the obsatcle.
          
          
          obstacles.move();
          // That class object calls the function to be 'move' from the 'Obstacles' class to move the obstacle.
          
          obstacles.bounce(difficulty);
          // That class object is then given the function to be bounced when it hits the edges from the 'Obstacles' class. It is given the
          // String type variable 'difficulty' because the speed changes differently when it hits the edges depending on difficulty level
          
          yPos = spaceship.getY();
          // The y position of the spaceship is given to the 'yPos' variable by the 'getY()' function from the 'Spaceship' class which return the y position of the spaceship.
          
          obstacleHit = obstacles.hitObstacle(yPos);
          // The 'hitObstacle' function is called by the class object with parameters of the y position of the ship. This function will determine whether the obstacles position
          // is in the hitbox of the spaceship. It will return true or false and assign that value to 'obstacleHit'.
          
          score = spaceship.topReached();
          // The 'topReached' function is called by the class object which determines when the spaceship reaches the top and returns the amount of times
          // it has done so. That value gets assigned to 'score'.
          
          displayScore(score);
          // This function displays the score
        }

        if (obstacleHit == true)
        // If the 'obstacleHit' variable is true, the block of code below will run.
        {
          for (int j = 0; j < obstacle.size(); j++)
          // This for loop iterates the amount of times as there are elements in the 'obstacle' array list.
          {
            obstacle.remove(j);
            // This removes all the elements in the array list.
          }
          colour = gameOver(colour);
          // This calls the 'gameOver' function and gives the parameters of the variable 'color'. The function then
          // returns the same value but incremented by 1. That value is then assigned to the same variable but is now
          // increased by 1. This causes the fade in effect by decreasing the transparency and increasing the red-ness.
        }
      }
      
      powerUp();
      // This calls the 'powerU'p function which creates the power up obstacle and moves it and determines
      // whether the ship has touched it or not to do further action.
      
      currentTime = displayTimer();
      // The 'displayTimer' function counts down from 30 and returns the current time. That value is assigned to the
      // 'currentTime' variable.

      if (currentTime <= 0 || obstacleHit == true)
      // If the 'currentTime' were to equal 0, or 'obstacleHit' were to be true, the the block of code below will run.
      {
        colour = gameOver(colour);
        // This calls the 'gameOver' function and gives the parameters of the variable 'color'. The function then
        // returns the same value but incremented by 1. That value is then assigned to the same variable but is now
        // increased by 1. This causes the fade in effect by decreasing the transparency and increasing the red-ness.
      }
    }
  }

    hardMode = hard();
    // If the mouse is pressed in the area of the hard button, the 'hardMode' variable will equal true. The 'hard()" function
    // will determine if the mouse is pressed in the area of the hard button and return true if it is or false if it is not. That
    // values will be sent to the 'hardMode' variable.
    
    if (hardMode)
    // If 'hardMode' is true, then the block of code below will run.
    {
      difficulty = "h";
      // The 'difficulty' variable will equal a value of 'h' (String).
      
      spaceshipFunctions(hardSpeed);
      // This calls the 'spaceshipFunctions' function and sends it a value of 'hardSpeed'. This basically
      // makes it so the spaceship is now able to move if 'W' or 'S' is touched at a speed of the whatever
      // the value mediumSpeed' holds. It also displays the spaceship and the thrust.
      
      for (int i = 0; i < 20; i++)
      // This loop will iterate 20 times, meaning 20 obstacles will be created.
      {
        if (obstacleHit == false)
        // If the value of 'obstacleHit' is false, meaning if no obstacles have hit the spaceship,
        // then the block of code below will run.
        {
          obstacle.add(new Obstacles(10));
          // This adds new elements/objects of the Obstacles class to the array list called 'obstacle' with. The obstacles
          // will have the speed of the parameter, which is 10.
          
          Obstacles obstacles = obstacle.get(i);
          // This gets the element that is in the index of 'i' in the arrayList and assigns it to the 'obstacles' variable.
          // The 'obstacle' variable holds a class object.
          
          obstacles.display();
          // That class object calls the function to be 'display' from the 'Obstacles' class to display the obsatcle.
          
          
          obstacles.move();
          // That class object calls the function to be 'move' from the 'Obstacles' class to move the obstacle.
          
          obstacles.bounce(difficulty);
          // That class object is then given the function to be bounced when it hits the edges from the 'Obstacles' class. It is given the
          // String type variable 'difficulty' because the speed changes differently when it hits the edges depending on difficulty level
          
          yPos = spaceship.getY();
          // The y position of the spaceship is given to the 'yPos' variable by the 'getY()' function from the 'Spaceship' class which return the y position of the spaceship.
          
          obstacleHit = obstacles.hitObstacle(yPos);
          // The 'hitObstacle' function is called by the class object with parameters of the y position of the ship. This function will determine whether the obstacles position
          // is in the hitbox of the spaceship. It will return true or false and assign that value to 'obstacleHit'.
          
          score = spaceship.topReached();
          // The 'topReached' function is called by the class object which determines when the spaceship reaches the top and returns the amount of times
          // it has done so. That value gets assigned to 'score'.
          
          displayScore(score);
          // This function displays the score
        }

        if (obstacleHit == true)
        // If the 'obstacleHit' variable is true, the block of code below will run.
        {
          for (int j = 0; j < obstacle.size(); j++)
          // This for loop iterates the amount of times as there are elements in the 'obstacle' array list.
          {
            obstacle.remove(j);
            // This removes all the elements in the array list.
          }
          colour = gameOver(colour);
          // This calls the 'gameOver' function and gives the parameters of the variable 'color'. The function then
          // returns the same value but incremented by 1. That value is then assigned to the same variable but is now
          // increased by 1. This causes the fade in effect by decreasing the transparency and increasing the red-ness.
        }
      }
      
      powerUp();
      // This calls the 'powerU'p function which creates the power up obstacle and moves it and determines
      // whether the ship has touched it or not to do further action.
      
      currentTime = displayTimer();
      // The 'displayTimer' function counts down from 30 and returns the current time. That value is assigned to the
      // 'currentTime' variable.

      if (currentTime <= 0 || obstacleHit == true)
      // If the 'currentTime' were to equal 0, or 'obstacleHit' were to be true, the the block of code below will run.
      {
        colour = gameOver(colour);
        // This calls the 'gameOver' function and gives the parameters of the variable 'color'. The function then
        // returns the same value but incremented by 1. That value is then assigned to the same variable but is now
        // increased by 1. This causes the fade in effect by decreasing the transparency and increasing the red-ness.
      }
    }
  }
  
  
  
  
  
void powerUp()
// When this function is called, the code below will run.
{
  int powerUpR = int(random(0, 255));
  int powerUpG = int(random(0, 255));
  int powerUpB = int(random(0, 255));
  fill(powerUpR, powerUpG, powerUpB);
  // This creates random r, g, and b values for the power up obstacle. This will create a 
  // fast pace rainbow effect.
  
  strokeWeight(3);
  // The boarder of the obsticle will have a weight of 3 pixels thick.
  
  ellipse(PowerUpXPosition, PowerUpYPosition, 20, 20);
  // This creates a circle of the 'PowerUpXPosition' and 'PowerUpYPosition' which were
  // initialized at the beginning of the program (random x and y values). The size of the obstacle is 20 pixels wide
  // and 20 pixels long.
  
  PowerUpXPosition += powerUpSpeed;
  // The x position of the power up obstacle will increase by 10 every time this function is called. This would
  // Make it seem like the power up obstacle is moving horizontally.
  
  if (PowerUpXPosition > 790)
  {
    powerUpSpeed = -powerUpSpeed;
    // If the x position of the power up obstacle were to be greater than 790, then the
    // obstacle will move in the opposite direction by making the 'powerUpSpeed' equal to the opposite
    // value than what it already is.
  }
      
  if (PowerUpXPosition < 10)
  {
    powerUpSpeed = -powerUpSpeed;
    // If the x position of the power up obstacle were to be less than 10, then the
    // obstacle will move in the opposite direction by making the 'powerUpSpeed' equal to the opposite
    // value than what it already is.
  }
  
  if (PowerUpXPosition > width/2 - 22 && PowerUpXPosition < width/2 + 22 && PowerUpYPosition > yPos - 40 && PowerUpYPosition < yPos + 33)
  // If the position of the power up obstacle were to touch the spaceship, the block of code will run when the function is called
  {
    int randomNum = int(random(0, 2));
    // This creates a random number between 0 and 1. This is because this random function generates a number
    // between 0 to 2, but never equalling 2. I then parse it to a int which essentially rounds it down. So the range 
    // is basically 0 to 1.
    
    if (randomNum == 0)
    // If the random number were to equal 0, then the block of code below will run.
    {
      easySpeed = 30;
      mediumSpeed = 20;
      hardSpeed = 10;
      // If the random number were to equal 0, the speed of which the spaceship moves at will increase to the corresponding amount
      // for the corresponding difficulty the user chose.
      
      startTimer.setTime(30);
      // The timer then resets back to 30 seconds, giving user more time.
    }
    
    else if (randomNum == 1)
    // If the random number were to equal 1, then the block of code below will run
    {
      easySpeed = 7;
      mediumSpeed = 5;
      hardSpeed = 2;
      // If the random number were to equal 1, the speed of which the spaceship moves at will decrease to the corresponding amount
      // for the corresponding difficulty the user chose.
      
      startTimer.setTime(10);
      // The timer then equal 10 seconds, giving user less time, or more time if they initially had less than 10 seconds.
    }
  }
}





int displayTimer()
// When this function is called, the block of code below will run.
{
  startTimer.countDown();
  // This starts the timer to count down from the set time which was 30.
  
  fill(#FFE090);
  // This creates a fill color for the text that will be created. The color is a yellow-ish color.
  
  textAlign(CENTER);
  // This alligns the text to be at the center of the x and y positions I give it.
  
  textSize(50);
  // This makes the text size to be 50 pixels.
  
  time = int(startTimer.getTime());
  // This gets the current time form the 'getTime()' function and gives it to
  // the 'time' variable. It is initially a float, so it is parsed to an int to
  // be displayed as a whole number.
  
  text(time, 700, 100);
  // This creates text of the time at an x position of 700 and y position of 100.

  return time;
  // This returns the value of 'time' when the function is called.
}





int gameOver(int colour)
{
  colour++;
  background(0);
  obstacleHit = true;
  textSize(70);
  PFont font;  
  font = loadFont("Bauhaus93-48.vlw");
  textFont(font);
  textAlign(CENTER);
  fill(colour, 0, 0);
  text("GAME OVER", width/2, height/2);
  
  fill(255, 255, 255, colour);
  textAlign(CENTER);
  textSize(40);
  text("Your score was: " + score, width/2, height/2 + 100);

  return colour;
}

void displayScore(String score)
{
  textSize(200);
  fill(150);
  PFont font;  
  font = loadFont("Bauhaus93-48.vlw");
  textFont(font);
  textAlign(CENTER);
  textSize(100);
  
  text(score, width/2, 100);
}


void spaceshipFunctions(int speed)
{
  background(#E0A7F0);
  spaceship.display();
  spaceship.move(speed);
  spaceship.thrust(speed);
}


boolean playButtonPressed()
{
  if (mousePressed && mouseX > width/2 - (playButtonWidth/2) && mouseX < width/2 + (playButtonWidth/2) && mouseY > height/2 - (playButtonHeight/2) && mouseY < height/2 + (playButtonHeight/2))
  {
    playButton = true;
  }
  return playButton;
}


boolean easy()
{
  if (mousePressed && mouseX > 200 - (easyButtonWidth/2) && mouseX < 200 + (easyButtonWidth/2)  && mouseY > 600 - (easyButtonHeight/2) && mouseY < 600 + (easyButtonHeight/2)) 
  {
    easyMode = true;
  }
  return easyMode;
}





boolean medium()
{
  if (mousePressed && mouseX > 400 - (easyButtonWidth/2) && mouseX < 400 + (easyButtonWidth/2)  && mouseY > 600 - (easyButtonHeight/2) && mouseY < 600 + (easyButtonHeight/2))
  {
    mediumMode = true;
  }
  return mediumMode;
}





boolean hard()
{
  if (mousePressed && mouseX > 600 - (easyButtonWidth/2) && mouseX < 600 + (easyButtonWidth/2)  && mouseY > 600 - (easyButtonHeight/2) && mouseY < 600 + (easyButtonHeight/2))
  {
    hardMode = true;
  }
  return hardMode;
}





void title()
{
  int r = int(random(0, 100));
  int g = int(random(0, 200));
  int b = int(random(0, 300));
  fill(r, g, b);
  textSize(70);
  text("OBSTACLE DODGER", width/2, 100);
  PFont font;  
  font = loadFont("Bauhaus93-48.vlw");
  textFont(font);
  textAlign(CENTER);
}



void gameInstructions()
{
  String instructions = "In this game, you will control a spaceship that only moves vertically with \n'W' or 'S' on your keyboard. You will have to dodge obstacles that are \ncoming in from the sides and reach the top to score points, BUT, there is a timer. \nYou should probably hit the GLOWING OBSTACLE to help you, or should you? ;) \n\n\nScore as many points as you can before the timer runs out!";
  fill(255);
  PFont font;  
  font = loadFont("Arial-Black-48.vlw");
  textFont(font);
  textAlign(CENTER);
  textSize(17);
  text(instructions, width/2, 200);
  
  textSize(30);
  String play = "Hit the play button above to continue!";
  fill(#FFFA58);
  text(play, width/2, 500);
}




void difficultyInstructions()
{
  String difficultyInstructions = "Choose Your Difficulty";
  fill(#6FFAD6);
  PFont font;  
  font = loadFont("Arial-Black-48.vlw");
  textFont(font);
  textAlign(CENTER);
  textSize(60);
  text(difficultyInstructions, width/2, height/2);
}




void button(float xPos, float yPos, float w, float h, String text, float r, float g, float b, float size)
{
  fill(0);
  rectMode(CENTER);

  fill(r, g, b);
  rect(xPos, yPos, w, h);

  fill(#FCC9FA);
  PFont font;  
  font = loadFont("Bauhaus93-48.vlw");
  textFont(font);
  textAlign(CENTER);
  textSize(size);
  text(text, xPos, yPos);
}
