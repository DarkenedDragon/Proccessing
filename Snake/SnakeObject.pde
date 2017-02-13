class SnakeObject{
int x = width/2;
int y = height/2;
int xspeed;
int yspeed;
int scale = 20;
int[][] Snake = new int[][]{
  {0,0}
};
int snakeLength = 1;
void move(){
  switch(direction()){
    case 0://no key ditected
    xspeed = 0;
    yspeed = 0;
    break;
  
    case 1:
    xspeed = 0;
    yspeed = -scale;
    break;

    case 2:
    xspeed = scale;
    yspeed = 0;
    break;
    
    case 3:
    xspeed = 0;
    yspeed = scale;
    break;
    
    case 4:
    xspeed = -scale;
    yspeed = 0;
}//end switch statement

x = x + xspeed;
y = y + yspeed;
x = constrain(x, 0, width-scale);
y = constrain(y, 0, height-scale);
//draws the snake

rect(x, y, scale, scale);
}

int direction(){
  int direction = 0;
  if(keyCode == UP){
    direction = 1;
  }else if(keyCode == DOWN){
    direction = 3;
  }else if(keyCode == LEFT){
    direction = 4;
  }else if(keyCode == RIGHT){
    direction = 2;
  }else{
    direction = 0;
  }
  return direction;
}
void updateSnake(){
  snakeLength++;
  int[][] arr;
  arr = Snake;
  
  int[][] Snake = new int[snakeLength][1];
  Snake = arr;
  Snake[snakeLength][0] = x;
  Snake[snakeLength][1] = y;
}
void show(){
  for(int i =0;i<Snake.length;i++){
    rect(Snake[i][0], Snake[i][1], scale, scale);
  }
}
void food(){
  
}
}//end class