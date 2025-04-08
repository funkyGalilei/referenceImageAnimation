PImage img;
PImage frame;

PShape s1;
PShape s2;

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
}

float motion = 0;
float sinVal = 0;
// this value is so low because the rotate function is adding this rotation every call
float amplitudeDeg = 0.05; // 0.005
float amplitude = radians(amplitudeDeg);

void draw() {
  sinVal = sin(motion * 0.01) * amplitude; //0.001
  motion++;
  
  background(0);
  translate(width / 2, height / 2);
  //rotateY(map(mouseX, 0, width, -PI, PI));
  //rotateZ(PI/6);
  //rotateY(PI);
  
  // imageDraw(img, shape, sin, scale, z, heightoffset)
  imageDraw(img, s1, sinVal, 0.25, 0, 0);
  imageDraw(frame, s2, sinVal, 0.3, 10, -40);
  
}
