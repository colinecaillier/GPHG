Boolean record = true;

 Float Tet = 0.0;


Float a = 0.0;
float branch;

PGraphics pg;
  Float g = 0.0;


void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width*2, height*2, P3D);

  background(0);
}


void draw() {
  background(0, 0, 0);
//  rotate(degrees(90));
  translate(width/2, height/2);
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
  rotate(degrees(90.49));
  rotate(-2.65);
  image(pg, -height, -420);
  pushMatrix();
  rotate(degrees(182));
  rotate(-0.885);
  image(pg, -height, -420 );
  popMatrix();
  popMatrix();
  




    if (record){
  saveFrame("Output1920*1200/GPHG_######.png");
  println("record");
  } else{
    println("not record");

  }
}

//fonction pour l'arbre dans sa "globalité" 

void drawtree(PGraphics pg) {
  // increment pour rotation si jamais


  g +=0.1;

    
    println(g);
  
  


  pg.beginDraw();
  pg.lights();
  pg.stroke(255);
  pg.background(0);
  pg.pushMatrix();
  pg.translate(2*width/4+width/8, height-height/4);

  // rotation de l'ensemble due l'arbre 
  //pg.rotateZ(a);


  for (int i =0; i<1; i++ ) {

    pg.pushMatrix();

    pg.rotate(i*TWO_PI);
    branch(50+g);
    pg.popMatrix();
  }
  pg.popMatrix();
  pg.endDraw();
  
}

// Fonction recursive pour generer les lignes "branches"
void branch(float h) {
  h*=0.66; // ratio de taille des branches ici 66% de la taille de la precedente

  if (h> 0.4) {


    // Rtation des branches autour du point de fin de ligne precedente 
    //pg.rotateX(Tet); 
    //pg.rotateY(Tet);
//pg.rotateZ(Tet);

    // creation des Branches Droites

    pg.pushMatrix();
    pg.rotate(Tet/10);
    pg.rotateY(Tet);
    pg.strokeWeight(h/40);
    pg.line(0, 0, 0, -h);
    //pg.point(0, -h);
    pg.translate(0, -h);
    branch(h);
    pg.popMatrix();

    //creation des Branches Gauche
    pg.pushMatrix();
    pg.rotate(-Tet/10);
     pg.rotateY(Tet);

    pg.strokeWeight(h/40);

    pg.line(0, 0, 0, -h);
    //pg.point(0, -h);

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