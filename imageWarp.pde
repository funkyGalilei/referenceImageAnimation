PImage img;
PImage frame;

PShape s1;
PShape s2;
PShape f; // for frame

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
}

float motion = 0;
float sinVal = 0;
// this value is so low because the rotate function is adding this rotation every call
float amplitudeDeg = 0.05; // 0.005
float amplitude = radians(amplitudeDeg);

int quadrantSelection = 5;
int time = 0;

void draw() {
  sinVal = sin(motion * 0.01) * amplitude; //0.001
  motion++;
  
  background(0);
  translate(width / 2, height / 2);
  //rotateY(map(mouseX, 0, width, -PI, PI));
  //rotateZ(PI/6);
  //rotateY(PI);
  
  // imageDraw(img, shape, frame, sin, scale, z, heightoffset, selection quadrant, isFrame)
  imageDraw(img, s1, f, sinVal, 0.25, 1, 0, quadrantSelection, false);
  imageDraw(frame, s2, f, sinVal, 0.35, 50, -60, 5, true);
  

 
  time++;
  if (time%25 == 0) {
    quadrantSelection = int(round(random(0, 6)));
    print(quadrantSelection + "\n\n");
  }
}
