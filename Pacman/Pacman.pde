void setup(){
   size(600, 600);
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
  
  rect(0, height/3, width/4, -10);
  rect(0, 2*(height/3), width/4, -10);
  rect(width, height/3, -width/4, -10);
  rect(width, 2*(height/3), -width/4, -10);
  
  stroke(0,0,255);  
  fill(0,0,255);
}