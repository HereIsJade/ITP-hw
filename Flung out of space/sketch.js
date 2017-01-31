//Press the mouse (can press longer) to see it flow
//Press "delete" on Mac keyboard to clear the canvas

var pts = [];
var formSize;
function setup() {
  createCanvas(650, 650);
  smooth();
  frameRate(30);
  rectMode(CENTER);
  background(0);
  formSize=width/3;
  //rect(width/2,height/2,formSize,formSize);
  
}

function draw() {
  
  if (mouseIsPressed){
    drawPts();
  }
  for(var i=0;i<pts.length;i++){
    pts[i].update();
    pts[i].display();
  }
  
  for (var i=pts.length-1; i>-1; i--) {
    if (pts[i].dead) {
      pts.splice(i,1);
    }
  }
  
}

function keyPressed(){
  if (keyCode === BACKSPACE){
    for (var i=pts.length-1;i>-1;i--) {
      pts[i].splice(i,1);
    }
    background(0);
  }
}


function drawPts(){
  for (var j=0;j<35;j++) {
    var newP = new Particle(random(width/2-formSize/2,width/2+formSize/2), random(height/2-formSize/2,height/2+formSize/2), j+pts.length, j+pts.length);
    pts.push(newP);
  }
}

function Particle(x, y, xOffset, yOffset){
  this.passedLife=0;
  this.dead=false;
  this.loc = new createVector(x,y);
  var randDegrees = random(360);
  this.vel = new createVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
  this.vel.mult(random(2));//may be modified to a fixed val

  this.acc = new createVector(0,0);
  
  if(y<(height/2+formSize/4) && x>(width/2-formSize/4)){
    this.lifeSpan = random(20, 120);// may be noise
  }
  else if(y<height/2 && x<width/2){
    this.lifeSpan = random(20, 80);// may be noise
  }
  else{
    this.lifeSpan = random(0, 20);// may be noise
  }

  this.decay = random(0.55, 0.65);

  this.xOffset = xOffset;
  this.yOffset = yOffset;
  
  this.update=function(){
    if(this.passedLife>=this.lifeSpan){
      this.dead = true;
    }else{
      this.passedLife=this.passedLife+1;
    }

    this.alpha = (this.lifeSpan-this.passedLife)/this.lifeSpan * 70+50;
    this.acc.set(0,0);

    var rn = (noise((this.loc.x+frameCount+this.xOffset)*0.01, (this.loc.y+frameCount+this.yOffset)*0.01)-0.5)*1.5*PI;
    var mag = noise((this.loc.y+frameCount)*0.01, (this.loc.x+frameCount)*0.01);
    var dir = createVector(cos(rn),sin(rn));
    this.acc.add(dir);
    this.acc.mult(mag);

    this.vel.add(this.acc);
    this.vel.mult(this.decay);
    this.vel.limit(5);
    this.loc.add(this.vel);
  }

  this.display = function(){
    strokeWeight(1);
    stroke(255, 255,255,this.alpha);

    point(this.loc.x, this.loc.y);
    
  }

}