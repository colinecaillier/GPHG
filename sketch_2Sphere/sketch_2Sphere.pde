Float Tet = 0.0;


Float a = 0.0;
float branch;

PGraphics pg;
Boolean record = false;


void setup() {
  size(400, 1000, P3D);
  pg = createGraphics(width*2, height, P3D);

  background(0);
}


void draw() {
  background(0, 0, 0, 0.8);
  translate(400, 400);
  stroke(255);
  blendMode(ADD);
  smooth();


  // taille rotation tout ca tout ca
  scale(1);
  a +=0.1;
  Tet = radians(a);
  strokeWeight(0.5);

  // affichage 
  drawtree(pg);
  pushMatrix();
  scale(0.5);
  image(pg, -800, -800);
    image(pg, -800, 200);

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
  pg.background(0);
  pg.pushMatrix();
  pg.translate(width, height/2);

 // rotation de l'ensemble due l'arbre 
 // pg.rotateZ(a);


  for (int i =0; i<6; i++ ) {

    pg.pushMatrix();

    pg.rotate(i*TWO_PI/6);
    branch(200);
    pg.popMatrix();
  }
  pg.popMatrix();
  pg.endDraw();
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


void keyPressed() {
  if (key == 'r'|| key =='R'){
  record = !record;
  
  }

}