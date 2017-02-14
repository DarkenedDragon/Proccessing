
SnakeObject snake = new SnakeObject();

void setup(){
  size(900, 900);
  frameRate(10);
  //snake.food();
}
void draw(){
  background(0);
  snake.move();
  snake.food();
  
  //snake.updateSnake();
  //snake.show();
}