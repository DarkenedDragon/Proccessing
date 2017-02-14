class SnakeObject{
int x = 0;
int y = 0;
int xspeed;
int yspeed;
int scale = 20;
int foodx = ((int)random(0, width/scale)*scale);
int foody= (int)random(0, height/scale)*scale;
int[][] Tail = new int[][]{
};
int snakeLength = 1;
int lastSnakeLength = snakeLength;
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

show();
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
  /*
  puedocode:
  1. Find if the snake has been lengthened
  2. copy the current snake tail into an new array
  3. advance the new array 1 element
  4. copy back into Tail
  5. add the new point to tail
  */
  /*
if(lastSnakeLength != snakeLength){
  lastSnakeLength = snakeLength;
  int[][] arr = new int[snakeLength][2];
for(int i = 1;i<arr.length-1;i++){
  arr[i][0] = arr[i+1][0];
  arr[i][1] = arr[i+1][1];
}
  int[][] Tail = new int[snakeLength][2];
for(int j = 1;j<arr.length;j++){
    Tail[j][0] = arr[j][0];
    Tail[j][1] = arr[j][1];
  }
  */
  int[][] Tail = new int[snakeLength][2];
  Tail[0][0] = x;
  Tail[0][1] = y;
//}
}
void show(){
  for(int i =0;i<Tail.length;i++){
    rect(Tail[i][0], Tail[i][1], scale, scale);
  }
}
void food(){
  if(x == foodx && y == foody){
    snakeLength++;
    updateSnake();
    foodx = (int)random(0, width/scale)*scale;
    foody = (int)random(0, height/scale)*scale;
  //rect(foodx, foody, scale, scale);
  }    
    fill(255, 0, 0);
    rect(foodx, foody, scale, scale);
    fill(255);

}
void twoDArrayCopy(int[][] arrayFrom, int[][] arrayTo){
  for(int i = 0;i<arrayFrom.length-1;i++){
    arrayTo[i][0] = arrayFrom[i][0];
    arrayTo[i][1] = arrayFrom[i][1];
  }
}
}//end class