
Float Tet = 0.0;
Float a = 0.0;

float z =0.0;

PGraphics pg; 
Boolean record = false;


void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width, height, P3D);
}

void draw() {
  //background(0);
  a +=0.005;
  Tet = radians(a);

  clock(pg);
  pushMatrix();
  image(pg, 0, 0);

  popMatrix();
  
  
  
  if (record) {
    saveFrame("Output1920*1200/GPHG_#####.png");
    println("record");
  } else {
    // println("not record");
  }
  
  
}

void clock(PGraphics pg) {
  
   if (z >=390){
  z-=390.0;
  
  }else{
    z+=0.5;

  }

  pg.beginDraw();
  pg.background(0,30);
  
  pg.translate(width/2, height/2);
  pg.rotate(a);

  pg.stroke(255);
  for (int i = 0; i< 360; i +=40) {
    for (int j = 0; j< 360; j +=40) {
      pg.pushMatrix(); 

      pg.line(0, 0, z, 0);
      pg.strokeWeight(2);

      pg.popMatrix();
      pg.rotate(10);
    }
  }

  pg.endDraw();
}


void keyPressed() {
  if (key == 'r'|| key =='R') {
    record = !record;
  }
}