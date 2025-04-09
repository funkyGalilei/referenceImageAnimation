 
 void frameDraw(PShape f, float x, float y, float z, float sinMotion) {
    
    float w = 0;
    
    f.beginShape(QUADS);
    f.colorMode(HSB);
    
    f.rotateX(sinMotion);
    f.rotateZ(sinMotion);
    
    f.fill(100, 255, 150);
    f.vertex(-x- w, -y, 0);
    f.vertex(x + w, -y, 0);
    f.vertex(x + w, y, 0);
    f.vertex(-x, y, 0);
    
    //side parts
    f.vertex(-x-w, -y, 0);
    f.vertex(-x-w, y, 0);
    f.vertex(-x-w, y, z);
    f.vertex(-x-w, -y, z);
  
    f.vertex(x+ w, -y, 0);
    f.vertex(x+ w, y, 0);
    f.vertex(x+ w, y, z);
    f.vertex(x+ w, -y, z);
    
    //top and bottom
    f.vertex(x+ w, -y, 0);
    f.vertex(x+ w, -y, z);
    f.vertex(-x-w, -y, z);
    f.vertex(-x-w, -y, 0);
    
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
