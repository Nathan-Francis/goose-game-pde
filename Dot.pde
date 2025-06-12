class Dot
{
  private float xPos, yPos;
  private float speed;

  // Constructor for the Dot object
  Dot(float x, float y, float s)
  {
    this.xPos = x;
    this.yPos = y;
    this.speed = s;
  }

  // Method to move the Dot towards the Goose
  void chaseGoose(float gooseX, float gooseY)
  {
    // Variables to track the Goose position, used for the Dot wrapping
    float adjustedGooseX = gooseX;
    float adjustedGooseY = gooseY;

    // Check if Goose is more than half the canvas width away from the Dot
    if (abs(gooseX - xPos) > width / 2)
    {
      // Adjust the position of the Goose
      if (gooseX > xPos) adjustedGooseX -= width;
      else adjustedGooseX += width;
    }

    // Check if Goose is more than half the canvas height away from the Dot
    if (abs(gooseY - yPos) > height / 2)
    {
      // Adjust the position of the Goose
      if (gooseY > yPos) adjustedGooseY -= height;
      else adjustedGooseY += height;
    }

    // Calculation for the angle between the Goose and Dot
    float angle = atan2(adjustedGooseY - yPos, adjustedGooseX - xPos);
    // Move the Dot towards the Goose
    xPos += cos(angle) * speed;
    yPos += sin(angle) * speed;

    // Dot wraps around the canvas
    if (xPos > width) xPos -= width;
    else if (xPos < 0) xPos += width;

    if (yPos > height) yPos -= height;
    else if (yPos < 0) yPos += height;
  }

  // Method to draw the Dot Object
  void drawDot()
  {
    fill(255, 0, 0);
    ellipse(xPos, yPos, 20, 20);
  }
}
