Boolean record = false;

Float R_x =0.0;
Float R_y =0.0;
Float R_z = 0.0;

Float R_x1=0.0;
Float R_y1=0.0;
Float R_z1= 0.0;

int BoxSize = 400;
float SclBox = 0.8;
int StrokeBox = 0;


// Arbre
Float Tet = 0.0;
Float a = 0.0;
float branch;
PGraphics pg;





void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width, height, P3D);
}




void draw() {
  background(0);
  blendMode(ADD);
  a+=0.1;
  Tet = radians(a);

  drawBox1(pg);


  stroke(255);
  strokeWeight(2);

  image(pg, 0, 0);






  if (record) {
    saveFrame("Output1920*1200/GPHG_#####.png");
    println(frameCount + "  R" );
  } else {
    println(frameCount);
  }
}


void drawBox1(PGraphics pg) {
  Float a = 0.0;
  a +=0.01;


  pg.beginDraw();
  pg.lights();
  pg.stroke(255);
  pg.background(0);
  pg.pushMatrix();
  pg.translate(width/2, height/2);

  // rotation de l'ensemble due l'arbre 
  // pg.rotateZ(a);

  for (int i =0; i<12; i++ ) {

    pg.pushMatrix();

    pg.rotate(i*TWO_PI/12);
    branch(400);
    pg.popMatrix();
  }


 // pg.line(0, 0, 0, 100);
  pg.popMatrix();
  pg.endDraw();
}

void branch(float h) {
  h*=0.30; // ratio de taille des branches ici 66% de la taille de la precedente

  if (h> 1) {

    // Rtation des branches autour du point de fin de ligne precedente 
     pg.rotateX(Tet); 
    // pg.rotateY(Tet);
    //pg.rotateZ(Tet);

    // creation des Branches Droites

    pg.pushMatrix();
    pg.rotate(Tet*2);
    pg.line(0, 0, 0, -h);
    // pg.point(0, -h);
    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();

    //creation des Branches Gauche
    pg.pushMatrix();
    pg.rotate(-Tet*2);
    pg.line(0, 0, 0, -h);
    pg.point(0, -h);

    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();
  }
}

//void drawBox11(PGraphics rt) {
//  rt.beginDraw();
//  rt.background(0);
//  rt.pushMatrix();


//  rt.popMatrix();
//  rt.endDraw();
//}

////







void keyPressed() {
  if (key == 'r'|| key =='R') {
    record = !record;
  }
}