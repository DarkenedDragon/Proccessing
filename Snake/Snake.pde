
SnakeObject snake = new SnakeObject();

void setup(){
  size(900, 900);
  frameRate(5);
}
void draw(){
  background(0);
  snake.move();

  //snake.updateSnake();
  //snake.show();
}