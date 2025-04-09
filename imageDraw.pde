
void imageDraw(PImage img, PShape s, PShape f, float sinMotion, float scale, float z, float heightOffset, int selection, boolean isFrame) {
  
  // scale will be from 0 to 1, from 0 to width or height
  // height offset is for the frame - it will shrink so it can match the image
  // so x: eq should be width of output == width window * scale
  // selection will be if we want to zoom into a quadrant, 5 will mean full
  
  //float aspectRatio = img.height / img.width; // aspect ratio returns 1 for some weird reason with this
  float imgWidth = img.width;
  float imgHeight = img.height;
  float aspectRatio = imgHeight/imgWidth;
  
  float x  =  width * scale;
  float y  =   x * aspectRatio + heightOffset;
  // debug thing to see what the heck was going on with aspectRatio
  //print("img width: " + imgWidth + "\timg.height: " + imgHeight + "\taspectRatio: " + aspectRatio);
  //print("\tscale: " + scale + "\t win width: " + width +  "\t win height: " + height + "\toutput width: " + x + "\toutput height: " + y + "\n");
  
  s.beginShape();
  s.texture(img);
  // can control individual vertices to give the impression of rotation
  s.rotateX(sinMotion);
  s.rotateZ(sinMotion);

 // actually they're reversed since its from the top
 // (x, y, z, u, v)
 // if we only want to select part of the image, or "zoom in", we will change mapping coords u and v
 // from o to img.width, so a fraction of img.width maybe, and selecting a random number OR
 // just selecting a random quadrant, which will prolly be the easiest
 if (selection > 4) {
    s.vertex(-x,       -y, z,         0, 0);             // top left    
    s.vertex(x,         -y, z,  img.width, 0);           // top right
    s.vertex(x,         y, z,   img.width, img.height);   // bottom right
    s.vertex(-x,         y, z,  0, img.height);          // bottom left
    
 } else if (selection > 3) {
   s.vertex(-x,       -y, z,         0, 0);             // top left    
    s.vertex(x,         -y, z,  img.width/2, 0);           // top right
    s.vertex(x,         y, z,   img.width/2, img.height/2);   // bottom right
    s.vertex(-x,         y, z,  0, img.height/2);          // bottom left
 } else if (selection > 2) {
    s.vertex(-x,       -y, z,         img.width/2, 0);             // top left    
    s.vertex(x,         -y, z,  img.width, 0);           // top right
    s.vertex(x,         y, z,   img.width, img.height/2);   // bottom right
    s.vertex(-x,         y, z,  img.width/2, img.height/2);          // bottom left
 } else if(selection > 1) {
     s.vertex(-x,       -y, z,         0, img.height/2);             // top left    
    s.vertex(x,         -y, z,  img.width/2, img.height/2);           // top right
    s.vertex(x,         y, z,   img.width/2, img.height);   // bottom right
    s.vertex(-x,         y, z,  0, img.height);          // bottom left
 } else if (selection >= 0) {
          s.vertex(-x,       -y, z,         img.width/2, img.height/2);             // top left    
    s.vertex(x,         -y, z,  img.width, img.height/2);           // top right
    s.vertex(x,         y, z,   img.width, img.height);   // bottom right
    s.vertex(-x,         y, z,  img.width/2, img.height);          // bottom left
 } else {
   print("warning, s is out of bounds");
 }
 
  s.endShape();
  //print("hi");
  shape(s, 0, 0);
  
  //float fOff = 100; // frame offset haha
  
  if (isFrame) {
     
    f.beginShape(QUADS);
    f.colorMode(HSB);
    
    f.rotateX(sinMotion);
    f.rotateZ(sinMotion);
    
    f.vertex(-x, -y, 0);
    f.vertex(x, -y, 0);
    f.vertex(x, y, 0);
    f.vertex(-x, y, 0);
    
    //side parts
    f.fill(255, 150, 255);
    f.vertex(-x, -y, 0);
    f.vertex(-x, y, 0);
    f.vertex(-x, y, z);
    f.vertex(-x, -y, z);
  
    f.vertex(x, -y, 0);
    f.vertex(x, y, 0);
    f.vertex(x, y, z);
    f.vertex(x, -y, z);
    
    //top and bottom
    f.vertex(x, -y, 0);
    f.vertex(x, -y, z);
    f.vertex(-x, -y, z);
    f.vertex(-x, -y, 0);
    
    f.vertex(x, y, 0);
    f.vertex(x, y, z);
    f.vertex(-x, y, z);
    f.vertex(-x, y, 0);
    
    //inner side parts
    //f.fill(255, 150, 255);
    //f.vertex(-x + fOff, -y+ fOff, 0);
    //f.vertex(-x+ fOff, y- fOff, 0);
    //f.vertex(-x+ fOff, y- fOff, z);
    //f.vertex(-x+ fOff, -y+ fOff, z);
  
    //f.vertex(x - fOff, -y+ fOff, 0);
    //f.vertex(x- fOff, y- fOff, 0);
    //f.vertex(x- fOff, y- fOff, z);
    //f.vertex(x- fOff, -y+ fOff, z);
    
    f.endShape();
      shape(f, 0, 0);
 }
  
}
