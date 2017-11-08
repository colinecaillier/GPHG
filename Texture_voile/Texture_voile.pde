
Float a = 0.0;
PGraphics pg;
Float Tet = 0.0;


Boolean record = false;

void setup() {
  size(1920, 1200, P3D);
  pg = createGraphics(width, height, P3D);
}
void draw() {
  background(0);
  stroke(255);
  a+=0.3;
  Tet = radians(a);
  strokeWeight(0.4);
  translate(-200, -200);

  noFill();
  for (int i = 0; i <3000; i = i+40) {
    for (int j = 0; j<3000; j = j+40) {      
      triangle(i, j, i+200, j+200, i+a, i-j);
      rotateX(Tet/1000);
      translate(width/1000, height/1000);
    }
    rotateY(Tet/1000);
  }
  rotate (Tet/10000);

  if (record) {
    saveFrame("Output_Fond2_1920*1200/GPHG_#####.png");
    println("record");
  } else {
    // println("not record");
  }
}


void keyPressed() {
  if (key == 'r'|| key =='R') {
    record = !record;
  }
}