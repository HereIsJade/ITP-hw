import de.voidplus.dollar.*;

public class Foo {
  void bar(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
    println("gesture: "+gesture+", "+startX+"/"+startY+", "+centroidX+"/"+centroidY+", "+endX+"/"+endY);
     if(gesture=="triangle"){
       background(255);
      int num=Math.round(random(3));
      image(triangleImgs[num], 0, 0);
      println("tri",num);
    }
  }
}

//public class Rec{
//  void detectRec(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
//    println("Local gesture: "+gesture+", "+startX+"/"+startY+", "+centroidX+"/"+centroidY+", "+endX+"/"+endY);
//     if(gesture=="rectangle"){
//      image(imgR, 0, 0);
//    }
//  }
//}


OneDollar one;
Foo foo;
//Rec rec;
PImage[] circleImgs;
PImage[] triangleImgs;
PImage imgC,imgT,imgR;
void setup(){
  size(displayWidth, displayHeight);
  background(255);
  circleImgs=new PImage[3];
  triangleImgs=new PImage[3];
  for (int i=0;i<3;i++){
    circleImgs[i]=loadImage("circle"+i+".jpg");
    triangleImgs[i]=loadImage("triangle"+i+".jpg");
  }
  
  
  one = new OneDollar(this);
  
  // Local callback:
  foo = new Foo();
  one.learn("triangle", new int[] {137,139,135,141,133,144,132,146,130,149,128,151,126,155,123,160,120,166,116,171,112,177,107,183,102,188,100,191,95,195,90,199,86,203,82,206,80,209,75,213,73,213,70,216,67,219,64,221,61,223,60,225,62,226,65,225,67,226,74,226,77,227,85,229,91,230,99,231,108,232,116,233,125,233,134,234,145,233,153,232,160,233,170,234,177,235,179,236,186,237,193,238,198,239,200,237,202,239,204,238,206,234,205,230,202,222,197,216,192,207,186,198,179,189,174,183,170,178,164,171,161,168,154,160,148,155,143,150,138,148,136,148} );
  one.on("triangle", foo, "bar");
  
  //rec=new Rec();
  //one.learn("rectangle", new int[] {78,149,78,153,78,157,78,160,79,162,79,164,79,167,79,169,79,173,79,178,79,183,80,189,80,193,80,198,80,202,81,208,81,210,81,216,82,222,82,224,82,227,83,229,83,231,85,230,88,232,90,233,92,232,94,233,99,232,102,233,106,233,109,234,117,235,123,236,126,236,135,237,142,238,145,238,152,238,154,239,165,238,174,237,179,236,186,235,191,235,195,233,197,233,200,233,201,235,201,233,199,231,198,226,198,220,196,207,195,195,195,181,195,173,195,163,194,155,192,145,192,143,192,138,191,135,191,133,191,130,190,128,188,129,186,129,181,132,173,131,162,131,151,132,149,132,138,132,136,132,122,131,120,131,109,130,107,130,90,132,81,133,76,133} );
  //one.on("rectangle",rec,"detectRec");
  
  // Global callback:
  one.learn("circle", new int[] {127,141,124,140,120,139,118,139,116,139,111,140,109,141,104,144,100,147,96,152,93,157,90,163,87,169,85,175,83,181,82,190,82,195,83,200,84,205,88,213,91,216,96,219,103,222,108,224,111,224,120,224,133,223,142,222,152,218,160,214,167,210,173,204,178,198,179,196,182,188,182,177,178,167,170,150,163,138,152,130,143,129,140,131,129,136,126,139} );
  one.on("circle", "detected");
}

void detected(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
  println("gesture: "+gesture+", "+startX+"/"+startY+", "+centroidX+"/"+centroidY+", "+endX+"/"+endY);
  if(gesture=="circle"){
    background(255);
    int num=Math.round(random(3));
    image(circleImgs[num], 0, 0);
    //println(num);
    println("cir",num);
  }
}

void draw(){
  //background(255);
  one.draw();
}

void mouseDragged(){
  one.track(mouseX, mouseY);
}