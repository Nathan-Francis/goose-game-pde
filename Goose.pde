class Goose
{
  private float xPos, yPos;
  private float speed;

  // Constructor for the Goose object
  Goose(float x, float y, float s)
  {
    this.xPos = x;
    this.yPos = y;
    this.speed = s;
  }

  // Method to handle Goose object movement
  void gooseMovement()
  {
    if (keyPressed)
    {
      if (keyCode == RIGHT) moveRight();
      else if (keyCode == LEFT) moveLeft();
      else if (keyCode == UP) moveUp();
      else if (keyCode == DOWN) moveDown();
    }
    else drawGooseFwd();
    
    // Goose wraps around the canvas
    if (xPos > width) xPos = 0;
    else if (xPos < 0) xPos = width;

    if (yPos > height) yPos = 0;
    else if (yPos < 0) yPos = height;
  }

  // Method to call the right facing function and right movement
  void moveRight()
  {
    drawGooseRight();
    xPos += speed;
  }

  // Method to call the left facing function and left movement
  void moveLeft()
  {
    drawGooseLeft();
    xPos -= speed;
  }

  // Method to call the forward facing function and upward movement
  void moveUp()
  {
    drawGooseFwd();
    yPos -= speed;
  }

  // Method to call the forward facing function and downward movement
  void moveDown()
  {
    drawGooseFwd();
    yPos += speed;
  }

  // Method to call the draw functions for the Goose forward facing
  void drawGooseFwd()
  {
    drawGooseBody(xPos, yPos, xPos, yPos - 40, xPos - 20, yPos + 30, xPos + 20, yPos + 30);
    drawBeak(xPos - 10, yPos - 30, xPos + 10, yPos - 30, xPos, yPos - 10);
  }

  // Method to call the draw functions for the Goose right facing
  void drawGooseRight()
  {
    drawGooseBody(xPos, yPos, xPos + 40, yPos, xPos - 20, yPos + 30, xPos + 20, yPos + 30);
    drawBeak(xPos + 50, yPos - 10, xPos + 50, yPos + 10, xPos + 70, yPos);
  }

  // Method to call the draw functions for the Goose left facing
  void drawGooseLeft()
  {
    drawGooseBody(xPos, yPos, xPos - 40, yPos, xPos - 20, yPos + 30, xPos + 20, yPos + 30);
    drawBeak(xPos - 50, yPos - 10, xPos - 50, yPos + 10, xPos - 70, yPos);
  }

  // Method to draw the Goose Body, Head and Feet
  void drawGooseBody(
    float bodyX, 
    float bodyY, 
    float headX, 
    float headY, 
    float leftFootX, 
    float leftFootY, 
    float rightFootX, 
    float rightFootY
  )
  {
    // Body
    fill(255);
    ellipse(bodyX, bodyY, 100, 50);

    // Head
    ellipse(headX, headY, 40, 40);
    
    // Feet
    fill(255, 180, 0);
    ellipse(leftFootX, leftFootY, 20, 10);
    ellipse(rightFootX, rightFootY, 20, 10);
  }

  // Method to draw the Goose Beak
  void drawBeak(float x1, float y1, float x2, float y2, float x3, float y3)
  {
    fill(255, 200, 0);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}
