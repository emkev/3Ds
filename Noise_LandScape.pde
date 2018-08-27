
/* base on Daniel Shiffman 's Code
*/

Landscape land;    

float theta = 0.0;


void setup() {

  size(800,600,P3D);

  // Create a landscape object
  //  first para : unit size
  // second para : width of all
  //  third para : height of all
  land = new Landscape(20,800,600);

}


void draw() {

  // Ok, visualize the landscape space
  background(255);
  
  pushMatrix();
  translate(width/2, height/2+20, -160);
  rotateX(PI/3);
  rotateZ(theta);
  land.render(); 
  popMatrix();

  land.calculate();
  
  theta += 0.0025;
}

