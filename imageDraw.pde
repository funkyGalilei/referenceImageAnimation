
void imageDraw(PImage img, PShape s, float scale, float z, float heightOffset, float selection, boolean zoom) {

  float imgWidth = img.width;
  float imgHeight = img.height;
  float aspectRatio = imgHeight/imgWidth;
  //float aspectRatio = img.height / img.width; // aspect ratio returns 1 for some weird reason with this
  float x  =  width * scale;
  float y  =   x * aspectRatio + heightOffset;
  
  //s.beginShape();
  s.texture(img);
  // can control individual vertices to give the impression of rotation
    //s.rotateX(sinMotion);
    //s.rotateZ(sinMotion);

if (zoom) {
   imageZoom(img, s, x, y, z, selection);
} else {
  
    s.vertex(-x,       -y, z,         0, 0);             // top left    
    s.vertex(x,         -y, z,  img.width, 0);           // top right
    s.vertex(x,         y, z,   img.width, img.height);   // bottom right
    s.vertex(-x,         y, z,  0, img.height);          // bottom left
    
    //frameDraw(f, x, y, z, sinVal);

}
   s.endShape();

  shape(s, 0, 0);

  //float fOff = 100; // frame offset haha
  
}


  
  // scale will be from 0 to 1, from 0 to width or height
  // height offset is for the frame - it will shrink so it can match the image
  // so x: eq should be width of output == width window * scale
  // selection will be if we want to zoom into a quadrant, 5 will mean full
  
  // debug thing to see what the heck was going on with aspectRatio
  //print("img width: " + imgWidth + "\timg.height: " + imgHeight + "\taspectRatio: " + aspectRatio);
  //print("\tscale: " + scale + "\t win width: " + width +  "\t win height: " + height + "\toutput width: " + x + "\toutput height: " + y + "\n");
  
