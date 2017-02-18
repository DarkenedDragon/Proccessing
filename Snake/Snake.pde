boolean gameStart = false;
SnakeObject snake = new SnakeObject();
PFont font;
int state = 0;
void setup(){
  //make size a multiple of scale
  size(800, 800);
  frameRate(10);
  font = createFont("Arial",16,true);
  textFont(font, 72);
  
  //snake.food();
}
void draw(){ 
  if(gameStart == false){
    titleScreen();
  }else{
    
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
  }
  //test item
  rect(0,0,100,100);
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
  gameStart = false;
  break;
  
  
  case 1:
  if(mousePressed && 
  overMode(width/2 - (textWidth("Easy")/2 + 10),height/2, textWidth("Easy") + 20, 50)){
    fill(255, 0, 0);
    //state++;
    frameRate(10);
    gameStart = true;
  }else if(mousePressed &&
  overMode(width/2 - (textWidth("Hard")/2 + 10), height/2 + 60, textWidth("Hard") + 20, 50)){
    fill(0,0,255);
    //state++;
    frameRate(20);
    gameStart = true;
  }
  //test item
  rect(0,0,100,100);
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