import com.krab.lazy.*;

LazyGui gui;
//ChildApplet child;

PImage img;
PImage frame;

PShape s1;
PShape s2;
PShape f; // for frame

color backgroundColor;
boolean quadToggle;
//someShape shapeYay;
//someShape anotherShape;

void setup() {
  size(600, 600, P3D);
  img = loadImage("bat.jpg");
  frame = loadImage("frame.png");
  noStroke();
  frameRate(24);
  s1 = createShape();
  s2 = createShape();
  f = createShape();

    gui = new LazyGui(this);

  //child = new ChildApplet();
}

float motion = 0;
float sinVal = 0;
//float sinValPlus = 0;
float totalRotation = 0;
// this value is so low because the rotate function is adding this rotation every call
//float amplitudeDeg = 0.05; // 0.005
float amplitude;// = 10; // 0.005 first given in degrees

float phaseMult;// = 0.01;

float quadrantSelection = 5;
int time = 0;
int time2Select = 1;

int heightOffset;
int frameZ= 50;
float scale;

void draw() {
  
    backgroundColor = gui.colorPicker("background", color(0xFF252525)).hex;

    //background(backgroundColor);

    gui.pushFolder("Image Zoom");
    quadToggle = gui.toggle("image zoom into quadrants", true);
    time2Select = gui.sliderInt("time to switch", 2, 1, 10);
    gui.popFolder();
  
    gui.pushFolder("Rotation");
    gui.slider("amplitude", 0.05);
    amplitude = gui.slider("amplitude", 0.1, 0, 1);
    phaseMult = gui.slider("phase multiple", 0.01, 0, 10);
    gui.popFolder();
  
    gui.pushFolder("Frame");
    gui.sliderInt("height offset");
    heightOffset = gui.sliderInt("height offset", -60, -200, 0);
    frameZ = gui.sliderInt("frame z", 50, 0, 100);
    gui.popFolder();
    
    gui.slider("rotation", 0, 0, 0.5);
    //gui.sliderAdd("rotation", 2);
    gui.sliderSet("rotation", totalRotation);
  
  amplitude = radians(amplitude);
  sinVal = sin(motion * phaseMult) * amplitude; //0.001
  //sinValPlus = sinVal * 1;
  totalRotation = totalRotation + sinVal;
  //print(totalRotation + "\n");
    print(motion + "\t" + amplitude + "\t" + nf(sinVal, 2, 4) + "\t" + totalRotation +  "\n");
  motion++;

  background(backgroundColor);
  translate(width / 2, height / 2);
  //rotateY(map(mouseX, 0, width, -PI, PI));
  //rotateZ(PI/6);
  //rotateY(PI);

  s1.beginShape();
  s2.beginShape();

  s1.rotateX(sinVal);
  s1.rotateZ(sinVal);
  s2.rotateX(sinVal);
  s2.rotateZ(sinVal);

//void imageDraw(PImage img, PShape s, float scale, float z, float heightOffset, float selection, boolean zoom) {

  imageDraw(img, s1, 0.25, 20, 0, quadrantSelection, quadToggle, false);
  imageDraw(frame, s2, 0.3, frameZ, heightOffset, 5, false, true);

  time++;
  if (time%(time2Select * 24) == 0) {
    // in order to reset image mapping, just remaking the shape cuz it's easy
    // I looked into setVertex, but it doesn't have a mapping input
    // no easy way to just have vertex be set through an if statement chain
    // BUT it resets the rotation, so you need to rotate it back to what it was
    s1 = createShape();
    s1.rotate(totalRotation);
    quadrantSelection = random(0, 7);
    print(quadrantSelection + "\n\n");
  }
  
    
  
}

//class ChildApplet extends PApplet {

//  public ChildApplet() {
//    super();
//    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
//  }

//  public void settings() {
//    size(800, 400, P2D);
//  }

//  public void setup() {
//  }


//  public void draw() {

//  }
//}
