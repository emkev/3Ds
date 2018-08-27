

class Landscape {

  int scl;           // size of each cell
  int w, h;           // width and height of thingie
  int rows, cols;    // number of rows and columns
  
  float zoff = 0.0;  // perlin noise argument .
                     // a class-level para, and different from xoff and yoff.
  
  float[][] z;       // using an array to store all the height values 


  // unit size ,  and Width of All ,  and Height of All  
  Landscape(int scl_, int w_, int h_) {
    scl = scl_;
    w = w_;
    h = h_;
    cols = w/scl;
    rows = h/scl;
    
    z = new float[cols][rows];
  }
  
  
  // Calculate height values (based off a neural network)
  void calculate() {
    
    float xoff = 0;
    for (int i = 0; i < cols; i++) { 
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        z[i][j] = map(noise(xoff,yoff,zoff),  0,1,  -120,120);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    zoff+=0.01;
    
  }
  
  
  
  // Render landscape as grid of quads
  void render() {
    
    // Every cell is an individual quad
    for (int x = 0; x < z.length-1; x++) {
      
      // among one line 
      beginShape(QUAD_STRIP);
      for (int y = 0; y < z[x].length; y++) {

        // one quad at a time
        // each quad's color is determined by the height value at each vertex
        // (clean this part up)
        
        stroke(0);
        
        float currentElevation = z[x][y];   // height of unit
        float currentShade = map(currentElevation, -120, 120, 0, 255);  // color of unit
        fill(currentShade, 255);      // fill color for unit
        
        // Get current unit location
        float xCoordinate = x*scl-w/2;
        float yCoordinate = y*scl-h/2;
        
        // two point 
        vertex(xCoordinate, yCoordinate, z[x][y]);
        vertex(xCoordinate + scl, yCoordinate, z[x+1][y]);
      
      }
      endShape();
    }
  }

}

