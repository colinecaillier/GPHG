
Float Tet = 0.0;


Float a = 0.0;
float branch;

PGraphics pg;
PGraphics pv;
Boolean record = false;
int B = 250;


void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width*2, height, P3D);
  pv = createGraphics(width*2, height, P3D);
  background(0);
}


void draw() {
  background(0, 0.8);
  translate(0, 0);
  stroke(255);
  blendMode(ADD);
  smooth();
  stroke(255);
  strokeWeight(2);
      line(0, height/2, width, height/2);



  // taille rotation tout ca tout ca
  scale(1);
  a +=0.1;
  Tet = radians(a);
  strokeWeight(0.5);

  // affichage 
  drawtree(pg);
  drawtree2(pv);
  

  pushMatrix();
 // scale(0.5);
  strokeWeight(3);
  line(0, height/2, width, height/2);
  image(pg, -width/2, -height/2);
  image(pv, -width/2, height/2);

  popMatrix();

  
  
    if (record){
  saveFrame("OUtputDoubleSphere/GPHG_#####.png");
  println("record");
  } else{
    println("not record");

  }
  
}

//fonction pour l'arbre dans sa "globalité" 

void drawtree(PGraphics pg) {
  // increment pour rotation si jamais
  Float a = 0.0;
  a +=0.01;


  pg.beginDraw();
  pg.lights();
  
  pg.stroke(255);
 // pg.strokeWeight(2);
  pg.background(0);
  pg.pushMatrix();
  pg.translate(width, height);

 // rotation de l'ensemble due l'arbre 
 // pg.rotateZ(a);


  for (int i =0; i<6; i++ ) {

    pg.pushMatrix();

    pg.rotate(i*TWO_PI/6);
    branch(B);
    pg.popMatrix();
  }
  pg.popMatrix();
  pg.endDraw();
}



void drawtree2(PGraphics pv) {
  // increment pour rotation si jamais
  Float a = 0.0;
  a +=0.01;


  pv.beginDraw();
  pv.lights();
  pv.stroke(255);
  pv.background(0);
  pv.pushMatrix();
  pv.translate(width, 0);

 // rotation de l'ensemble due l'arbre 
 // pg.rotateZ(a);


  for (int i =0; i<6; i++ ) {

    pv.pushMatrix();

    pv.rotate(i*TWO_PI/6);
    branch2(B);
    pv.popMatrix();
  }
  pv.popMatrix();
  pv.endDraw();
}

// Fonction recursive pour generer les lignes "branches"
void branch(float h) {
  h*=0.66; // ratio de taille des branches ici 66% de la taille de la precedente

  if (h> 1) {


    // Rtation des branches autour du point de fin de ligne precedente 
    pg.rotateX(Tet); 
   // pg.rotateY(Tet);
     pg.rotateZ(Tet);

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
void branch2(float m) {
  m*=0.66; // ratio de taille des branches ici 66% de la taille de la precedente

  if (m> 1) {


    // Rtation des branches autour du point de fin de ligne precedente 
    pv.rotateX(Tet); 
    // pv.rotateY(Tet);
     pv.rotateZ(Tet);

    // creation des Branches Droites

    pv.pushMatrix();
    pv.rotate(Tet*2);
    pv.rotateY(Tet*2);
        pv.rotateZ(Tet*2);

   pv.line(0, 0, 0, -m);
   // pg.point(0, -h);
    pv.translate(0, -m);
    branch2(m);
    pv.popMatrix();

    //creation des Branches Gauche
    pv.pushMatrix();
    pv.rotate(-Tet*2);
        pv.rotateY(-Tet*2);
        pv.rotateZ(-Tet*2);

    pv.line(0, 0, 0, -m);
    pv.point(0, -m);

    pv.translate(0, -m);
    branch2(m);
    pv.popMatrix();
  }
}


void keyPressed() {
  if (key == 'r'|| key =='R'){
  record = !record;
  
  }
}