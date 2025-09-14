//setting the "cookie cutter" for shape
class Shape {
  float x, y, r; //sets the shapes position and radius
  color currentColor; //the color the circle starts as
  color targetColor; //the color the circle will become
  float blendAmount; //blend between colors
  
  Shape() { //runs when a new shape is created
    x = random(width); //random position
    y = random(height);
    r = random(30, 80); //random radius between these two constraints
    currentColor = randomColor(); //random color
    targetColor = currentColor; //starts as the currentColor
    blendAmount = 1;
  }
  
//update the color to blend into targetColor
  void update() {
    if (blendAmount < 1) {
      blendAmount += 0.01; //blend speed
    }
  }
  
  //lerpColor does the actual blending of the colors
  void display() {
  color c = lerpColor(currentColor, targetColor, blendAmount);
  fill(c);
  noStroke();
  ellipse(x, y, r, r); //draws circle with previously defined randomness

  // snap a point to nearest grid inside circle
  float gridSize = 5; //snaps the point to every 5th line in the grid
  float snappedX = round(x / gridSize) * gridSize; //takes the x and y of the circle
  float snappedY = round(y / gridSize) * gridSize; //then translates it into grid size and
                                                   //is multiplied to translate back to pixels
  stroke(b);       //make the point green from the CMYK
  strokeWeight(5); // thicker
  point(snappedX, snappedY);
}
  
  void setNewTargetColor() { //when mouse is pressed
    currentColor = lerpColor(currentColor, targetColor, blendAmount);
    targetColor = randomColor(); //assigns the targetColor to be random
    blendAmount = 0; //starts the color transition
  }
  
  //random color generator used in void setNewTargetColor
  color randomColor() {
    return color(random(255), random(255), random(255));
  }
}
