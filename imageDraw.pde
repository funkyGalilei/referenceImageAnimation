
void imageDraw(PImage img, PShape s, float sinMotion, float scale, float z, float heightOffset) {
  
  // scale will be from 0 to 1, from 0 to width or height
  // height offset is for the frame - it will shrink so it can match the image
  // so x: eq should be width of output == width window * scale
    
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

 // bottom left actually no, they're reversed since its from the top
 // (x, y, z, u, v)
  s.vertex(-x,       -y, z,         0, 0);                 
  s.vertex(x,         -y, z,  img.width, 0);           // bottom right
  s.vertex(x,         y, z,   img.width, img.height);   // top right
  s.vertex(-x,         y, z,  0, img.height);          // top left
  s.endShape();
  
  
  shape(s, 0, 0);
  //s.rotateX(-sinMotion); // this resets the rotation, because the function will actually effect other parameters as well
  //s.rotateZ(-sinMotion);
}
