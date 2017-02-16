
SnakeObject snake = new SnakeObject();

void setup(){
  //make size a multiple of scale
  size(800, 800);
  frameRate(10);
  //snake.food();
}
void draw(){ 
  if(snake.dead() == true){
  System.exit(0);
 }
  background(0);

  fill(0,0,255);
  stroke(0,0,255);
  rect(0, 0, width, snake.scale);
  rect(0, 0, snake.scale, height);
  rect(width, height, -width, -snake.scale);
  rect(width, height, -snake.scale, -height);
  stroke(0);
  fill(255);
  
  snake.move();
  snake.food();
  
  

}