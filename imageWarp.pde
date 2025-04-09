import com.krab.lazy.*;

LazyGui gui;
ChildApplet child;

PImage img;
PImage frame;

PShape s1;
PShape s2;
PShape f; // for frame

color backgroundColor;
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
  
  child = new ChildApplet();
}

float motion = 0;
float sinVal = 0;
float sinValPlus = 0;
float totalRotation = 0;
// this value is so low because the rotate function is adding this rotation every call
//float amplitudeDeg = 0.05; // 0.005
float amplitudeDeg = 0.05; // 0.005
float amplitude = radians(amplitudeDeg);

float quadrantSelection = 5;
int time = 0;

void draw() {
  sinVal = sin(motion * 0.01) * amplitude; //0.001
  sinValPlus = sinVal * 1;
  totalRotation = totalRotation + sinValPlus;
  print(totalRotation + "\n");
  motion++;
  
  background(backgroundColor);
  translate(width / 2, height / 2);
  //rotateY(map(mouseX, 0, width, -PI, PI));
  //rotateZ(PI/6);
  //rotateY(PI);

    s1.beginShape();
    s2.beginShape();

    s1.rotateX(sinValPlus);
    s1.rotateZ(sinValPlus);
    s2.rotateX(sinVal);
    s2.rotateZ(sinVal);

  imageDraw(img,   s1, 0.25, 20,     0, quadrantSelection, true);
  imageDraw(frame, s2, 0.3, 50, -60, 5,                  false);
 
  time++;
  if (time%100 == 0) {
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

class ChildApplet extends PApplet {
  
  public ChildApplet() {
    super();
        PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
   public void settings() {
    size(400, 400, P2D);
  }
  
    public void setup() { 
        gui = new LazyGui(this);

  }
  

  public void draw() {
             backgroundColor = gui.colorPicker("background",  color(0xFF252525)).hex;

      background(backgroundColor);

  }
}
