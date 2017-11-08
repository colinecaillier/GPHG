Float Tet = 0.0;


Float a = 0.0;
float branch;

PGraphics pg;
Boolean record = false;
  Float g = 0.0;



void setup() {
  size(400, 1000, P3D);
  pg = createGraphics(width, height, P3D);

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

  //  rotate(-70);
  image(pg, -400, -400);

  if (record) {
    saveFrame("OutputPetiteCroissance/GPHG_#####.png");
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
  Float z= 10.0;

  if (g>=200){
  g-=0.1;
  
  }else{
    g+=0.1;

  }
  pg.beginDraw();
  pg.lights();
  pg.stroke(255);
  pg.background(0);
  //    pg.rotate(-30);
      pg.rotateZ(-70);


  pg.pushMatrix();
  //     pg.line(0,0,width,height);
  pg.popMatrix();
  pg.pushMatrix();
  pg.translate(-width/2, 400);
  pg.rotateX(Tet*4);


  // rotation de l'ensemble due l'arbre 
  // pg.rotateZ(a);




  for (int i =0; i<1; i++ ) {


    pg.pushMatrix();
    pg.rotate(i*TWO_PI/3);

    branch(g);
    println(g);
    z+=10;

    pg.popMatrix();
  }


  pg.popMatrix();
  pg.endDraw();
}

// Fonction recursive pour generer les lignes "branches"
void branch(float h) {
  h*=0.56; // ratio de taille des branches ici 66% de la taille de la precedente

  if (h> 1) {


    // Rtation des branches autour du point de fin de ligne precedente 
    pg.rotateX(Tet); 
    // pg.rotateY(Tet);
    //pg.rotateZ(Tet);

    // creation des Branches Droites

    pg.pushMatrix();
    pg.rotate(Tet*2);
    pg.rotateZ(-Tet);

    pg.line(0, 0, 0, -h);
    pg.point(0, -h);
    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();

    //creation des Branches Gauche
    pg.pushMatrix();
    pg.rotate(-Tet-30);
    pg.rotateY(Tet +30);
    pg.line(0, 0, 0, -h);
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