// Written by William F.


ArrayList<SnowFlake> blizzard;
int[] catcherX = new int[1];
int[] catcherY = new int[1];
int time, mil;

void setup() {
  rectMode(CENTER);
  noStroke();
  time=5;
  mil=millis();
  size(500, 500);
  blizzard = new ArrayList<SnowFlake>();
  blizzard.add(new SnowFlake());
}
void draw() {
  background(0);
  if(mousePressed==true && mouseButton==LEFT){
    catcherX = append(catcherX, mouseX);
    catcherY = append(catcherY, mouseY);
  }
  int passed = millis()-mil;
  if(passed>time) {
    mil=millis();
    blizzard.add(new SnowFlake());
  }
  for(int i=blizzard.size()-1; i>=0; i--){
    SnowFlake snow = blizzard.get(i);
    for(int z=catcherY.length-1; z>0; z--) {
      if(snow.yPos>catcherY[z]-3 && snow.yPos<catcherY[z]+3 && snow.xPos>catcherX[z]-3 && snow.xPos<catcherX[z]+3){  //== catcherX[z] && snow.yPos == catcherY[z]){
        snow.caught=true;
      }
    }
    if(snow.caught==false){
      snow.move();
    }
    snow.show();
  }
  if(catcherX.length>10){
    fill(#3ACB50);
    for(int i = catcherX.length-1; i>=0; i--){
      rect(catcherX[i], catcherY[i], 6, 6);
    }
  }
  
  if(keyPressed==true && key==' ') {
    catcherX = new int[0];
    catcherY = new int[0];
    for(int i=blizzard.size()-1; i>=0; i--){
      SnowFlake snow = blizzard.get(i);
      snow.caught=false;
    }
  }
}

class SnowFlake {
  float xPos, yPos, speed, size;
  boolean caught;
  SnowFlake() {
    caught=false;
    xPos=(int)(Math.random()*500);
    yPos=0;
    speed=(float)Math.random()*4+3;
    size=(int)(Math.random()*4+4);
  }
  void show() {
    fill(255);
    ellipse(xPos,yPos,size,size);
  }
  void move() {
    xPos+=(int)(Math.random()*4-2);
    yPos+=speed;
  }
}