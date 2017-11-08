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




//PGraphics renderTarget;
PGraphics renderTarget2;
//PGraphics renderTarget11;
PGraphics renderTarget22;



void setup() {
  size(1920 , 1200, P3D);
  pg = createGraphics(width, height/2, P3D);
  renderTarget2 = createGraphics(width, height/2, P3D);
  //renderTarget11 = createGraphics(width, height/2, P3D);
  renderTarget22 = createGraphics(width, height/2, P3D);
}




void draw() {
  background(0);
  blendMode(ADD);
  a+=0.1;
  Tet = radians(a);

  drawBox1(pg);
  drawBox2(renderTarget2);
  // drawBox11(renderTarget11);
  drawBox22(renderTarget22);

  //drawBox2();

  stroke(255);
  strokeWeight(2);
  // scale(0.2);

  line(0, height/2, width, height/2);
  image(pg, 0, 0);
  //  image(renderTarget11, 0, 0);

  translate(0, height/2);
  image(renderTarget2, 0, 0);
  image(renderTarget22, 0, 0);





  if (record) {
    saveFrame("OutputCube-arbre_1920*1200/GPHG_######.png");
    println("record");
  } else {
    println("not record");
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

  for (int i =0; i<6; i++ ) {

    pg.pushMatrix();

    pg.rotate(i*TWO_PI/6);
    branch(400);
    pg.popMatrix();
  }


  pg.line(0, 0, 0, 100);
  pg.popMatrix();
  pg.endDraw();
}

void branch(float h) {
  h*=0.56; // ratio de taille des branches ici 66% de la taille de la precedente

  if (h> 1) {

    // Rtation des branches autour du point de fin de ligne precedente 
    // pg.rotateX(Tet); 
    // pg.rotateY(Tet);
    //pg.rotateZ(Tet);

    // creation des Branches Droites

    pg.pushMatrix();
    pg.rotate(Tet*2);
  //  pg.line(0, 0, 0, -h);
       pg.strokeWeight(3);

     pg.point(0, -h);
    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();

    //creation des Branches Gauche
    pg.pushMatrix();
    pg.rotate(-Tet*2);
    pg.strokeWeight(3);
   // pg.line(0, 0, 0, -h);
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

void drawBox2(PGraphics rt) {
  rt.beginDraw();
  rt.background(0);

  rt.pushMatrix();
  rt.translate(width/2, height/14);
  rt.noFill();
  //rt.background(0,0,255);
//  rt.strokeWeight(0.4);

  rt.stroke(255);
  rt.scale(SclBox);
  rt.rotateY(R_y1);
  rt.rotateX(R_x1);
  rt.rotateZ(R_z1);
  rt.strokeWeight(1);

  rt.box(BoxSize);

  R_y1 -= 0.0015;
  R_x1 -= 0.001;
  R_z1 -= 0.001;
  if (R_x1 <= -25.0) {
    R_x1 = 0.0;
    R_y1 = 0.0;
  }

  rt.popMatrix();
  rt.endDraw();
}


void drawBox22(PGraphics rt) {
  rt.beginDraw();
  rt.background(0);
  rt.lights();
  rt.pushMatrix();
  rt.translate(width/2, 0);
  rt.fill(255);
  //rt.background(0,0,255);

  rt.stroke(255);
  rt.scale(SclBox);
  rt.strokeWeight(3);
  rt.rotateY(R_y1);
  rt.rotateX(R_x1);

  rt.box(2*BoxSize/3);

  R_y1 -= 0.0020;
  R_x1 -= 0.003;
  if (R_x1 <= -25.0) {
    R_x1 = 0.0;
    R_y1 = 0.0;
  }

  rt.popMatrix();
  rt.endDraw();
}




void keyPressed() {
  if (key == 'r'|| key =='R') {
    record = !record;
  }
}