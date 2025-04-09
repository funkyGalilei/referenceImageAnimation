
void imageZoom (PImage img, PShape s,  float x, float y, float z, float selection) {
  
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

 }  else if (selection > 2) {
    s.vertex(-x,       -y, z,         img.width/2, 0);             // top left    
    s.vertex(x,         -y, z,  img.width, 0);           // top right
    s.vertex(x,         y, z,   img.width, img.height/2);   // bottom right
    s.vertex(-x,         y, z,  img.width/2, img.height/2);          // bottom left

 } else  if(selection > 1) {
     s.vertex(-x,       -y, z,         0, img.height/2);             // top left    
    s.vertex(x,         -y, z,  img.width/2, img.height/2);           // top right
    s.vertex(x,         y, z,   img.width/2, img.height);   // bottom right
    s.vertex(-x,         y, z,  0, img.height);          // bottom left

 }  else if (selection >= 0) {
          s.vertex(-x,       -y, z,         img.width/2, img.height/2);             // top left    
    s.vertex(x,         -y, z,  img.width, img.height/2);           // top right
    s.vertex(x,         y, z,   img.width, img.height);   // bottom right
    s.vertex(-x,         y, z,  img.width/2, img.height);          // bottom left

 }

}
