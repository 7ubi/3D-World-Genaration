int w, h;
int scl;
int cols, rows;

float maxZ;
float currentY;

void setup(){
  size(600, 600, P3D);
  w = 600;
  h = 1000;
  scl = 20;
  cols = w / scl;
  rows = h / scl;
  
  maxZ = 100;
}

void draw(){
  background(50, 175, 200);
  translate(0, height/4);
  rotateX(45);
  lights();
  
  currentY += 0.005;
  
  float xOff = 0;
  float yOff = currentY;
  
  float[][] terrain = new float[cols][rows];
  
  for(int y = 0; y < rows; y++){
    xOff = 0;
    yOff += 0.2;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = noise(xOff, yOff) * maxZ;
      xOff += 0.2;
    }
  }
  
  //stroke(255);
  //noFill();
  
  stroke(0, 50, 0);
  fill(0, 200, 0);
  
  for(int y = 0; y < rows - 1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
    }
    endShape();
  }
  
}
