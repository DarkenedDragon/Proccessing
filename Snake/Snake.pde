int gameStart = 0;
SnakeObject snake = new SnakeObject(0);
SnakeObject snake2;
PFont font;
int scale = 20;
int state = 0;
int foodx = (int)random(5, width/scale)*scale;
int foody = (int)random(5, height/scale)*scale;
boolean multiplayer = false;
void setup(){
  //make size a multiple of scale
  size(800, 800);
  frameRate(10);
  font = createFont("Arial",16,true);
  textFont(font, 72);
  
  //snake.food();
}
void draw(){ 
  switch(gameStart){
    case 0:
    keyCode = RIGHT;
    multiplayer = false;
    snake = new SnakeObject(0);
    snake2 = null;
    gameStart++;
    break;
    case 1:

    titleScreen();
    break;
    
    case 2:
    
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
      
  if(multiplayer == true){
    snake2.move();
    collision();
  }
  
  food();
  
  if(snake.dead() == true){
    gameStart++;
  }else
  if(multiplayer == true && snake2.dead() == true){
    gameStart++;
  }
  break;
  
  case 3:
  //snake = new SnakeObject(0);
  //snake2 = new SnakeObject(2);
  
  background(255);
  fill(255);
  rect(width/2-textWidth("Play Again?")/2, height/2-70, textWidth("Play Again?"), 50);
  fill(255, 0,0);
  textAlign(CENTER);
  text("Play Again?", width/2, height/2-32);
  if(mousePressed && overMode(width/2-textWidth("Play Again?")/2, height/2-70, textWidth("Play Again?"), 50)==true){
    gameStart = 0;
    state = 0;
  }
  break;
  }

}
void food(){
  foodx = constrain(foodx, scale, width-scale-scale);
  foody = constrain(foody, scale, height-scale-scale);
  if(snake.x == foodx && snake.y == foody){
    snake.snakeLength++;
    foodx = (int)random(0, width/scale)*scale;
    foody = (int)random(0, height/scale)*scale;
    foodx = constrain(foodx, scale, width-scale-scale);
    foody = constrain(foody, scale, height-scale-scale);
  }else if(multiplayer == true && snake2.x == foodx && snake2.y == foody){
    snake2.snakeLength++;
    foodx = (int)random(0, width/scale)*scale;
    foody = (int)random(0, height/scale)*scale;
    foodx = constrain(foodx, scale, width-scale-scale);
    foody = constrain(foody, scale, height-scale-scale);  
  }
    fill(255, 0, 0);
    rect(foodx, foody, scale, scale);
    fill(255);

}
void titleScreen(){
  textFont(font, 72);
  String title = "Snake";
  background(255);
  fill(0);
  textAlign(CENTER);
  text(title, width/2, 200);

  textFont(font, 36);
  textAlign(CENTER);
  
  switch(state){
    case 0:

  //text("1 Player", width/2, height/2);
  if(mousePressed && 
  overMode(width/2 - (textWidth("1 Player")/2 + 10),height/2, textWidth("1 Player") + 20, 50)){
    fill(255, 0, 0);
    state++;
  }else if(mousePressed &&
  overMode(width/2 - (textWidth("2 Player")/2 + 10), height/2 + 60, textWidth("2 Player") + 20, 50)){
    fill(0,0,255);
    state++;
    multiplayer = true;
    snake2 = new SnakeObject(2);

  }
  //creates the 1 player button
  fill(255);
  rect(width/2 - (textWidth("1 Player")/2 + 10),height/2, textWidth("1 Player") + 20, 50);
  fill(255,0,0);
  text("1 Player",width/2,height/2+ 40);
  //creates the 2 players button
  fill(255);
  rect(width/2 - (textWidth("2 Player")/2 + 10),height/2 + 60, textWidth("2 Player") + 20, 50);
  fill(255,0,0);
  text("2 Player",width/2,height/2+ 100);
  //gameStart = 0;
  break;
  
  
  case 1:
  if(mousePressed && 
  overMode(width/2 - (textWidth("Easy")/2 + 10),height/2, textWidth("Easy") + 20, 50)){
    fill(255, 0, 0);
    //state++;
    frameRate(10);
    gameStart++;

  }else if(mousePressed &&
  overMode(width/2 - (textWidth("Hard")/2 + 10), height/2 + 60, textWidth("Hard") + 20, 50)){
    fill(0,0,255);
    //state++;
    frameRate(20);
    gameStart++;

  }
  //creates the 1 player button
  fill(255);
  rect(width/2 - (textWidth("Easy")/2 + 10),height/2, textWidth("Easy") + 20, 50);
  fill(255,0,0);
  text("Easy",width/2,height/2+ 40);
  //creates the 2 players button
  fill(255);
  rect(width/2 - (textWidth("Hard")/2 + 10),height/2 + 60, textWidth("Hard") + 20, 50);
  fill(255,0,0);
  text("Hard",width/2,height/2+ 100);
  
  break;
  }//end switch statment
}
boolean overMode(float x, float y, float xSize, float ySize){
  if((mouseX >= x && mouseX <= x + xSize) && 
  (mouseY >= y && mouseY <= y + ySize)){
    
    return true;
  }
    return false;
}
void collision(){
 
  for(int i = 0;i<Math.min(snake.Tail.length, snake2.Tail.length);i++){
  if(snake.Tail[i][0] == snake2.Tail[i][0] && 
snake.Tail[i][1] == snake2.Tail[i][1]){
System.exit(0);
}
  }
}