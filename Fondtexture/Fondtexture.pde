
Float Tet = 0.0;


Float a = 0.0;
float branch;

PGraphics pg;
Boolean record = true;


void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width, height, P3D);
}


void draw() {
  background(0);
  a+=0.1;
  Tet = radians(a);


  stroke(255);
  blendMode(ADD);
  smooth();


  // taille rotation tout ca tout ca
  scale(1);
  a +=0.1;
  Tet = radians(a);
  strokeWeight(0.5);

  drawtree(pg);

  // rotateY(-70);
  for (int i = 0; i<30; i++) {
    translate(width/4, height/4) ;
  rotate(20);
    pushMatrix();  
    image(pg, 0, 0);
    image(pg, 30, 300);
    image(pg, 40, 400);
    popMatrix();
    translate(-width, -height);
    rotate(30);

    pushMatrix();  
    image(pg, 0, 0);
    image(pg, 30, 300);
    image(pg, 40, 400);
    popMatrix();
    translate(100, 200);
    rotate(210);
  }
  if (record) {
    saveFrame("Output_Fond/GPHG_#####.png");
    println("record");
  } else {
    // println("not record");
  }
}

//fonction pour l'arbre dans sa "globalité" 

void drawtree(PGraphics pg) {
  // increment pour rotation si jamais
  Float a = 0.0;
  a +=0.01;
  Float z= 100.0;

  pg.beginDraw();
  pg.lights();
  pg.stroke(255);
  pg.background(0);
  pg.pushMatrix();
  // pg.line(0, 0, width, height);
  pg.popMatrix();
  pg.pushMatrix();

  pg.translate(400, 400);
  pg.rotateY(Tet*4);


  // rotation de l'ensemble due l'arbre 
  // pg.rotateZ(a);




  for (int i =0; i<3; i++ ) {

    pg.pushMatrix();
    pg.rotate(i*TWO_PI/3);

    branch(400);
    println(z);
    z+=10;

    pg.popMatrix();
  }


  pg.popMatrix();
  pg.endDraw();
}

// Fonction recursive pour generer les lignes "branches"
void branch(float h) {
  h*=0.55; // ratio de taille des branches ici 66% de la taille de la precedente

  if (h> 1) {


    // Rtation des branches autour du point de fin de ligne precedente 
    //pg.rotateX(Tet); 
    // pg.rotateY(Tet);
    // pg.rotateZ(Tet);

    // creation des Branches Droites

    pg.pushMatrix();
    pg.rotate(Tet*2);
     pg.rotateZ(-Tet);
    //pg.rotateY(-Tet);

    // pg.line(0, 0, 0, -h);
    pg.point(0, -h);
    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();

    //creation des Branches Gauche
    pg.pushMatrix();
    //pg.rotate(-Tet-30);
      pg.rotate(Tet*2);
    pg.rotateY(Tet +30);
    // pg.line(0, 0, 0, -h);
    pg.point(0, -h);

    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();
  }
}


void keyPressed() {
  if (key == 'r'|| key =='R') {
    record = !record;
  }
}