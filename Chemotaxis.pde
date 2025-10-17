
 //declare bacteria variables here   
 Bacteria [] fighter;
 int cursorCircleColor [] = new int[3];
 int health = 100;
 int score = 0;
 boolean gameOver = false;
 
 void setup()   
 {     
   //initialize bacteria variables here
   size(600,600);
   frameRate(200);
   fighter = new Bacteria[50];
   for(int i=0; i<50;i++){
     fighter[i]=new Bacteria();
   }
//colors
    int whatColorIsIt = (int)(Math.random()*3);
//red
   if(whatColorIsIt == 0){
     cursorCircleColor[0] = 255;
   }
//green
   else if(whatColorIsIt == 1){
     cursorCircleColor[1] = 255;
   }
//blue
   else if(whatColorIsIt == 2){
     cursorCircleColor[2] = 255;
   }
 }   
 void draw()   
 {
   background(0);
    if (health <= 0 && !gameOver){
      gameOver = true;
      println("Game Over! Final Score: " + score);
      noLoop();  // stops draw() from looping further
    }
   if(!gameOver){
     for(int i=0; i<fighter.length; i++){
       fighter[i].show();
       fighter[i].move();
     }
   
   textSize(60);
   text("Health: " + health, 40, 120);
   fill(0);
   fill(cursorCircleColor[0],cursorCircleColor[1],cursorCircleColor[2]);
   ellipse(mouseX,mouseY,25,25);
   //move and show the bacteria
   score++;
   fill(255);
   textSize(15);
   text("Score: " + score, 500, 40);
   }
   else {
    // Game Over screen
    background(0);
    fill(255, 0, 0);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2 - 40);
    textSize(40);
    text("Final Score: " + score, width/2, height/2 + 40);
  }
}  
 class Bacteria    
 {     
   int myX,myY,spd;
   int colors [] = {(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255)};
   
   Bacteria(){
     spd = 2;
     myX = 300;
     myY = 300;
     if(cursorCircleColor[0] == 255)
       colors[0] = 0;
     else if(cursorCircleColor[1] == 255)
       colors[1] = 0;
     else if(cursorCircleColor[2] == 255)
       colors[2] = 0;
   }
   void move(){
     if(mouseX > myX)
       myX = myX + spd + (int)(Math.random()*5)-1;
     else
       myX = myX - spd + (int)(Math.random()*5)-4;
     if(mouseY > myY)
       myY = myY + spd + (int)(Math.random()*5)-1;
     else
       myY = myY - spd + (int)(Math.random()*5)-4;  
   //if mouse doesn't evade bacteria
   if(cursorCircleColor[0] == 255){   
     if(myX == mouseX && myY == mouseY){
       colors[0]=255;
       myX = (int)(Math.random()*600);
       myY = 0;
       spd += 1.0;
       health -= 1;
     }
   }
   if(cursorCircleColor[1] == 255){   
     if(myX == mouseX && myY == mouseY){
       colors[1]=255;
       myX = (int)(Math.random()*600);
       myY = 0;
       spd += 1.0;
       health -= 1;
     }
   }
   if(cursorCircleColor[2] == 255){   
     if(myX == mouseX && myY == mouseY){
       colors[2]=255;
       myX = (int)(Math.random()*600);
       myY = 0;
       spd += 1.0;
       health -= 1;
     }
   }
   }
   void show(){
     fill(colors[0],colors[1],colors[2]);
     ellipse(myX,myY,10,10);
   }
   //lots of java!   
 }    
