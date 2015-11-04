
//  background
PImage bg1;
PImage bg2;
int bg1x,bg2x;
// fighter
PImage shipImg;
int shipx;
int shipy;
float shipspeed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
int ex=0;
// treasure
PImage treasureImg;
int treasureX=floor (random(600));
int treasureY=floor (random(450));
// enemy
PImage enemyImg;
int enemyX1;
int enemyY1=floor (random(0,400));                                    
// hp
PImage hpImg;
int hpX=216;
// level
int level=0;
void setup () {  
  size(640,480) ; 
 
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");  
  shipImg=loadImage("img/fighter.png");
  enemyImg=loadImage("img/enemy.png"); 
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  
  shipx = 640/2;
  shipy = 480/2; 
 
  bg1x=640;
  bg2x=0;
  
  level=0;                               
}

void draw() {
  background(0);

 // moving background
  image(bg1,bg1x-640,0);
  image(bg2,bg2x-640,0);
  bg1x+=2;
  bg2x+=2;
  bg1x%=1280;
  bg2x%=1280;
 // ship 
   image(shipImg,shipx,shipy);
 if (upPressed == true){
   if (shipy > 0){
    shipy -= shipspeed;
   }
  }
  if (downPressed == true) {
    if (shipy < 430){
    shipy += shipspeed;
    }
  }
  if (leftPressed == true){
    if (shipx>0 ) {
    shipx -= shipspeed;
  }}
  if (rightPressed == true){
     if (590>shipx ) {
    shipx += shipspeed;
  } }
 // treasure   
  image(treasureImg, treasureX, treasureY);
  
  if (treasureX<shipx+40 && treasureX+40>shipx){
     if (treasureY>shipy-40 && treasureY-40<shipy){
       if (hpX<196){
         hpX+=20;
       }
       if (hpX>=196){
         hpX=216;
       }
     treasureX=floor (random(600));
     treasureY=floor (random(440));
  }
  }
  // hp 
  fill(#FF0000);
 rectMode(CORNERS);
  rect(15,30,hpX,10);
  image(hpImg,10,10); 
      
// enemy
// wave 1
if (level==0){
  for (int ex=0;ex<=4;ex++){                          
      image(enemyImg,enemyX1-ex*65,enemyY1);
  }

  enemyX1 += 4;
  if (enemyX1>(640+65*4)){       
      enemyX1=-65;
      enemyY1=floor (random(65,140)); 
      level++;
}
     
}
// wave 2
if (level==1){
  for (int ex2=0;ex2<=4;ex2++){                                                         
    
      image(enemyImg,enemyX1-ex2*65,enemyY1+ex2*65);
   }  
  enemyX1 += 4;
  if (enemyX1>(640+65*4)){ 
      level++;
      enemyX1=-65;
      enemyY1=floor (random(65*2,480-65*2-50));
}
}
// wave 3
if (level==2){
    for (int ex3=0;ex3<=2;ex3++ ){                          
      image(enemyImg,enemyX1-ex3*65,enemyY1-ex3*65);
      
    } 
    for (int ex3=0;ex3<=1;ex3++ ){                              
      
      image(enemyImg,enemyX1-65*3-ex3*65,enemyY1-65+ex3*65);
    } 
    
    for (int ex3=0;ex3<=2;ex3++ ){                              
      image(enemyImg,enemyX1-ex3*65,enemyY1+ex3*65);
      
    } 
   for (int ex3=0;ex3<=1;ex3++ ){                            
      
      image(enemyImg,enemyX1-65*3-ex3*65,enemyY1+65-ex3*65);
    } 

  image(enemyImg,enemyX1,enemyY1);
    enemyX1 += 4;
 if (enemyX1>(640+65*4)){ 
      level=0;
      enemyX1=0;
      enemyY1=floor (random(65,400));      
}
}      
} 
 
//fighter moving
void keyPressed() {
  if (key == CODED) {  
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
    
  
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
