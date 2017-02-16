class SnakeObject{
int x = 200;
int y = 200;
int xspeed = 20;
int yspeed;
int scale = 20;
int foodx = ((int)random(0, width/scale)*scale);
int foody= (int)random(0, height/scale)*scale;
int[][] Tail = new int[0][2];
int snakeLength = 1;
int lastSnakeLength = snakeLength;
int clock = 1;
void move(){
  switch(direction()){
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

//rect(x, y, scale, scale);
snakeMove();

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

void snakeMove(){
  int[][] arr = new int[snakeLength][2];
  twoDArrayCopy(Tail, arr);
  for(int i = arr.length-1;i>0;i--){
  //System.out.println(i);
  System.out.println(arr[i][1]);
  System.out.println(arr[i-1][1]);
  arr[i][0] = arr[i-1][0];
  arr[i][1] = arr[i-1][1];
    //System.out.println("Array x : " + arr[i][0]);
}
Tail = new int[snakeLength][2];
for(int j = 1;j<arr.length;j++){
  Tail[j][0] = arr[j][0];
  Tail[j][1] = arr[j][1];
}
Tail[0][0] = x;
Tail[0][1] = y;
for(int g =0;g<Tail.length;g++){
    rect(Tail[g][0], Tail[g][1], scale, scale);
  }
  clock++;
}
void food(){
  if(x == foodx && y == foody){
    snakeLength++;
    foodx = (int)random(0, width/scale)*scale;
    foody = (int)random(0, height/scale)*scale;
    foodx = constrain(foodx, scale, width-scale-scale);
    foody = constrain(foody, scale, height-scale-scale);
  }    
    fill(255, 0, 0);
    rect(foodx, foody, scale, scale);
    fill(255);

}
void twoDArrayCopy(int[][] arrayFrom, int[][] arrayTo){
  for(int i = 0;i<arrayFrom.length;i++){
    arrayTo[i][0] = arrayFrom[i][0];
    arrayTo[i][1] = arrayFrom[i][1];
  }
}
boolean dead(){
  if((x < scale || x >= width-scale) || (y < scale || y >= height-scale)){
    return true;
  }else{
    return false;
  }
}
}//end class