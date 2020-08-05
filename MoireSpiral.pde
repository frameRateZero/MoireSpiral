//fork of @wblut's Spiral sketch 
//https://github.com/wblut/Processing3Sketches/tree/master/spiral

//import processing.svg.*;
import controlP5.*;
import processing.pdf.*;

//for the controlFrame
ControlFrame cf;
int buttonColor;
int buttonBgColor;
int brightness = 0;
int threshold = 120;
float curves = 0.1;
int lines = 8;
float turns = 0.25;
int pixJump = 1;

int bump = 30;
int ticks = 255;
int back = 255;
int blurVal;
int postVal;
int preFilter;
int saveCount = 0;
float yOff = 0.2;


///for the spiral draw
Spiral S;
float RADIUS;
int NUMPOINTSPERTURN;
int NUMTURNS;
 float hysteresis;
 float magnitudeX, magnitudeY;
PImage image, image1;
float imageScale;

void settings() {
    size(1000, 1000, P2D);
}

void setup() {
    cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);

  smooth(16);
  image1=loadImage("KM_GQ.JPG");//CC0 https://www.piqsels.com/
  hysteresis=0.5;
  NUMTURNS=40;
  NUMPOINTSPERTURN=1000;
  RADIUS=400.0;
  imageScale=min(0.5*image1.width/(RADIUS+4), 0.5*image1.height/(RADIUS+4));
}

void draw() {
    background(255);
  image = image1.get();
    if (preFilter == 1) {
    image.filter(BLUR, blurVal);
    //image.filter(DILATE);
    image.filter(POSTERIZE, postVal);
  } else if (preFilter == 2) {
    image.filter(BLUR, blurVal);
    image.filter(DILATE);
    image.filter(ERODE);
    image.filter(POSTERIZE, postVal);
  } else if (preFilter == 3) {
    image.filter(ERODE);
    image.filter(ERODE);
    //preProcessedImage.filter(ERODE);
    image.filter(BLUR, blurVal);
    image.filter(POSTERIZE, postVal);
  } else if (preFilter == 4) {
    perlin(image);
  }
  

 //beginRecord(PDF, "##.pdf");
  drawSpiral("spiral001", color(0), 0, 0, -1);
  drawSpiral("spiral002", color(0), 0, 1, 1);
  drawSpiral("spiral003", color(0), 0, -1, -1);
  drawSpiral("spiral004", color(0), 0, 2, 1);
  drawSpiral("spiral005", color(0), 0, -2, -1);
  //noLoop();

 endRecord();
}

void drawSpiral(String name, color col, float angle, float displacement, int direction) {
  pushMatrix();
  //beginRecord(SVG, "/SVG/"+name+".svg"); //left this in, if you want to seperate the spirals.
  translate(width/2, height/2);
  S=new Spiral(RADIUS, NUMTURNS*NUMPOINTSPERTURN, NUMTURNS, angle, displacement, direction);
  noFill();
  stroke(col);
  S.draw();
  //rect(-width/2, -height/2, width, height);
  //endRecord();
  popMatrix();
}


class Spiral {
  float[] points;
  Spiral(float r, int num, float s, float angle, float displacement, int direction) {
    float dr=r/num;
    points=new float[2*num];
    int id=0;
    float radius;
    float displacementFactor=0.0;
    //float hysteresis=0.5;
    
    
    if (direction == 1){
    for (int i=0; i<num; i++) {
      radius=i*dr;
      float x=radius* cos(i*s*TWO_PI/num+angle);
      float y=radius* sin(i*s*TWO_PI/num+angle);
       displacementFactor=hysteresis*displacementFactor+(1.0-hysteresis)*map(brightness(image.get(image1.width/2+(int)(imageScale*x),image.height/2+(int)(imageScale*y))),0,255,1.0,0.0);
      points[id++]=x*((radius==0)?0.0:(radius+displacement*displacementFactor+magnitudeX)/radius);
      points[id++]=y*((radius==0)?0.0:(radius+displacement*displacementFactor+magnitudeY)/radius);
    }
    }else if (direction == -1){
       for (int i=num; i>0; i--) {
      radius=i*dr;
      float x=radius* cos(i*s*TWO_PI/num+angle);
      float y=radius* sin(i*s*TWO_PI/num+angle);
       displacementFactor=hysteresis*displacementFactor+(1.0-hysteresis)*map(brightness(image.get(image1.width/2+(int)(imageScale*x),image1.height/2+(int)(imageScale*y))),0,255,1.0,0.0);
      points[id++]=x*((radius==0)?0.0:(radius+displacement*displacementFactor)/radius);
      points[id++]=y*((radius==0)?0.0:(radius+displacement*displacementFactor)/radius);
    }
    
    }
  }

  void draw() {

    beginShape();
    for (int i=0; i<points.length; i+=2) {
      vertex(points[i], points[i+1]);
    }
    endShape(OPEN);
   
  }
  
}
