class SnakeObject{
  int scale = 20;
int player;
int x = (int)random(5, width/scale - 5)*scale;
int y = (int)random(5, height/scale - 5)*scale;
int xspeed = 20;
int yspeed = 0;
int foodx = ((int)random(0, width/scale)*scale);
int foody= (int)random(0, height/scale)*scale;
int[][] Tail = new int[0][2];
int snakeLength = 1;
int lastSnakeLength = snakeLength;
int opstDir = 0;

SnakeObject(int player){
  this.player = player;
  this.xspeed = 20;
  this.yspeed = 0;
}
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
if(player == 0){
fill(255);
text(snakeLength, width - 2*(scale) -10, 3*scale);
}else{
fill(0,255,0);
text(snakeLength,2*(scale) +10, 3*scale);
}
}

int direction(){
  int direction = 0;
  
if(multiplayer == false){

  if((keyCode == UP || keyCode == 'W') && opstDir != 3){
    direction = 1;
    opstDir = 1;
  }else if((keyCode == DOWN || keyCode == 'S') && opstDir != 1){
    direction = 3;
    opstDir = 3;
  }else if((keyCode == LEFT || keyCode == 'A') && opstDir != 2){
    direction = 4;
    opstDir = 4;
  }else if((keyCode == RIGHT || keyCode == 'D') && opstDir != 4){
    direction = 2;
    opstDir = 2;
  }else{
    direction = 0;
  }
}else if(player == 0){
if((keyCode == UP ) && opstDir != 3){
    direction = 1;
    opstDir = 1;
  }else if((keyCode == DOWN ) && opstDir != 1){
    direction = 3;
    opstDir = 3;
  }else if((keyCode == LEFT) && opstDir != 2){
    direction = 4;
    opstDir = 4;
  }else if((keyCode == RIGHT) && opstDir != 4){
    direction = 2;
    opstDir = 2;
  }else{
    direction = 0;
  }

}else{
  if((keyCode == 'W') && opstDir != 3){
    direction = 1;
    opstDir = 1;
  }else if((keyCode == 'S') && opstDir != 1){
    direction = 3;
    opstDir = 3;
  }else if((keyCode == 'A') && opstDir != 2){
    direction = 4;
    opstDir = 4;
  }else if((keyCode == 'D') && opstDir != 4){
    direction = 2;
    opstDir = 2;
  }else{
    direction = 0;
  }
}
  return direction;

}

void snakeMove(){
  int[][] arr = new int[snakeLength][2];
  twoDArrayCopy(Tail, arr);
  for(int i = arr.length-1;i>0;i--){
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
  if(player == 0){
    fill(255);
  }else{
    fill(0, 255, 0);
  }
    rect(Tail[g][0], Tail[g][1], scale, scale);
  }


}

void twoDArrayCopy(int[][] arrayFrom, int[][] arrayTo){
  for(int i = 0;i<arrayFrom.length;i++){
    arrayTo[i][0] = arrayFrom[i][0];
    arrayTo[i][1] = arrayFrom[i][1];
  }
}
boolean dead(){

  for(int i = 1;i<Tail.length;i++){
    
    if((Tail.length > 1) && (Tail[0][0] == Tail[i][0]) && (Tail[0][1] == Tail[i][1])){
      return true;
    }
  
  }
  if((x < scale || x >= width-scale) || (y < scale || y >= height-scale)){
    return true;
  }else{
    return false;
  }
}
}//end class