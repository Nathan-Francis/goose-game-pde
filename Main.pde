Goose goose;
ArrayList<Dot> dots;
float initialDotX = 600;
float initialDotY = 400;
float dotSpeed = 2;
float spawnDistance = 100;
boolean dotSpawned = false; // Flag to track if a new dot has been spawned
boolean gameOver = false;

void setup()
{
  // Draw canvas
  size(1200, 800);
  // Initialise Goose object and an empty ArrayList to store Dot objects
  goose = new Goose(320, 180, 5);
  dots = new ArrayList<Dot>();
  // Add the first Dot object
  dots.add(new Dot(initialDotX, initialDotY, dotSpeed));
}

void draw()
{
  if (!gameOver)
  {
    background(50);
    drawSpawnBox();
    goose.gooseMovement();
    
    // Reset the flag for each frame
    boolean anyDotWithinSpawnDistance = false;

    for (int i = 0; i < dots.size(); i++)
    {
      // Draw the Dots to the screen, and follow the Goose coordinates
      Dot dot = dots.get(i);
      dot.chaseGoose(goose.xPos, goose.yPos);
      dot.drawDot();

      // Set flag when Dot is less than or equal to the spawnDistance from the Goose
      if (dist(dot.xPos, dot.yPos, goose.xPos, goose.yPos) <= spawnDistance)
      {
        anyDotWithinSpawnDistance = true;
      }
      checkCollision(dot);
    }

    // Add new dot and set the dotSpawned flag to prevent multiple spawns
    if (anyDotWithinSpawnDistance && !dotSpawned)
    {
      dots.add(new Dot(initialDotX, initialDotY, dotSpeed));
      dotSpawned = true;
    }
    // Reset the dotSpawned flag when no dots are within spawnDistance
    else if (!anyDotWithinSpawnDistance)
    {
      dotSpawned = false;
    }
  }
}

// Method to draw a rectangle around the centre of the spawn point, QoL feature for player experience
void drawSpawnBox()
{
  stroke(255, 0, 0);
  noFill();
  rect(initialDotX - 10, initialDotY - 10, 20, 20);
  noStroke();
}

// Method to calculate the distance between the Goose and the ArrayList of Dots
void checkCollision(Dot dot)
{
  float distance = dist(goose.xPos, goose.yPos, dot.xPos, dot.yPos);
  float collisionDistance = 50;

  // Display game over message to player and stop the Draw() from looping
  if (distance <= collisionDistance)
  {
    gameOver = true;
    noLoop();
    displayGameOverMessage();
  }
}

// Method to handle key presses for a game over
void keyPressed()
{
  if (gameOver)
  {
    if (key == 'y' || key == 'Y')
    {
      resetGame();
    }
    else if (key == 'n' || key == 'N')
    {
      exit();
    }
  }
}

// Method to display the game over message
void displayGameOverMessage()
{
  background(50);
  fill(255, 200, 200);
  textSize(32);
  textAlign(CENTER);
  text("The Aston goose was caught!", width / 2, height / 2 - 20);
  text("Do you want to play again? (Press 'y' or 'n')", width / 2, height / 2 + 20);
}

// Method to reset the game
void resetGame()
{
  goose = new Goose(320, 180, 5);
  dots = new ArrayList<Dot>();
  dots.add(new Dot(initialDotX, initialDotY, dotSpeed));
  dotSpawned = false;
  gameOver = false;
  loop();
}
