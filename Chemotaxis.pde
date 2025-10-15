 //declare bacteria variables here   
 Bacteria [] fighter;
 int cursorCircleColor [] = new int[3];
 
 void setup()   
 {     
   //initialize bacteria variables here
   size(600,600);
   frameRate(200);
   fighter = new Bacteria[200];
   for(int i=0; i<200;i++){
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
   for(int i=0; i<fighter.length; i++){
     fighter[i].show();
     fighter[i].move();
   }
   fill(cursorCircleColor[0],cursorCircleColor[1],cursorCircleColor[2]);
   ellipse(mouseX,mouseY,25,25);
   //move and show the bacteria
 }  
 class Bacteria    
 {     
   int myX,myY;
   int colors [] = {(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255)};
   
   Bacteria(){
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
       myX = myX + (int)(Math.random()*5)-1;
     else
       myX = myX + (int)(Math.random()*5)-3;
     if(mouseY > myY)
       myY = myY + (int)(Math.random()*5)-1;
     else
       myY = myY + (int)(Math.random()*5)-3;  
   //if mouse doesn't evade bacteria
   if(cursorCircleColor[0] == 255){   
     if(myX == mouseX && myY == mouseY)
       colors[0]=255;
   }
   if(cursorCircleColor[1] == 255){   
     if(myX == mouseX && myY == mouseY)
       colors[1]=255;
   }
   if(cursorCircleColor[2] == 255){   
     if(myX == mouseX && myY == mouseY)
       colors[2]=255;
   }
   }
   void show(){
     fill(colors[0],colors[1],colors[2]);
     ellipse(myX,myY,10,10);
     
   }
   //lots of java!   
 }    
