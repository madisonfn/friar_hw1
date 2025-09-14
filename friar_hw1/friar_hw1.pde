final int numShape = 50; //number of ellipses
Shape[] shapes; //array for the class we assigned
color c = #FFFDD0; //setting color variables
color b = #B4C424; 

void setup() {
  size(600, 400);
  shapes = new Shape[numShape]; //fills the array with the 50 ellipses
  
  //loops through all 50 ellipses and runs through the shape class each time
  for (int i = 0; i < numShape; i++) {
    shapes[i] = new Shape();
  }
}

void draw() {
  background(c); //color variable c

  //draw connecting lines
  stroke(b); //color variable b
  strokeWeight(2);
  
  for (int i = 0; i < 50 - 1; i++) {  //loops through 0-49 ellipses
    line(shapes[i].x, shapes[i].y, shapes[i+1].x, shapes[i+1].y);
    //draws a line from the center of the .x & .y (x and y coordinate) of the
    //ellipse. The +1 makes it so that the line connects to the coordinates
    //of the next circle in the array
}
  //finally displays the ellipses
  for (Shape s : shapes) { //loop for each element in the shape array
    s.update(); //calls the defined update method
    s.display(); //calls the defined display method
  }

  //instruction text
  float x = mouseX;
  float y = mouseY;

  fill(0);
  textSize(20);
  text("Click to change colors", x, y);
  text("Space bar to change orientation", x, y-30);
}

//creates the interaction when mouse is pressed
void mousePressed() {
  for (Shape s : shapes) {
    s.setNewTargetColor();
  }
}

//creates the interaction when key is pressed
void keyPressed() {
  if (key == ' ') {  // check if space bar is pressed
    for (Shape s : shapes) {
      s.x = random(width);
      s.y = random(height);
    }
  }
}
