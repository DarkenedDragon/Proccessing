void setup(){
   size(800, 800);
}

void draw(){
  background(0);
  field();
}
void field(){
  //makes the edges of the field
  rect(0, 0, width, 10);//top edge
  rect(0, 0, 10, height/3);//top left edge
  rect(width-10, 0, 10, height/3);//top right edge
  rect(0, height-10, width, height);//bottom edge
  rect(0, height, 10, -height/3);//bottom left edge
  rect(width-10, height, 10, -height/3);//bottom right edge
  
  rect(0, height/3, width/4, -10);//top left intrusion
  rect(0, 2*(height/3), width/4, -10);//botton left intrusion
  rect(width, height/3, -width/4, -10);//top right intrusion
  rect(width, 2*(height/3), -width/4, -10);//bottom right intrusion
  
  rect(width/4, height/3-10, 10, height/8);//top left down
  rect(width/4, 2*(height/3), 10, -height/8);//bottom left up
  rect(3*(width/4), height/3 -10, 10, height/8);//top right down
  rect(3*(width/4), 2*(height/3), 10, -height/8);//bottom right up
  
  //and back again
  rect(width/4, 3*(height/7), -width/4, 10);//top left
  rect(width/4, height - (3*(height/7)+20), -width/4, 10);//bottom left
  rect(width - width/4, 3*(height/7), width/4, 10);//top right
  rect(width - width/4, height - (3*(height/7)+20), width/4, 10);//bottom right

  stroke(0,0,255);  
  fill(0,0,255);
}