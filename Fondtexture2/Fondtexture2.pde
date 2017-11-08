
Float a = 0.0;
PGraphics pg;
Float Tet = 0.0;


Boolean record = false;

void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width, height,P3D);
}
void draw() {
  //background(0);
 
  voile(pg);
  image(pg, 0,0);

  if (record) {
    saveFrame("Output_Fond2_1920*1200/GPHG_#####.png");
    println("record");
  } else {
    // println("not record");
  }
}

void voile(PGraphics pg){
  pg.beginDraw();
  pg.background(0);
  pg.stroke(255);
  a+=0.3;
  Tet = radians(a);
  pg.strokeWeight(0.4);
  pg.translate(-200, -200);

  pg.noFill();
  for (int i = 0; i <3000; i = i+40) {
    for (int j = 0; j<3000; j = j+40) {      
      pg.triangle(i, j, i+200, j+200, i+a, i-j);
      pg.rotateX(Tet/1000);
      pg.translate(width/1000, height/1000);
    }
    pg.rotateY(Tet/1000);
  }
  pg.rotate (Tet/10000);


pg.endDraw();

}


void keyPressed() {
  if (key == 'r'|| key =='R') {
    record = !record;
  }
}